## Rootkit技术简介

Linux rootkit 技术:
- 动态链接器劫持 ( LD_PRELOAD)
- Linux 内核模块 (LKM) rootkit
- eBPF rootkit

## base LD_PRELOAD的rootkit

`LD_PRELOAD和/etc/ld.so.preload 的区别`

`/etc/ld.so.preload`是系统范围的配置文件,影响所有进程

`LD_PRELOAD`是一个环境变量,会先于`/etc/ld.so.preload`加载

## References
- [Linux 内核Rootkit技术简介](https://www.freebuf.com/sectool/349135.html)
- [Reptile](https://github.com/f0rb1dd3n/Reptile)
- [Linux rootkits explained – Part 1: Dynamic linker hijacking](https://www.wiz.io/blog/linux-rootkits-explained-part-1-dynamic-linker-hijacking)