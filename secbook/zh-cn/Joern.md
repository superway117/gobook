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

- [joern github](https://github.com/joernio/joern) 
- [Code Property Graph Specification](https://cpg.joern.io/) 
- [joern website](https://joern.io) 
- [joern docs](https://docs.joern.io/)
- [joern installation](https://docs.joern.io/installation/)
- [
深入浅出Joern（一）Joern与CPG是什么？](https://lorexxar.cn/2023/08/21/joern-and-cpg/)
[深入浅出Joern（二）CPG与图数据库](https://lorexxar.cn/2023/08/22/joern2/)
[
深入浅出Joern（三）Joern和Neo4j常用语法大全](https://lorexxar.cn/2023/08/24/joern3/)
- [复活Navex：使用图查询进行代码分析](https://www.freebuf.com/articles/network/236954.html)
- [A set of Code-ql/Joern queries to find vulnerabilities](https://github.com/elManto/StaticAnalysisQueries)
- [reference-card](https://docs.joern.io/cpgql/reference-card/)
- [node-type-steps](https://docs.joern.io/cpgql/node-type-steps/)



