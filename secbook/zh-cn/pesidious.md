## QuickStart 

The purpose of the tool is to use artificial intelligence to mutate a malware (PE32 only) sample to bypass AI powered classifiers while keeping its functionality intact. In the past, notable work has been done in this domain with researchers either looking at reinforcement learning or generative adversarial networks as their weapons of choice to modify the states of a malware executable in order to deceive anti-virus agents. Our solution makes use of a combination of deep reinforcement learning and GANs in order to overcome some of the limitations faced while using these approaches independently as showen below.




install

```
wget https://repo.anaconda.com/archive/Anaconda3-2024.06-1-Linux-x86_64.sh  

./Anaconda3-2024.06-1-Linux-x86_64.sh 
```

prepare
```
cd  Pesidious
conda create -n py36 python=3.6 
conda activate py36 
pip install -r pip_requirements/requirements.txt
pip uninstall numpy
pip install numpy==1.16.2
```

build
```
conda create -n py36 python=3.6 
conda activate py36 
cd  Pesidious
pyinstaller --onefile --name Pesidious mutate.py

change Pesidious.spec
datas=[('RES','RES')],
hiddenimports=['sklearn','sklearn.ensemble','sklearn.neighbors.typedefs','sklearn.neighbors.quad_tree','sklearn.tree._utils','scipy._lib.messagestream'],


pyinstaller Pesidious.spec 

```



## References

- [github ]https://github.com/CyberForce/Pesidious)