#
# Cookbook:: audit-wrapper
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
node.override['audit']['fetcher'] = 'chef-server'
node.override['audit']['reporter'] = 'chef-server-automate'

case node['os']
when 'linux'
  node.override['audit']['profiles'] = [ {"name" => "linux-baseline", "compliance" => "delivery/linux-baseline"}]
when 'windows'
  node.override['audit']['profiles'] = [ {"name" => "windows-baseline", "compliance" => "delivery/windows-baseline"}]
end

include_recipe 'audit'
