#
# Cookbook Name:: elaccookbook
# Recipe:: apache
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

include_recipe "php"
include_recipe "php::module_mysql"
include_recipe "apache2"
include_recipe "apache2::mod_php5"

include_recipe "elaccookbook::app"

web_app "wordpress" do
    template "wordpress.conf.erb"
    docroot node['wordpress']['dir']
    server_name node['wordpress']['server_name']
    server_aliases node['wordpress']['server_aliases']
    server_port node['wordpress']['server_port']
    enable true
end