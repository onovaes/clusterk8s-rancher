#TOKEN E CHECKSUm

servers=[
    {
        :hostname => "master1",
        :ip => "192.168.0.21",
        :ram => 4096,
        :cpu => 4
    },
    {
        :hostname => "master2",
        :ip => "192.168.0.22",
        :ram => 4096,
        :cpu => 4
    },
    {
        :hostname => "master3",
        :ip => "192.168.0.23",
        :ram => 4096,
        :cpu => 4
    },
    {
        :hostname => "worker1",
        :ip => "192.168.0.24",
        :ram => 2048,
        :cpu => 2
    },
    {
        :hostname => "worker2",
        :ip => "192.168.0.25",
        :ram => 2048,
        :cpu => 2
    }
]


Vagrant.configure(2) do |config|
    servers.each do |machine|
        config.vm.define machine[:hostname] do |node|
            node.vm.box = "ubuntu/xenial64"
            node.vm.hostname = machine[:hostname]
            node.vm.network "public_network", bridge: "eno1" , ip: machine[:ip]
            node.vm.provider "virtualbox" do |vb|
                vb.memory = machine[:ram] 
                vb.cpus = machine[:cpu]
                vb.customize ["modifyvm", :id, "--vram", "1"]
            end
            node.vm.provision "shell", path: "nodes_scripts/install_docker.sh"
            node.vm.provision "shell", path: "nodes_scripts/run_rancher_agent.sh" , :args => machine[:ip]
        end
    end
end
