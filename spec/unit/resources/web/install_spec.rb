require 'spec_helper'

describe 'test_concourse::web_install' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new(step_into: 'concourse_web')
      .converge(described_recipe)
  end

  it 'installs the concourse binary' do
    expect(chef_run).to create_remote_file('/usr/local/bin/concourse')
  end

  it 'adds the svc_concourse user' do
    expect(chef_run).to create_poise_service_user 'svc_concourse'
  end

  it 'sets ownership of its configuration files' do
    [
      '/opt/concourse/tsa_host_key',
      '/opt/concourse/tsa_authorized_keys',
      '/opt/concourse/session_signing_key'
    ].each do |config|
      expect(chef_run).to create_file(config)
        .with(owner: 'svc_concourse', group: 'svc_concourse', mode: '644')
    end
  end
end
