
## Quickstart

[Manalyze](https://github.com/JusticeRage/Manalyze) is  static analysis on PE executables to detect undesirable behavior.

- Identifies a PE's compiler
- Detects packed executables
- Applies ClamAV signatures
- Searches for suspicious strings
- Looks for malicious import combinations (i.e. WriteProcessMemory + CreateRemoteThread)
- Detects cryptographic constants (just like IDA's findcrypt plugin)
- Can submit hashes to VirusTotal
- Verifies authenticode signatures (on Windows only)
 
## References
- [github Manalyze](https://github.com/JusticeRage/Manalyze)
- [Manalyze homepage](https://manalyzer.org/)
- [Manalyze docs](https://docs.manalyzer.org/en/latest/)
 