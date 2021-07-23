#DEFINIR HOSTNAME
#aumentar menoria para 2 GB por node
# INSTALAR DOCKER (script ja criado)



#Vagrant.configure("2") do |config|
#    config.vm.box = "ubuntu/xenial64"
#    config.vm.network "public_network", bridge: "eno1" , ip: "192.168.0.20"
#  end
  

servers=[
{
    :hostname => "master1",
    :ip => "192.168.0.20",
    :box => "ubuntu/xenial64",
    :ram => 4096,
    :cpu => 2
}
]
Vagrant.configure(2) do |config|
    servers.each do |machine|
        config.vm.define machine[:hostname] do |node|
            system('./nodes_scripts/install_docker.sh')
            node.vm.box = machine[:box]
            node.vm.hostname = machine[:hostname]
            node.vm.network "public_network", bridge: "eno1" , ip: machine[:ip]
            node.vm.provider "virtualbox" do |vb|
                vb.customize ["modifyvm", :id, "--memory", machine[:ram]]
            end
            node.vm.provision "shell", path: "nodes_scripts/install_docker.sh"
            node.vm.provision "shell", path: "nodes_scripts/run_rancher_agent.sh"
        end
    end
end
