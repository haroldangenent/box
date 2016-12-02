Vagrant.configure(2) do |config|
  config.vm.box = "scotch/box"
  config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.synced_folder "../", "/var/www", :mount_options => ["dmode=777,fmode=666"]
  config.vm.synced_folder "sites/", "/etc/apache2/sites-enabled"

  # Virtualbox config
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", 2048]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end

  # SSH Agent Forwarding
  config.ssh.forward_agent = true

  # Provisioning
  config.vm.provision :shell, inline: "bash /vagrant/config/db/import.sh", run: "always"
  config.vm.provision :shell, inline: "sudo service apache2 reload", run: "always"

  # Triggers
  config.trigger.before [:halt, :destroy] do
    run "vagrant ssh -c 'bash /vagrant/config/db/export.sh'"
  end
end
