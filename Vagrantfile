Vagrant.configure(2) do |config|
  config.vm.box = "scotch/box"
  config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.synced_folder "../", "/var/www", :mount_options => ["dmode=777,fmode=666"]
  config.vm.synced_folder "sites/", "/etc/apache2/sites-available"
  config.vm.synced_folder "sites/", "/etc/apache2/sites-enabled"

  # SSH Agent Forwarding
  config.ssh.forward_agent = true
end
