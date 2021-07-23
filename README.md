# CLUSTER K8S COM RANCHER 

Cluster k8s local para laboratório com 5 maquinas virtuais, e rancher em docker.

O vagrant é responsavel por subir as vm's, instalar o docker e rodar o user agent correto baseado no hostname.

## Instalação

### iniciando o rancher

    sudo docker run -d --restart=unless-stopped \
    -p 80:80 -p 443:443 \
    -v /opt/rancher:/var/lib/rancher \
    --privileged \
    rancher/rancher:v2.5.4

### Iniciando as 5 vms

    1. Configure os ips no Vagrantfile
    2. Coloque o token e ca-checksum gerados no rancher

    vagrant up


## Outros

### TODO

    - Usar uma imagem que ja tenha o docker instalado
    - Colocar o token e ca-checksum como ENV ou qq coisa do tipo

### Shell Script para limpar um node rke

As vezes vc faz alguma caca node e precisa limpar e reinstalar ele para se juntar ao cluster. O comando a seguir vai fazer a limpeza do node. Recomenda-se o reboot do host após a limpeza

    wget -O - https://raw.githubusercontent.com/onovaes/clusterk8s-rancher/master/nodes_scripts/limpa_node.sh | bash