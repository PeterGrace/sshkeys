name 'sshkeys'
maintainer 'The Authors'
maintainer_email 'you@example.com'
license 'All Rights Reserved'
description 'Installs/Configures sshkeys'
long_description 'Installs/Configures sshkeys'
version '0.1.1'
chef_version '>= 12.14' if respond_to?(:chef_version)

depends 'ssh_authorized_keys'
