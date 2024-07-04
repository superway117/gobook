
## Quickstart

[Father](https://github.com/mav8557/Father) is a short LD_PRELOAD rootkit for Linux. It's designed to be used in a competition environment, and has various standard features:

- Network hiding
- File hiding
- Process hiding
- Local privilege escalation
- Remote accept() hook backdoor
- Time/logic bomb component
- GnuPG signature interception
- Anti-detection

## Installation
To install Father, download the source code and change the configuration options to reflect your desired values. You can set the INSTALL_LOCATION to a file with the STRING prefix to hide the kit on disk.

To compile the kit you'll need to download libgcrypt on your computer. The dynamic linker will resolve all libgcrypt calls (like from GnuPG) to our dynamic library.


## References
- [github Father](https://github.com/mav8557/Father)
 