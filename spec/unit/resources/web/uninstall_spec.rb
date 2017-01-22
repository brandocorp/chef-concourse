require 'spec_helper'

describe 'test_concourse::web_uninstall' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new(step_into: 'concourse_web')
      .converge(described_recipe)
  end

  it 'removes the concourse binary' do
    expect(chef_run).to delete_file('/usr/local/bin/concourse')
  end

  it 'removes the concourse-web user' do
    expect(chef_run).to remove_poise_service_user 'concourse-web'
  end

  it 'deletes its configuration files' do
    [
      '/etc/concourse/tsa_host_key',
      '/etc/concourse/tsa_authorized_keys',
      '/etc/concourse/session_signing_key'
    ].each do |config|
      expect(chef_run).to delete_file(config)
    end
  end

  it 'deletes the concourse configuration directory' do
    expect(chef_run).to delete_directory('/etc/concourse')
  end
end
