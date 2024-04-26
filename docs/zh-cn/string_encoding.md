> 


## 判断是否是utf8编码

```go
utf8.ValidString(filename)
```
demo
```go
if utf8.ValidString(filename) { 
    fmt.Println("UTF-8 string") 
} else {
    fmt.Println("not a valid UTF-8 string") 
}
```