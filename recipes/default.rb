#
# Cookbook Name:: hping
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
fullpath = ::File.join(node['hping']['working_dir'], node['hping']['arch_file'])
remote_uri = node['hping']['site_url'] + node['hping']['arch_file']

remote_file fullpath do
  action :create_if_missing
  source remote_uri
  notifies :run, 'bash[make and install]', :immediately
end

bash "make and install" do
  action :nothing
  code <<-EOF
cd #{::File.basename(node['hping']['arch_file'], '.tar.gz')}
./configure #{node['hping']['configure_flags']}
make -j2
make install
EOF
end
