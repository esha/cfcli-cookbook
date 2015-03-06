#
# Cookbook Name:: cfcli
# Spec:: default
#

require 'spec_helper'

describe 'cfcli::default' do
  context 'When all attributes are default, on a CentOS 6.4 system' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '6.4')
      runner.converge(described_recipe)
    end

    before do
      allow(File).to receive(:exist?).and_call_original
      allow(File).to receive(:exist?)
        .with("#{Chef::Config[:file_cache_path]}/cf-cli_amd64.rpm")
        .and_return(false)
    end

    it 'fetches cf-cli package' do
      expect(chef_run).to create_remote_file("#{Chef::Config[:file_cache_path]}/cf-cli_amd64.rpm")
    end

    it 'installs cf-cli package' do
      expect(chef_run).to install_rpm_package("#{Chef::Config[:file_cache_path]}/cf-cli_amd64.rpm")
    end
  end

  context 'When all attributes are default, on an Ubuntu 12.04 system' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '12.04')
      runner.converge(described_recipe)
    end

    before do
      allow(File).to receive(:exist?).and_call_original
      allow(File).to receive(:exist?)
        .with("#{Chef::Config[:file_cache_path]}/cf-cli_amd64.deb")
        .and_return(false)
    end

    it 'fetches cf-cli package' do
      expect(chef_run).to create_remote_file("#{Chef::Config[:file_cache_path]}/cf-cli_amd64.deb")
    end

    it 'installs cf-cli package' do
      expect(chef_run).to install_dpkg_package("#{Chef::Config[:file_cache_path]}/cf-cli_amd64.deb")
    end
  end
end
