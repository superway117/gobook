
## Quickstart
Windows-PE-Packer_32: 自带readme
ShellProgram_32: PE文件添加区段、添加花指令、对代码段加密、修复重定位、加密IAT
hm-pe-packer_64：这个壳对pe文件进行了全面的重构，readme里有说明链接
upx: upx壳
zupx: 基于upx修改，去掉了upx特征
zupx_EH: 基于upx修改，去掉了upx特征，同时对upx壳头部代码进行简单加密
atom_packer_64：自带readme
xobf：32/64位指令变形壳，免杀效果差，可用于混淆功能代码,详见readme
PeProtector_32：32位指令变形壳，免杀效果差，可用于混淆功能代码
Simple-PE32-Packer：手搓汇编的pe壳，比较难读
theArk_32: 使用RtlDecompressBuffer的压缩壳

以上壳的都是对PE区段进行操作，有的就在原exe区段上进行加密，支持不带.reloc的exe。
有的会把整个exe进行加密或压缩，然后存到新区段，支持带有.reloc的exe。
以上壳的共有特点就是区段有着明显的加壳特征，并且程序入口有着明显的脱壳代码，所以大多只能过部分杀软。


xldr:
该壳对整个pe进行压缩加密存入寄主的资源段，支持带有.reloc的exe。该壳的输出程序中，区段无明显壳特征，程序入口无明显脱壳代码，基本能过所有杀软。
该壳支持多样化的宿主程序，压缩方式，寄存位置，加密密码，所有能够通过以上方式的组合，产生大量不同的加壳输出程序。
该壳后缀定义如下（摘tool\multibuild.lua）：
    local pmap={x86="32", x64="64"}
    local cmap={COMPRESS_API="c", QUICK_LZ="q", RTL_COMPRESS="r", LZMA2="l"}
    local smmap={MAP_PE="m"}
    local rmap={RT_DATA="d", RT_BMP="b"}
    local smap={MFCApplication="ma", WindowsProject="wp", graphstudionext="gs", 
        MarkdownEditor="me", MyChartCtrlTest="mc", notepad2="np", ScintillaTest="st", 
        Merge="mg"
    }





notepad2 ScintillaTest WindowsProject在win7下无法运行

 