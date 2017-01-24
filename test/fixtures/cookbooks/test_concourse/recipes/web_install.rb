directory '/opt/concourse' do
  mode '755'
end

['tsa_host_key', 'session_signing_key', 'tsa_authorized_keys' ].each do |f|
  cookbook_file ::File.join('/opt/concourse', f) do
    source f
    owner 'concourse-web'
    group 'concourse-web'
    mode '644'
  end
end

concourse_web '2.6.0' do
  service_account 'concourse-test'
  tsa_host_key '/opt/concourse/tsa_host_key'
  session_signing_key '/opt/concourse/session_signing_key'
  tsa_authorized_keys '/opt/concourse/tsa_authorized_keys'
  action :install
end
