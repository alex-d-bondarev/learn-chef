#
# Cookbook:: mydatabase
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

apt_update 'update'

package node['mydatabase']['package_name']

service node['mydatabase']['service_name'] do
  action [:start, :enable]
end

execute 'createdb roux_artists' do
  user 'postgres'
  not_if 'psql --dbname=roux_artists'
end

template node['mydatabase']['template_path'] do
  source 'pg_hba_ubuntu.conf.erb'
  variables(
      database_user: 'database_user'
  )
  notifies :reload, "service[#{node['mydatabase']['service_name']}]", :immediately
end

execute "psql roux_artists -c \"CREATE ROLE database_user PASSWORD 'user_password' SUPERUSER LOGIN; \"" do
  user 'postgres'
  not_if "psql -c '\\du' | grep database_user"
end
