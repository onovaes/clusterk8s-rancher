servers=[
    {
        :hostname => "master1",
        :ip => "192.168.0.21",
        :ram => 4096,
        :cpu => 2
    },
    {
        :hostname => "worker1",
        :ip => "192.168.0.22",
        :ram => 4096,
        :cpu => 2
    },
  
]
Vagrant.configure(2) do |config|
    servers.each do |machine|
        config.vm.define machine[:hostname] do |node|
            node.vm.box = "ubuntu/xenial64"
            node.vm.hostname = machine[:hostname]
            node.vm.network "public_network", bridge: "eno1" , ip: machine[:ip]
            node.vm.provider "virtualbox" do |vb|
                vb.customize ["modifyvm", :id, "--memory", machine[:ram]]
            end
            node.vm.provision "shell", path: "nodes_scripts/install_docker.sh"
            node.vm.provision "shell", path: "nodes_scripts/run_rancher_agent.sh" , :args => machine[:ip]
        end
    end
end
