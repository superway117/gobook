> 了解filepath的常用函数

## filepath.Clean

This function applies the Below rules iteratively until no further processing can be done:

- It Replaces multiple Separator elements with a single one.
- If the specified path is an empty string, it returns the string “.”.
- It eliminates each . path name element (the current directory).
- It eliminates each inner .. path name element (the parent directory) along with the non-.. element that precedes it.
- It eliminates .. elements that begin a rooted path: that is, replace “/..” by “/” at the beginning of a path, assuming Separator is ‘/’.

```go

// Golang program to illustrate the usage of 
// filepath.Clean() function 
  
// Including the main package 
package main 
  
// Importing fmt and path/filepath 
import ( 
    "fmt"
    "path/filepath"
) 
  
// Calling main 
func main() { 
  
    // Calling the Clean() function 
    fmt.Println(filepath.Clean("/GFG/./../Geeks")) 
    fmt.Println(filepath.Clean("GFG/../Geeks")) 
    fmt.Println(filepath.Clean("..GFG/./../Geeks")) 
    fmt.Println(filepath.Clean("gfg/../../../Geek/GFG")) 
} 
```

输出
```
/Geeks
Geeks
Geeks
../../Geek/GFG
```

```go

// Golang program to illustrate the usage of 
// filepath.Clean() function 
  
// Including the main package 
package main 
  
// Importing fmt and path/filepath 
import ( 
    "fmt"
    "path/filepath"
) 
  
// Calling main 
func main() { 
  
    // Calling the Clean() function 
    fmt.Println(filepath.Clean("")) 
    fmt.Println(filepath.Clean(".")) 
    fmt.Println(filepath.Clean("///")) 
    fmt.Println(filepath.Clean("/.//")) 
    fmt.Println(filepath.Clean("/./")) 
    fmt.Println(filepath.Clean(":/")) 
} 
```

输出
```bash
.
.
/
/
/
:
```


## filepath.Join
`filepath.Join()` function in Go language used to join any number of the specified path elements into a single path

**函数原型**
```go
func Join(elem ...string) string
```

```go

// Golang program to illustrate the usage of 
// filepath.Join() function 
  
// Including the main package 
package main 
  
// Importing fmt and path/filepath 
import ( 
    "fmt"
    "path/filepath"
) 
  
// Calling main 
func main() { 
  
    // Calling the Join() function 
    fmt.Println(filepath.Join("G", "F", "G")) 
    fmt.Println(filepath.Join("G/F", "G")) 
    fmt.Println(filepath.Join("gfg", "GFG")) 
    fmt.Println(filepath.Join("Geeks", "for", "Geeks")) 
} 
```
输出
```
G/F/G
G/F/G
gfg/GFG
Geeks/for/Geeks
```

```go

// Golang program to illustrate the usage of 
// filepath.Join() function 
  
// Including the main package 
package main 
  
// Importing fmt and path/filepath 
import ( 
    "fmt"
    "path/filepath"
) 
  
// Calling main 
func main() { 
  
    // Calling the Join() function 
    fmt.Println(filepath.Join("/", "/")) 
    fmt.Println(filepath.Join("")) 
    fmt.Println(filepath.Join("a/b", "/c")) 
    fmt.Println(filepath.Join("5", "10")) 
    fmt.Println(filepath.Join(".")) 
  
} 
```
输出
```
/

a/b/c
5/10
.
```

## filepath.Base提取文件名

```
package main

import (
    "fmt"
    "path/filepath"
)

func main() {
    filePath := "/path/to/file.txt" // 替换为实际的文件路径

    fileName := filepath.Base(filePath)
    fmt.Println("文件名:", fileName)
}
```
## References

- [filepath api](https://pkg.go.dev/path/filepath#Clean)
- [filepath-clean-function-in-golang-with-examples](https://www.geeksforgeeks.org/filepath-clean-function-in-golang-with-examples/)