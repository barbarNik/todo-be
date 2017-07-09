# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure('2') do |config|
  config.vm.box = "barbarnik/todo-be"
  config.vm.box_version = "0.1.0"
  config.vm.hostname = 'rails-dev-box'
  config.vm.base_mac = "0263DC46412E"
  config.ssh.username = "ubuntu"
  config.ssh.password = "221c36362c947c7882bd3db1"

  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.network :forwarded_port, guest: 5432, host: 5432

  config.vm.provider 'virtualbox' do |v|
    v.memory = 2048
    v.cpus = 2
    v.customize [ "modifyvm", :id, "--uart1", "0x3F8", "4" ]
    v.customize [ "modifyvm", :id, "--uartmode1", "file", File.join(Dir.pwd, "ubuntu-zesty-17.04-cloudimg-console.log") ]
  end
end
