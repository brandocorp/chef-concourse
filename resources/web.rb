property :version, String, name_property: true
property :basic_auth_username, String, default: 'concourse'
property :basic_auth_password, String, default: 'changeme'
property :session_signing_key, String, default: '/etc/concourse/session_signing_key'
property :tsa_host_key, String, default: '/etc/concourse/tsa_host_key'
property :tsa_authorized_keys, String, default: '/etc/concourse/tsa_authorized_keys'
property :postgres_data_source, String

action :install do
  remote_file "/usr/local/bin/concourse" do
    source "https://github.com/concourse/concourse/releases/download/v#{version}/concourse_linux_amd64"
    owner 'root'
    group 'root'
    mode '755'
  end

  poise_service_user 'concourse-web'

  directory '/etc/concourse' do
    owner 'concourse-web'
    group 'concourse-web'
    mode '755'
  end

  [tsa_host_key, session_signing_key, tsa_authorized_keys].each do |config|
    file ::File.join(config) do
      owner 'concourse-web'
      group 'concourse-web'
      mode '644'
    end
  end
end

action :enable do
  poise_service 'concourse-web' do
    user 'concourse-web'
    command "/usr/local/bin/concourse web " \
            "--basic-auth-username #{basic_auth_username} " \
            "--basic-auth-password #{basic_auth_password} " \
            "--session-signing-key #{session_signing_key} " \
            "--tsa-host-key #{tsa_host_key} " \
            "--tsa-authorized-keys #{tsa_authorized_keys} " \
            "--postgres-data-source #{postgres_data_source}"
  end
end

action :disable do
  poise_service 'concourse-web' do
    user 'concourse-web'
    command "/usr/local/bin/concourse web " \
            "--basic-auth-username #{basic_auth_username} " \
            "--basic-auth-password #{basic_auth_password} " \
            "--session-signing-key #{session_signing_key} " \
            "--tsa-host-key #{tsa_host_key} " \
            "--tsa-authorized-keys #{tsa_authorized_keys} " \
            "--postgres-data-source #{postgres_data_source}"
    action [:stop, :disable]
  end
end

action :uninstall do
  file "/usr/local/bin/concourse" do
    action :delete
  end

  poise_service_user 'concourse-web' do
    action :remove
  end

  [tsa_host_key, session_signing_key, tsa_authorized_keys].each do |config|
    file ::File.join(config) do
      action :delete
    end

    directory '/etc/concourse' do
      action :delete
    end
  end
end
