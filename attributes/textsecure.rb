default['textsecure']['user'] = 'textsecure'
default['textsecure']['version'] = '0.54'
# Options: 'jar' or 'source'
default['textsecure']['install_method'] = 'jar'

default['textsecure']['install_dir'] = '/opt/whispersystems/textsecure'

default['textsecure']['git_repository'] = "https://github.com/WhisperSystems/TextSecure-Server.git"
default['textsecure']['git_revision'] = nil
default['textsecure']['git_dir'] = "/home/textsecure/textsecure-server"

normal['java']['jdk_version'] = "7"

default['textsecure']['dbuser'] = node['textsecure']['user']
default['textsecure']['dbpass'] = node['postgresql']['password']['postgres']

default['textsecure']['config']['twilio']['accountId'] = 'DUMMY'
default['textsecure']['config']['twilio']['accountToken'] = 'DUMMY'
default['textsecure']['config']['twilio']['number'] = 'DUMMY'
default['textsecure']['config']['twilio']['localDomain'] = 'DUMMY'
default['textsecure']['config']['twilio']['international'] = nil
default['textsecure']['config']['nexmo']['apiKey'] = nil
default['textsecure']['config']['nexmo']['apiSecret'] = nil
default['textsecure']['config']['nexmo']['number'] = nil
default['textsecure']['config']['push']['host'] = "localhost"
default['textsecure']['config']['push']['port'] = 9090
default['textsecure']['config']['push']['username'] = 'changeme'
default['textsecure']['config']['push']['password'] = 'changeme'
default['textsecure']['config']['s3']['accessKey'] = 'DUMMY'
default['textsecure']['config']['s3']['accessSecret'] = 'DUMMY'
default['textsecure']['config']['s3']['attachmentsBucket'] = 'DUMMY'
default['textsecure']['config']['cache']['url'] = nil
default['textsecure']['config']['directory']['url'] = nil
default['textsecure']['config']['federation']['name'] = nil
# Format: [{name: <string>, url: <string>, authenticationToken: <string>, certificate: <string>}, [...] ]
default['textsecure']['config']['federation']['peers'] = []
default['textsecure']['config']['graphite']['host'] = nil
default['textsecure']['config']['graphite']['port'] = nil

db_url = "jdbc:postgresql://localhost:#{node['postgresql']['config']['port']}"

default['textsecure']['config']['messageStore']['driverClass'] = "org.postgresql.Driver"
default['textsecure']['config']['messageStore']['user'] = node['textsecure']['dbuser']
default['textsecure']['config']['messageStore']['password'] = node['textsecure']['dbpass']
default['textsecure']['config']['messageStore']['url'] = "#{db_url}/messagedb"
default['textsecure']['config']['messageStore']['properties']['charSet'] = "UTF-8"

default['textsecure']['config']['database']['driverClass'] = "org.postgresql.Driver"
default['textsecure']['config']['database']['user'] = node['textsecure']['dbuser']
default['textsecure']['config']['database']['password'] = node['textsecure']['dbpass']
default['textsecure']['config']['database']['url'] = "#{db_url}/accountdb"
default['textsecure']['config']['database']['properties']['charSet'] = "UTF-8"
