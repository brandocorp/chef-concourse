require 'spec_helper'

describe 'test_concourse::web_disable' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new(step_into: 'concourse_web')
      .converge(described_recipe)
  end

  it 'stops and disables the concourse service' do
    expect(chef_run).to stop_poise_service('concourse-web')
    expect(chef_run).to disable_poise_service('concourse-web')
  end
end
