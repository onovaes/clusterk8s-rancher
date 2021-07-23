# CLUSTER K8S COM RANCHER 

Cluster k8s local para laboratório com 5 maquinas virtuais, e rancher em docker



## Shell Script para limpar um node rke

As vezes vc faz alguma caca node e precisa limpar e reinstalar ele para se juntar ao cluster. O comando a seguir vai fazer a limpeza do node. Recomenda-se o reboot do host após a limpeza

    wget -O - https://raw.githubusercontent.com/onovaes/clusterk8s-rancher/master/nodes_scripts/limpa_node.sh | bash