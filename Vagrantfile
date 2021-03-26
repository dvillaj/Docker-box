Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/focal64"
  config.vm.hostname = "docker-box"
  config.vm.box_check_update = false

  config.vm.provider "virtualbox" do |vb|
    vb.name = "Docker_Box"
    vb.cpus = 4
    vb.memory = 6048
  end

  # Ports
  config.vm.network :forwarded_port, guest: 22, host: 2240, id: 'ssh'


  config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/me.pub"
  config.vm.provision "shell", inline: <<-SHELL
    cat /home/vagrant/.ssh/me.pub >> /root/.ssh/authorized_keys
    rm /home/vagrant/.ssh/me.pub
  SHELL

 
  config.vm.synced_folder "shared/deploy", "/opt/deploy"
  config.vm.provision "shell", inline: "/opt/deploy/install.sh"

end