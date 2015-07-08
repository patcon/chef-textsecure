default['pushserver']['install_method'] = 'jar'

# install_method: jar
# See: https://circleci.com/gh/patcon/PushServer
default['pushserver']['jar_download_url'] = 'https://circle-artifacts.com/gh/patcon/PushServer/3/artifacts/0/tmp/circle-artifacts.ZXImEEt/Push-Server-0.9.8-capsule-fat.jar'

# install_method: source
default['pushserver']['version'] = '0.9.8'
default['pushserver']['git_repository'] = "https://github.com/WhisperSystems/PushServer.git"
default['pushserver']['git_revision'] = "master"
default['pushserver']['git_dir'] = "/home/textsecure/pushserver"
default['pushserver']['disable_apn'] = false
default['pushserver']['disable_gcm'] = false

# common
default['pushserver']['install_dir'] = '/opt/whispersystems/pushserver'

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
