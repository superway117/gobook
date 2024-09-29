Ghidra


## install on ubuntu

```
wget https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.deb

sudo apt install ./jdk-21_linux-x64_bin.deb 

wget https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_11.1.2_build/ghidra_11.1.2_PUBLIC_20240709.zip

unzip ghidra_11.1.2_PUBLIC_20240709.zip 


```


add path to bashrc

```
export GHIDRA_HOME=/root/bin/ghidra_11.1.2_PUBLIC
export PATH=$GHIDRA_HOME:$GHIDRA_HOME/support:$PATH

```


mkdir ghidra_project
analyzeHeadless /usr/bin/ls -import /root/workshop/ghidra_project  -scriptPath /root/workshop/GhidraScripts


## References

- [ghidra InstallationGuide](https://ghidra-sre.org/InstallationGuide.html)
- [github ghidra](https://github.com/NationalSecurityAgency/ghidra)