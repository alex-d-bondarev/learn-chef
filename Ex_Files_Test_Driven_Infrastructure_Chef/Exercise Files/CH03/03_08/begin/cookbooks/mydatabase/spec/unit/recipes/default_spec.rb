#
# Cookbook:: mydatabase
# Spec:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'mydatabase::default' do
  context 'When all attributes are default, on Ubuntu 16.04' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04')
      runner.converge(described_recipe)
    end

    before do
      stub_command("psql --dbname=roux_artists").and_return(false)
      stub_command("psql -c '\\du' | grep database_user")
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    # it 'does something' do
    #   expect(chef_run).to action_resource('name')
    #   expect(chef_run).to_not action_resource('name')
    # end

    it 'installs postgres' do
      expect(chef_run).to install_package('postgresql')
    end

    it 'creates a template for a postgres user' do
     expect(chef_run).to create_template('/etc/postgresql/9.5/main/pg_hba.conf')
    end

    it 'creates the database' do
      expect(chef_run).to run_execute('createdb roux_artists')
    end

    it 'creates the database role' do
      expect(chef_run).to run_execute("psql roux_artists -c \"CREATE ROLE database_user PASSWORD 'user_password' SUPERUSER LOGIN;\"")
    end

  end
end







