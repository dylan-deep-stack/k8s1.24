1.Downlod  packages  dir


2.vim nodes

[kube-master]
k8stest ansible_ssh_pass=test ansible_ssh_host=10.33.60.91
k8stest2 ansible_ssh_pass=test ansible_ssh_host=10.33.60.92
k8stest3 ansible_ssh_pass=test ansible_ssh_host=10.33.60.93

3.install k8s 1.24.17
./deploy.sh install-k8s

4.uninstall k8s 1.24.17
./deploy.sh install-k8s

5.Support os
ctyunos x86    
ctyunos arm64




