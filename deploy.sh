#!/bin/bash
#date:2024-03-25
current_dir=$PWD
install_ansible(){
        arch=`uname -m`
        os_distribution=`cat /etc/os-release | grep PRETTY_NAME| awk -F\" '{print $2}'|awk '{print $1}'`
        if [ $arch = 'x86_64' ] && [ $os_distribution = 'ctyunos' ];then
                echo "##########操作系统为:$os_distribution-$arch 安装 Ansible##########"
                cd $current_dir/k8s/x86/rpm;tar xf rpm.tar.gz;yum localinstall -y ansible-2.9.27-4.oe2203.noarch.rpm
        elif [ $arch = 'x86_64' ] && [ $os_distribution = 'CentOS' ];then
                echo "##########操作系统为:$os_distribution-$arch 安装 Ansible##########"

        elif [ $arch = 'aarch64' ] && [ $os_distribution = 'ctyunos' ];then
                echo "##########操作系统为:$os_distribution-$arch 安装Ansible##########"
                cd $current_dir/k8s/arm/rpm;tar xf rpm.tar.gz;yum localinstall -y ansible-2.9.27-4.oe2203.noarch.rpm
        elif [ $arch = 'aarch64' ] && [ $os_distribution = 'CentOS' ];then
                echo "##########操作系统为:$os_distribution-$arch 安装 Ansible##########"
        else
             echo "操作系统不匹配" && exit 1
        fi


        #sed base_dir
        local rl_base_dir=`grep "base_dir" $current_dir/globals.yml |awk -F: '{print $2}'| awk -F\" '{print $2}'`
        sed -i "/base_dir/s#\"$rl_base_dir\"#\"$current_dir\"#g" $current_dir/globals.yml

        #sdn packet dir
        local curr_sdn_packet_dir=`grep "sdn_packet_dir" $current_dir/globals.yml |awk -F: '{print $2}'| awk -F\" '{print $2}'`
        local rel_sdn_packet_dir=`cd $current_dir;cd ..;pwd`
        sed -i "/sdn_packet_dir/s#\"$curr_sdn_packet_dir\"#\"$rel_sdn_packet_dir\"#g" $current_dir/globals.yml



}


install_k8s (){
	cd $current_dir
        ansible-playbook -i $current_dir/nodes  -e @$current_dir/globals.yml -e "action=install" $current_dir/k8s-cluster.yml
}

uninstall_k8s (){
	cd $current_dir
        ansible-playbook -i $current_dir/nodes  -e @$current_dir/globals.yml -e "action=destroy" $current_dir/k8s-cluster.yml
}



usage() {
	    echo "Usage: $0 install-k8s"
	    echo "Usage: $0 uninstall-k8s"
	        exit 1

	}

main() {
    if [ $# -ne 1 ]; then
        usage
    fi
 
    case "$1" in
        install-k8s)
            install_ansible
            install_k8s
            ;;
        uninstall-k8s)
            uninstall_k8s
            ;;
        *)
            usage
            ;;
    esac
}

main "$@"

