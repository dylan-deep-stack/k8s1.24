# 项目名称
k8s v1.24.17版本自动化安装脚本，支持x86 和arm，同时支持x86和arm混合部署,如果需要支持Centos7 或者其它的系统，只需要把ansible-playbook安装上就可以了。
 
## 安装步骤
这部分列出项目的主要功能点。
 
1. Downlod  packages  dir 
```bash
https://pan.baidu.com/s/1kHpbY_gxMqdcdiZO1f7uhw   
7gtc
将以下包，下载的主路径中，然后解压

2. vim nodes
```bash
[kube-master]
k8stest ansible_ssh_pass=test ansible_ssh_host=10.33.60.91
k8stest2 ansible_ssh_pass=test ansible_ssh_host=10.33.60.92
k8stest3 ansible_ssh_pass=test ansible_ssh_host=10.33.60.93

3. install k8s 1.24.17
```bash
./deploy.sh install-k8s

4. uninstall k8s 1.24.17
```bash
./deploy.sh uninstall-k8s

5. Support os
```bash
ctyunos x86
ctyunos arm64 
