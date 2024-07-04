
## Quickstart

[Medusa](https://github.com/ldpreload/Medusa) is a powerful, stealthy, versatile, and, modular rootkit designed to give attackers complete control over Linux systems. Medusa is compiled and ready to be executed as a small ELF executable file, which no means extra building or configuration requirements! Medusa is larger than a few hundred kilobytes in size. Once installed, the rootkit sets up a dynamic linker that modifies the way applications are loaded and executed on the system. At this point the Medusa hooks a plethora of API system calls, library functions and signal handlers to achieve imbreakable and uninterceptable persistence. Medusa intercepts a plethoa of system calls made by all applications on the Medusa infected machine.. Hooking these system calls allows a Medusa to control and modify the behavior when system call is made. For example, with stat() family calls, a user can specify what information should be returned when those calls are made, or make changes to the permissions of files and directories. With access(), the user can control who has permission to what areas of the system. With write(), read(), open(), and their derivatives, Medusa can control what files and directories are accessed by the system, and what data is written to them. Truncate and chmod() / chown() allows for control over how files and directories are manipulated. Pututxline, updwtmp, and pututline are used for managing user logins and account information.

- Process Hiding → Hooks rootkit can intercept the 'kill' function to prevent the user from terminating the rootkit process. By hiding itself from the system, the rootkit can remain undetected and achieve persistence on the system.
File Hiding → Hooks 'stat' and 'readdir' to hide files and directories.
- Network Hiding → Hooks the 'getaddrinfo' function to filter out addresses of remote hosts that it wants to hide. By using these techniques, the rootkit can effectively hide network activity from the user and other programs.
- Anti-Debugging → Also Hooks 'kill' system call can be intercepted to prevent the debugger from sending signals to the rootkit process. By evading debugging, the rootkit can make it more difficult for security researchers to discover and analyze its behavior.
- Auth Logging → Hooks pam_prompt(), pam_vprompt and pam_syslog to log all successful authentications locally, or remotely via SSH to Medusa home directory
- Execution Logging → Hooks syslog() and pam_syslog to log all successful authentications locally, or remotely via SSH to Medusa home directory

## Installation
To install Father, download the source code and change the configuration options to reflect your desired values. You can set the INSTALL_LOCATION to a file with the STRING prefix to hide the kit on disk.

To compile the kit you'll need to download libgcrypt on your computer. The dynamic linker will resolve all libgcrypt calls (like from GnuPG) to our dynamic library.


## References
- [github Father](https://github.com/mav8557/Father)
 