## 风险函数查询

使用`cpg.method`可以查询所有的函数。


```
cpg.method("(?i)gets").callIn.l
```
等同
```
cpg.method.name("(?i)gets").callIn.l
```
- `(?i)gets`表示忽略大小写
- 这个表达式会查找所有方法名中包含忽略大小写的"gets"的方法，即gets方法。
然后使用 callIn 方法来查找调用这些方法的位置。


example
```
val code = """
int insecure_gets() {
  char str[DST_BUFFER_SIZE];
  gets(str);
  printf("%s", str);
  return 0;
}
"""

importCode.c.fromString(code)


cpg.method("(?i)gets").callIn.l
```
函数存在`gets`所以命中

```
joern> ({cpg.method("(?i)gets").callIn}).l
     | 
val res12: List[io.shiftleft.codepropertygraph.generated.nodes.Call] = List(
  Call(
    argumentIndex = -1,
    argumentName = None,
    code = "gets(str)",
    columnNumber = Some(value = 3),
    dispatchType = "STATIC_DISPATCH",
    dynamicTypeHintFullName = IndexedSeq(),
    lineNumber = Some(value = 4),
    methodFullName = "gets",
    name = "gets",
    order = 3,
    possibleTypes = IndexedSeq(),
    signature = "",
    typeFullName = "ANY"
  )
)

```
看另外的例子
```
val code = """
int secure_gets() {
  FILE *fp;
  fp = fopen("file.txt" , "r");
  char str[DST_BUFFER_SIZE];
  fgets(str, DST_BUFFER_SIZE, fp);
  printf("%s", str);
  return 0;
}
"""
importCode.c.fromString(code)

cpg.method("(?i)gets").callIn.l
```
函数不存在`gets`所以未命中
```
val res15: List[io.shiftleft.codepropertygraph.generated.nodes.Call] = List()
```

##  Copy loop detected

For (buf, indices) pairs, determine those inside control structures (for, while, if ...) where any of the calls made outside of the body (block) are Inc operations. Determine the first argument of that Inc operation and check if they are used as indices for the write operation into the buffer.

example
```
val code = """
int index_into_dst_array (char *dst, char *src, int offset) {
  for(i = 0; i < strlen(src); i++) {
    dst[i + + j*8 + offset] = src[i];
  }
}
"""

importCode.c.fromString(code)

({cpg.assignment.target.arrayAccess
  .map { access =>
    (access.array, access.subscript.code.toSet)
  }
  .filter { case (buf, subscripts) =>
    val incIdentifiers = buf.inAst.isControlStructure.astChildren
      .filterNot(_.isBlock)
      .assignment
      .target
      .code
      .toSet
    (incIdentifiers & subscripts).nonEmpty
  }
  .map(_._1)}).l
```

`cpg.assignment`可以通过`cpg.help`查看,它是`Node-Type Step`, which are atomic traversals to all nodes of a given type

```
joern> cpg.help
val res24: String = """Available starter steps:

.assignment  ==> All assignments, including shorthand assignments that perform arithmetic (e.g., '+=')   
```

`cpg.assignment.target`可以通过`cpg.assignment.help`查看

```
joern> cpg.assignment.help
val res25: String = """Available steps for `Call`:

.array        ==> The expression representing the array   
.target       ==> Left-hand sides of assignments
```

`cpg.assignment.target.help`来查看`cpg.assignment.target.arrayAccess`

```
joern> cpg.assignment.target.help
val res26: String = """Available steps for `Expression`:

.and           ==> only preserves elements for which _all of_ the given traversals have at least one result
.arrayAccess   ==> Outer-most array access   
.arrayAccess   ==> All array accesses 
```


1. cpg.assignment.target.arrayAccess：首先从CPG中选择目标为数组访问的赋值语句。
2. map { access => (access.array, access.subscript.code.toSet) }：对每一个数组访问的赋值语句，将数组和下标的代码表示转换为集合形式，形成一个元组。
3. filter { case (buf, subscripts) => ... }：使用筛选条件，对每个（数组，下标集合）元组进行过滤。
4. 在过滤条件中：
  - buf.inAst.isControlStructure.astChildren：获取当前数组访问目标在AST中的控制结构的子节点。
  - filterNot(_.isBlock)：过滤掉是代码块的子节点。
  - assignment.target.code.toSet：获取子节点中赋值的目标的代码表示，并转换为集合。
  - (incIdentifiers & subscripts).nonEmpty：计算赋值目标中的标识符和下标集合的交集，若不为空，则保留。
5. map(_._1)：最终将筛选后的数组返回,`_._1`表示取元组中的第一个元素