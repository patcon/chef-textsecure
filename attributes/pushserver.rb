default['pushserver']['git_repository'] = "https://github.com/WhisperSystems/PushServer.git"
default['pushserver']['git_revision'] = "master"
default['pushserver']['git_dir'] = "/var/opt/pushserver"

default['pushserver']['disable_apn'] = false
default['pushserver']['disable_gcm'] = false

# See: https://github.com/janimo/textsecure-docker/blob/master/config/pushconfig.yml.sample
default['pushserver']['config']['gcm']['senderId'] = nil
default['pushserver']['config']['gcm']['apiKey'] = nil
default['pushserver']['config']['apn']['pushCertificate'] = nil
default['pushserver']['config']['apn']['pushKey'] = nil
default['pushserver']['config']['apn']['voipCertificate'] = nil
default['pushserver']['config']['apn']['voipKey'] = nil
default['pushserver']['config']['redis']['url'] = 'http://localhost:6379'

default['pushserver']['config']['authentication']['servers'] = [{
  name: nil,
  password: nil,
}]

default['pushserver']['config']['server']['applicationConnectors'] = [{
  type: 'http',
  port: 9090,
}]

default['pushserver']['config']['server']['adminConnectors'] = [{
  type: 'http',
  port: 9091,
}]
