Joern 是ShiftLeft公司开发的用于C/C++代码健壮性分析的平台. 其核心思想: 将代码分析问题转化为用Gremlin去遍历存储在Neo4j中的CPG(代码属性图). 其商业产品 Ocular 支持多种语言, 也侧面证明 CPG 作为一种 IR, 是可以解决大部分语言的审计问题.

PS. 静态分析这部分其实可以使用Codeql代替.



## install

```
wget https://github.com/joernio/joern/releases/latest/download/joern-install.sh
chmod +x ./joern-install.sh
sudo ./joern-install.sh

```
## run
```
joern
joern>
```


## References

- [joern website](https://joern.io)
- [joern docs](https://docs.joern.io/)
- [joern installation](https://docs.joern.io/installation/)
- [复活Navex：使用图查询进行代码分析](https://www.freebuf.com/articles/network/236954.html)
- [A set of Code-ql/Joern queries to find vulnerabilities](https://github.com/elManto/StaticAnalysisQueries)