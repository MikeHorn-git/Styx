# frozen_string_literal: true

Vagrant.configure('2') do |config|
  ENV['LC_ALL'] = 'en_US.UTF-8'
  config.vm.box = 'gusztavvargadr/windows-11'
  config.vm.box_version = '2511.0.0'

  # 16,67 mins
  config.vm.boot_timeout = 1000
  config.vm.hostname = 'host'
  config.vm.network 'private_network', type: 'dhcp'

  config.vm.synced_folder '.', '/vagrant', disabled: true
  config.vm.synced_folder 'src', '/src'

  config.vm.provider :libvirt do |libvirt|
    libvirt.memory = '4096'
    libvirt.cpus = 4
    libvirt.default_prefix = 'Styx'
    libvirt.storage_pool_name = 'default'
    libvirt.qemu_use_session = false
    libvirt.keymap = 'en-us'
  end

  config.vm.provider 'virtualbox' do |vb|
    vb.memory = '4096'
    vb.cpus = 4
    vb.name = 'Styx'
    vb.gui = false
    vb.check_guest_additions = false
    vb.customize ['modifyvm', :id, '--clipboard', 'bidirectional']
  end

  config.vm.provider 'vmware_desktop' do |vmware|
    vmware.memory = '4096'
    vmware.cpus = 4
    vmware.gui = false
    vmware.utility_certificate_path = '/opt/vagrant-vmware-desktop/certificates'
  end

  config.vm.provision 'shell', path: 'scripts/setup/Set-AutoLogon.ps1'
  config.vm.provision 'shell', path: 'scripts/setup/Download-EWDK.ps1'
  config.vm.provision 'shell', path: 'scripts/tools/winget.ps1'
end
