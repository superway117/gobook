 
## Quickstart

 The goal of [pe_to_shellcode](https://github.com/hasherezade/pe_to_shellcode) is to provide a possibility to generate PE files that can be injected with minimal effort. It is inspired by Stephen Fewer's ReflectiveDLLInjection - but the difference is that with pe2shc you can add the reflective loading stub post-compilation. Also, the header of the PE file is modified in such a way, that you can start executing the injected buffer from the very beginning - just like you would do with a shellcode. It will automatically find the stub, and continue loading the full PE.

 
## References
- [github pe_to_shellcode](https://github.com/hasherezade/pe_to_shellcode)