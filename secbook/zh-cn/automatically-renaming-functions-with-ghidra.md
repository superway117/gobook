[automatically-renaming-functions-with-ghidra](https://blog.convisoappsec.com/en/automatically-renaming-functions-with-ghidra/)


Oftentimes when reversing a binary file we encounter the scenario where it doesn’t have symbols and end up with a lot of unnamed functions in the disassembler. To make sense of these we usually need to actually reverse engineer each function to understand what they do so we can rename them, specially when dealing with a closed-source, proprietary binary.

However, there are cases where the binary was compiled with debug logging functionality which expose the function names in error messages. In this post we show a practical example of leveraging this to automatically rename functions with their actual names using a Ghidra [2] script.





## References
- [https://www.netgear.com/support/product/rax30/#download](https://www.netgear.com/support/product/rax30/#download)
- [https://ghidra-sre.org/](https://ghidra-sre.org/)
- [https://github.com/ReFirmLabs/binwalk](https://github.com/ReFirmLabs/binwalk)
- [https://spinsel.dev/assets/2020-06-17-ghidra-brainfuck-processor-1/ghidra_docs/language_spec/html/pcoderef.html](https://spinsel.dev/assets/2020-06-17-ghidra-brainfuck-processor-1/ghidra_docs/language_spec/html/pcoderef.html)
- [https://github.com/HackOvert/GhidraSnippets?tab=readme-ov-file#analyzing-function-call-arguments-at-cross-references](https://github.com/HackOvert/GhidraSnippets?tab=readme-ov-file#analyzing-function-call-arguments-at-cross-references)