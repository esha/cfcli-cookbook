#
# Cookbook Name:: cfcli
# Attribute:: default
#

default['cfcli']['base_url'] = 'https://cli.run.pivotal.io/stable?release='

default['cfcli']['arch'] = node['kernel']['machine'] =~ /x86_64/ ? '64' : '32'

case node['platform_family']
when 'mac_os_x'
  default['cfcli']['platform'] = 'macosx'
when 'rhel'
  default['cfcli']['platform'] = 'redhat'
else
  default['cfcli']['platform'] = node['platform_family']
end

default['cfcli']['url'] = "#{node['cfcli']['base_url']}#{node['cfcli']['platform']}#{node['cfcli']['arch']}"
