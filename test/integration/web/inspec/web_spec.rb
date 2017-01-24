describe file('/usr/local/bin/concourse') do
  it { is_expected.to be_file }
  it { is_expected.to be_executable }
  it { is_expected.to be_owned_by 'root' }
end

describe file('/etc/systemd/system/concourse-web.service') do
  it { is_expected.to be_file }
end

describe user('concourse-web') do
  it { is_expected.to exist }
end

describe file('/etc/concourse') do
  it { is_expected.to be_directory }
  its('mode') { should cmp '0755' }
  it { is_expected.to be_owned_by 'concourse-web' }
end

describe service('concourse-web') do
  it { is_expected.to be_running }
  it { is_expected.to be_running }
end
