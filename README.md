# 项目名称
k8s v1.24.17版本自动化安装脚本，支持x86 和arm，同时支持x86和arm混合部署。
 
## 安装步骤
这部分列出项目的主要功能点。
 
1. Downlod  packages  dir 

2. vim nodes
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
