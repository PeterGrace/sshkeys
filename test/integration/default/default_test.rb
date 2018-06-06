# # encoding: utf-8

# Inspec test for recipe sshkeys::default

describe user('pete.grace') do
  it { should exist }
end

describe file('/home/pete.grace/.ssh/authorized_keys') do
  its('mode') { should cmp '0600' }
  its('owner') { should eq 'pete.grace' }
end
