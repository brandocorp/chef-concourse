directory '/opt/concourse' do
  mode '755'
end

['tsa_host_key', 'session_signing_key', 'tsa_authorized_keys' ].each do |f|
  cookbook_file ::File.join('/opt/concourse', f) do
    source f
  end
end

concourse_web '2.6.0' do
  service_account 'svc_concourse'
  tsa_host_key '/opt/concourse/tsa_host_key'
  session_signing_key '/opt/concourse/session_signing_key'
  tsa_authorized_keys '/opt/concourse/tsa_authorized_keys'
  action :install
end
