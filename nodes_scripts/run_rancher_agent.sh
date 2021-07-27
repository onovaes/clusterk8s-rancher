#/bin/bash

# RECEBE O IP, RANCHER TOKEN E CHECKUM POR ARGUMENTO
IP_EXTERNAL=$1
echo 'IP EXTERNO='$IP_EXTERNAL

RANCHER_TOKEN=$2
echo 'RANCHER_TOKEN='$RANCHER_TOKEN

RANCHER_CA_CHECKSUM=$3
echo 'RANCHER_CA_CHECKSUM='$RANCHER_CA_CHECKSUM



# SE O HOSTNAME TEM MASTER NO NOME INSTALA SOMENTE O ETCD E CONTROLPLANE
if [[ $(hostname) == *"master"* ]]; then
  FUNCAO="--etcd --controlplane"
else
  FUNCAO="--worker"
fi

# Aguardar alguns segundos antes de rodar o rancher agent no work1. Para garantir que pelo menos 1 master' esteja pronto
if [[ $(hostname) == *"worker1"* ]]; then
  TIME_TO_SLEEP=350
  echo "Aguardando $TIME_TO_SLEEP antes de iniciar a instalação do primeiro worker"
  sleep $TIME_TO_SLEEP
fi



#EXECUTA O RANCHER AGENT NO NODE
sudo docker run -d --privileged --restart=unless-stopped --net=host -v /etc/kubernetes:/etc/kubernetes \
-v /var/run:/var/run rancher/rancher-agent:v2.5.4 --server https://192.168.0.184 \
--token $RANCHER_TOKEN --ca-checksum $RANCHER_CA_CHECKSUM \
--address $IP_EXTERNAL  $FUNCAO