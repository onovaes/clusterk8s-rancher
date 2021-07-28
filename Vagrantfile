# BEGIN - PREENCHA AS CONFIGURACOES CONFORME SEU AMBIENTE

RANCHER_TOKEN="tk99hghfmbf4n2nh8vz66glpskkvvlbrh7vw6fckq9r66s6pskw8hx"
RANCHER_CA_CHECKSUM="808da33e4d8ffdbf8b61b444afbd8f83c17f3a63c3ac03131ef9abe50ddf7540"

servers=[
    {
        :hostname => "master1",
        :ip => "192.168.0.21",
        :ram => 4096,
        :cpu => 4
    },
    {
        :hostname => "worker1",
        :ip => "192.168.0.22",
        :ram => 4096,
        :cpu => 2
    },
    {
        :hostname => "worker2",
        :ip => "192.168.0.23",
        :ram => 4096,
        :cpu => 2
    }
]

# END - PREENCHA AS CONFIGURACOES CONFORME SEU AMBIENTE


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
            ip_machine=machine[:ip]
            node.vm.provision "shell", path: "nodes_scripts/install_docker.sh"
            node.vm.provision "shell", path: "nodes_scripts/run_rancher_agent.sh" , :args => [machine[:ip], RANCHER_TOKEN, RANCHER_CA_CHECKSUM]
        end
    end
end
