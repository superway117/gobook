在windows上执行有关系统设置命令的时候需要管理员权限才能操作，比如修改网卡的禁用、启用状态。双击执行是不能正确执行命令的，只有右键以管理员身份运行才能成功。

为解决此问题，最终找到一个简单的方法，双击也能执行成功了。过程如下：

1> go get github.com/akavel/rsrc

2> 把nac.manifest 文件拷贝到当前windows项目根目录

3> rsrc -manifest nac.manifest -o nac.syso

4> go build

nac.manifest的内容为：
 
> https://blog.csdn.net/hejingdong123/article/details/105070150

