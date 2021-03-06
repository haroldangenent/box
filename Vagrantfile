Vagrant.configure(2) do |config|
  config.vm.box = "scotch/box"
  config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.synced_folder "../", "/var/www", :mount_options => ["dmode=777,fmode=777"]
  config.vm.synced_folder "sites/", "/etc/apache2/sites-enabled"

  # Virtualbox config
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", 2048]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end

  # SSH Agent Forwarding
  config.ssh.forward_agent = true

  # Fix no tty, see mitchellh/vagrant#1673
  config.vm.provision "fix-no-tty", type: "shell" do |s|
      s.privileged = false
      s.inline = "sudo sed -i '/tty/!s/mesg n/tty -s \\&\\& mesg n/' /root/.profile"
  end

  # Provisioning
  config.vm.provision :shell, inline: "bash /vagrant/provision/php/install-php7.sh"
  config.vm.provision :shell, inline: "bash /vagrant/provision/php/xdebug.sh"
  config.vm.provision :shell, inline: "bash /vagrant/provision/ssl/enable.sh"
  config.vm.provision :shell, privileged: false, inline: "bash /vagrant/provision/tools/bundler.sh"
  config.vm.provision :shell, inline: "bash /vagrant/provision/tools/composer.sh"
  config.vm.provision :shell, inline: "bash /vagrant/provision/tools/subversion.sh"
  config.vm.provision :shell, inline: "bash /vagrant/provision/tools/webgrind.sh"
  config.vm.provision :shell, inline: "bash /vagrant/provision/tools/wp-cli.sh"
  config.vm.provision :shell, inline: "bash /vagrant/provision/db/import.sh"
  config.vm.provision :vhosts, type: :shell, inline: "bash /vagrant/provision/vhosts/load.sh", run: "always"

  # Triggers
  config.trigger.after [:up, :provision] do |trigger|
    trigger.run = { path: "./provision/vhosts/hosts-add.sh" }
  end

  askedBackup = false

  config.trigger.before [:halt, :destroy] do |trigger|
    if !askedBackup && (ARGV[0] == 'halt' || ARGV[0] == 'destroy')
      askedBackup = true
      print 'Would you like to back-up all databases? [Y/n] '
      answer = STDIN.gets.chomp

      unless answer == 'n' || answer == 'N'
        trigger.run = { path: "./provision/db/export-and-hosts.sh" }
      else
        trigger.run = { path: "./provision/vhosts/hosts-clean.sh" }
      end
    end
  end
end
