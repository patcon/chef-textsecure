default['pushserver']['install_dir'] = '/opt/whispersystems/pushserver'
default['pushserver']['version'] = '0.9.8'
default['pushserver']['install_method'] = 'jar'

default['pushserver']['git_repository'] = "https://github.com/WhisperSystems/PushServer.git"
default['pushserver']['git_revision'] = "master"
default['pushserver']['git_dir'] = "/var/opt/pushserver"

default['pushserver']['disable_apn'] = false
default['pushserver']['disable_gcm'] = false

# See: https://github.com/janimo/textsecure-docker/blob/master/config/pushconfig.yml.sample
default['pushserver']['config']['gcm']['senderId'] = 000000000000
default['pushserver']['config']['gcm']['apiKey'] = 'DUMMY'
default['pushserver']['config']['apn']['pushCertificate'] = 'DUMMY'
default['pushserver']['config']['apn']['pushKey'] = 'DUMMY'
default['pushserver']['config']['apn']['voipCertificate'] = 'DUMMY'
default['pushserver']['config']['apn']['voipKey'] = 'DUMMY'
default['pushserver']['config']['redis']['url'] = 'http://localhost:6379'

default['pushserver']['config']['authentication']['servers'] = [
  { name: 'whisper', password: 'CHANGEME' },
]

default['pushserver']['config']['server']['applicationConnectors'] = [
  { type: 'http', port: 9090 },
]

default['pushserver']['config']['server']['adminConnectors'] = [
  { type: 'http', port: 9091 },
]
