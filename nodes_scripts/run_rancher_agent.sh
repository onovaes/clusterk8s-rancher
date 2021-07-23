#/bin/bash

RANCHER_TOKEN=kn7njbnxtkck2dhnrpnztp2w9xl8qzv6rgcljn5hxpcqx62j6g98sc
RANCHER_CA_CHECKSUM=9652909e87e5707f2561cf8c1ad4ffa491bbc3deacae1b67e30c09639a7b779f

INTERNAL_IP=$(hostname -I | awk '{print $1}')
echo 'IP INTERNO'
echo $INTERNAL_IP


sudo docker run -d --privileged --restart=unless-stopped --net=host -v /etc/kubernetes:/etc/kubernetes \
-v /var/run:/var/run rancher/rancher-agent:v2.5.4 --server https://192.168.0.184 \
--token $RANCHER_TOKEN --ca-checksum $RANCHER_CA_CHECKSUM \
--address 192.168.0.20 --internal-address $INTERNAL_IP --etcd --controlplane --worker