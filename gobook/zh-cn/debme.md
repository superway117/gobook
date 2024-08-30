## QuickStart

  * Get an `embed.FS` from an embedded subdirectory
  * Handy `Copy(sourcePath, targetPath)` method to copy an embedded file to the filesystem
  * 100% `embed.FS` compatible
  * 100% code coverage

## Example

```go
package main

import (
  "embed"
  "github.com/leaanthony/debme"
  "io/fs"
)

// Example Filesystem:
//
// fixtures/
// ├── test1
// |   └── onefile.txt
// └── test2
//     └── inner
//         ├── deeper
//         |   └── three.txt
//         ├── one.txt
//         └── two.txt

//go:embed fixtures
var fixtures embed.FS

func main() {
  root, _ := debme.FS(fixtures, "fixtures")

  // Anchor to "fixtures/test1"
  test1, _ := root.FS("test1")
  files1, _ := test1.ReadDir(".")

  println(len(files1)) // 1
  println(files1[0].Name()) // "onefile.txt"

  // Anchor to "fixtures/test2/inner"
  inner, _ := root.FS("test2/inner")
  one, _ := inner.ReadFile("one.txt")

  println(string(one)) // "1"

  // Fully compatible FS
  fs.WalkDir(inner, ".", func(path string, d fs.DirEntry, err error) error {
    if err != nil {
      return err
    }
    println("Path:", path, " Name:", d.Name())
    return nil
  })

  /*
    Path: .  Name: inner
    Path: deeper  Name: deeper
    Path: deeper/three.txt  Name: three.txt
    Path: one.txt  Name: one.txt
    Path: two.txt  Name: two.txt
  */
  
  // Go deeper
  deeper, _ := inner.FS("deeper")
  deeperFiles, _ := deeper.ReadDir(".")

  println(len(deeperFiles)) // 1
  println(files1[0].Name()) // "three.txt"
  
  // Copy files
  err := deeper.Copy("three.txt", "/path/to/target.txt")
}
```
 
## References

- [github debme](https://github.com/leaanthony/debme)