default['textsecure']['git_repository'] = "https://github.com/WhisperSystems/TextSecure-Server.git"
default['textsecure']['git_revision'] = "master"
default['textsecure']['git_dir'] = "/var/opt/textsecure-server"

normal['java']['jdk_version'] = "7"

default['textsecure']['dbuser'] = "textsecure"
default['textsecure']['dbpass'] = node['postgresql']['password']['postgres']

default['textsecure']['config']['twilio']['accountId'] = nil
default['textsecure']['config']['twilio']['accountToken'] = nil
default['textsecure']['config']['twilio']['number'] = nil
default['textsecure']['config']['twilio']['localDomain'] = nil
default['textsecure']['config']['twilio']['international'] = nil
default['textsecure']['config']['nexmo']['apiKey'] = nil
default['textsecure']['config']['nexmo']['apiSecret'] = nil
default['textsecure']['config']['nexmo']['number'] = nil
default['textsecure']['config']['gcm']['senderId'] = nil
default['textsecure']['config']['gcm']['apiKey'] = nil
default['textsecure']['config']['apn']['certificate'] = nil
default['textsecure']['config']['apn']['key'] = nil
default['textsecure']['config']['s3']['accessKey'] = nil
default['textsecure']['config']['s3']['accessSecret'] = nil
default['textsecure']['config']['s3']['attachmentsBucket'] = nil
default['textsecure']['config']['redis']['url'] = nil
default['textsecure']['config']['federation']['name'] = nil
default['textsecure']['config']['federation']['peers'] = [{
  name: nil,
  url: nil,
  authenticationToken: nil,
  certificate: nil,
}]
default['textsecure']['config']['graphite']['host'] = nil
default['textsecure']['config']['graphite']['port'] = nil

db_url = "jdbc:postgresql://localhost:#{node['postgresql']['config']['port']}"

default['textsecure']['config']['database']['driverClass'] = "org.postgresql.Driver"
default['textsecure']['config']['database']['user'] = node['textsecure']['dbuser']
default['textsecure']['config']['database']['password'] = node['textsecure']['dbpass']
default['textsecure']['config']['database']['url'] = "#{db_url}/accountdb"
default['textsecure']['config']['database']['properties']['charSet'] = "UTF-8"
default['textsecure']['config']['messageStore']['driverClass'] = "org.postgresql.Driver"
default['textsecure']['config']['messageStore']['user'] = node['textsecure']['dbuser']
default['textsecure']['config']['messageStore']['password'] = node['textsecure']['dbpass']
default['textsecure']['config']['messageStore']['url'] = "#{db_url}/messagedb"
default['textsecure']['config']['messageStore']['properties']['charSet'] = "UTF-8"
