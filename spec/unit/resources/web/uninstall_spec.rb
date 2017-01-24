require 'spec_helper'

describe 'test_concourse::web_uninstall' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new(step_into: 'concourse_web')
      .converge(described_recipe)
  end

  it 'removes the concourse binary' do
    expect(chef_run).to delete_file('/usr/local/bin/concourse')
  end

  it 'removes the svc_concourse user' do
    expect(chef_run).to remove_poise_service_user 'svc_concourse'
  end

  it 'deletes its configuration files' do
    [
      '/opt/concourse/tsa_host_key',
      '/opt/concourse/tsa_authorized_keys',
      '/opt/concourse/session_signing_key'
    ].each do |config|
      expect(chef_run).to delete_file(config)
    end
  end
end
