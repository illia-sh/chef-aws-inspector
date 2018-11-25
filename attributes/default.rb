default['aws-inspector']['enabled'] = true
default['aws-inspector']['source']['url'] = 'https://inspector-agent.amazonaws.com/linux/latest/install'
default['aws-inspector']['pkg']['path'] = ::File.join(Chef::Config['file_cache_path'], 'awsagent.sh')
default['aws-inspector']['supported_regions'] = [
  'us-east-1',
  'us-west-1',
  'us-west-2',
  'ap-northeast-1',
  'eu-west-1',
  'ap-northeast-2',
  'ap-southeast-2',
  'ap-south-1',
  'eu-central-1',
  'us-east-2',
  'us-gov-west-1',
  'us-gov-east-1'
]
