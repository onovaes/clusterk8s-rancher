#/bin/bash

RANCHER_TOKEN=vl58rthkhcqf54hmzz4frzg4lzj8bbv4nvcmxhtwh959vp46lbzcsq
RANCHER_CA_CHECKSUM=9652909e87e5707f2561cf8c1ad4ffa491bbc3deacae1b67e30c09639a7b779f



# SE O HOSTNAME TEM MASTER NO NOME INSTALA SOMENTE O ETCD E CONTROLPLANE
if [[ $(hostname) == *"master"* ]]; then
  FUNCAO="--etcd --controlplane"
else
  FUNCAO="--worker"
fi

# RECEBE O IP POR ARGUMENTO
IP_EXTERNAL=$1
echo 'IP EXTERNO='$IP_EXTERNAL


#EXECUTA O RANCHER AGENT NO NODE
sudo docker run -d --privileged --restart=unless-stopped --net=host -v /etc/kubernetes:/etc/kubernetes \
-v /var/run:/var/run rancher/rancher-agent:v2.5.4 --server https://192.168.0.184 \
--token $RANCHER_TOKEN --ca-checksum $RANCHER_CA_CHECKSUM \
--address $IP_EXTERNAL  $FUNCAO