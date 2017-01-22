require 'spec_helper'

describe 'test_concourse::web_install' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new(step_into: 'concourse_web')
      .converge(described_recipe)
  end

  it 'installs the concourse binary' do
    expect(chef_run).to create_remote_file('/usr/local/bin/concourse')
  end

  it 'adds the concourse-web user' do
    expect(chef_run).to create_poise_service_user 'concourse-web'
  end

  it 'creates the concourse configuration directory' do
    expect(chef_run).to create_directory('/etc/concourse')
      .with(owner: 'concourse-web', group: 'concourse-web', mode: '755')
  end

  it 'sets ownership of its configuration files' do
    [
      '/etc/concourse/tsa_host_key',
      '/etc/concourse/tsa_authorized_keys',
      '/etc/concourse/session_signing_key'
    ].each do |config|
      expect(chef_run).to create_file(config)
        .with(owner: 'concourse-web', group: 'concourse-web', mode: '644')
    end
  end
end
