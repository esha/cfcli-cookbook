#
# Cookbook Name:: cfcli
# Recipe:: default
#

if %w(debian redhat).include?(node['cfcli']['platform'])
  if node['cfcli']['arch'] == '64'
    arch = 'amd64'
  else
    arch = 'i386'
  end

  if node['cfcli']['platform'] == 'debian'
    ext = 'deb'
  else
    ext = 'rpm'
  end

  package_name = "#{Chef::Config[:file_cache_path]}/cf-cli_#{arch}.#{ext}"

  remote_file package_name do
    source node['cfcli']['url']
  end

  if node['cfcli']['platform'] == 'debian'
    dpkg_package package_name do
      action :install
    end
  else
    rpm_package package_name do
      action :install
    end
  end
end
