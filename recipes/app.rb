#
# Cookbook Name:: elaccookbook
# Recipe:: app
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

::Chef::Recipe.send(:include, Opscode::OpenSSL::Password)
node.set_unless['wordpress']['keys']['auth'] = secure_password
node.set_unless['wordpress']['keys']['secure_auth'] = secure_password
node.set_unless['wordpress']['keys']['logged_in'] = secure_password
node.set_unless['wordpress']['keys']['nonce'] = secure_password
node.set_unless['wordpress']['salt']['auth'] = secure_password
node.set_unless['wordpress']['salt']['secure_auth'] = secure_password
node.set_unless['wordpress']['salt']['logged_in'] = secure_password
node.set_unless['wordpress']['salt']['nonce'] = secure_password
node.save unless Chef::Config[:solo]

directory node['wordpress']['dir'] do
  action :create
  recursive true
  owner node['wordpress']['install']['user']
  group node['wordpress']['install']['group']
  mode  '00755'
end

tar_extract node['wordpress']['url'] do
  target_dir node['wordpress']['dir']
  creates File.join(node['wordpress']['dir'], 'index.php')
  user node['wordpress']['install']['user']
  group node['wordpress']['install']['group']
  tar_flags [ '--strip-components 1' ]
  not_if { ::File.exists?("#{node['wordpress']['dir']}/index.php") }
end

template "#{node['wordpress']['dir']}/wp-config.php" do
  source 'wp-config.php.erb'
  mode node['wordpress']['config_perms']
  variables(
    :db_name           => node['wordpress']['db']['name'],
    :db_user           => node['wordpress']['db']['user'],
    :db_password       => node['wordpress']['db']['password'],
    :db_host           => node['wordpress']['db']['host'],
    :table_prefix      => node['wordpress']['db']['table_prefix'],
    :db_charset        => node['wordpress']['db']['charset'],
    :db_collate        => node['wordpress']['db']['collate'],
    :auth_key          => node['wordpress']['keys']['auth'],
    :secure_auth_key   => node['wordpress']['keys']['secure_auth'],
    :logged_in_key     => node['wordpress']['keys']['logged_in'],
    :nonce_key         => node['wordpress']['keys']['nonce'],
    :auth_salt         => node['wordpress']['salt']['auth'],
    :secure_auth_salt  => node['wordpress']['salt']['secure_auth'],
    :logged_in_salt    => node['wordpress']['salt']['logged_in'],
    :nonce_salt        => node['wordpress']['salt']['nonce'],
    :wp_config_options => node['wordpress']['wp_config_options']
  )
  owner node['wordpress']['install']['user']
  group node['wordpress']['install']['group']
  action :create
end