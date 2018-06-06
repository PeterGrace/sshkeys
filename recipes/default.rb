#
# Cookbook:: sshkeys
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

# Get a list of users and their ssh keys from a databag
# databag format:
# {
#   "id": "users",
#   "bob@acme.com": {
#     "key": "AAAAB3NzaC1yc2EAAAADAQABAAABAQCctNyRouVDhzjiP[...]",
#     "user": "root"
#   },
#   "alice@acme.com": {
#     "key": "AAAAB3NzaC1yc2EAAAADAQABAAABAQCySLKbpFRGCrKU/[...]",
#     "user": "alice"
#   }
# }
users = data_bag_item('ssh', 'users')

#delete id from lookup data, it's irrelevant
users.delete('id')

users.each do |name, ssh_key|
    user ssh_key['user'] do
        action :create
    end
    ssh_authorize_key name do
        key ssh_key['key']
        user ssh_key['user']
    end
end

