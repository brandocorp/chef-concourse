describe file('/usr/local/bin/concourse') do
  it { is_expected.to be_file }
  it { is_expected.to be_executable }
  it { is_expected.to be_owned_by 'root' }
end

describe file('/etc/systemd/system/concourse-web.service') do
  it { is_expected.to be_file }
end

describe user('svc_concourse') do
  it { is_expected.to exist }
end
