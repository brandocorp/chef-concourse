require 'spec_helper'

describe 'test_concourse::web_enable' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new(step_into: 'concourse_web')
      .converge(described_recipe)
  end

  it 'enables and starts the concourse service' do
    expect(chef_run).to enable_poise_service('concourse-web')
  end
end
