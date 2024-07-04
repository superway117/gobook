 
## Quickstart

[Azazel](https://github.com/chokepoint/azazel) is a userland rootkit based off of the original LD_PRELOAD technique from Jynx rootkit. It is more robust and has additional features, and focuses heavily around anti-debugging and anti-detection.


- Anti-debugging
- Avoids unhide, lsof, ps, ldd detection
- Hides files and directories
- Hides remote connections
- Hides processes
- Hides logins
- PCAP hooks avoids local sniffing
- Two accept backdoors.
- Crypthook encrypted accept() backdoor -- Full PTY
- Plaintext accept() backdoor -- Full PTY
- PAM backdoor for local privesc and remote entry
- Log cleanup for utmp/wtmp entries based on pty

## References
- [github azazel](https://github.com/chokepoint/azazel)