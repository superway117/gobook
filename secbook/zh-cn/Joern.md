Joern 是ShiftLeft公司开发的用于C/C++代码健壮性分析的平台. 其核心思想: 将代码分析问题转化为用Gremlin去遍历存储在Neo4j中的CPG(代码属性图). 其商业产品 Ocular 支持多种语言, 也侧面证明 CPG 作为一种 IR, 是可以解决大部分语言的审计问题.

PS. 静态分析这部分其实可以使用Codeql代替.




## References

- [复活Navex：使用图查询进行代码分析](https://www.freebuf.com/articles/network/236954.html)