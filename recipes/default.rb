#
# Cookbook:: aws-inspector
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

extend AWSInspectorAgent::GetRegionHelpers

aws_region = region

if node['aws-inspector']['supported_regions'].include? aws_region

  remote_file node['aws-inspector']['pkg']['path'] do
    source node['aws-inspector']['source']['url']
    owner 'root'
    group 'root'
    action :create
    not_if { ::File.exist?(node['aws-inspector']['pkg']['path']) }
  end

  execute 'install_aws_inspector' do
    command "sudo /bin/bash #{node['aws-inspector']['pkg']['path']}"
    not_if { node['packages'].keys.any? { |x| %w[awsagent AwsAgent].include?(x) } }
  end

  service 'awsagent' do
    status_command '/opt/aws/awsagent/bin/awsagent status'
    provider value_for_platform(
      ['centos','redhat'] => { '>= 7.0' => Chef::Provider::Service::Systemd },
      'ubuntu' => { '>= 16.00' => Chef::Provider::Service::Systemd },
      'debian' => { '>= 8.0' => Chef::Provider::Service::Systemd},
      'default' => Chef::Provider::Service::Upstart
    )
    action value_for_platform(
      ['centos','redhat'] => { '< 7.0' => [:start] },
      'amazon' => { '>= 2018.03' => [:start] },
      'default' => [:enable, :start]
    )
  end
else
  Chef::Log.warn("aws region is not supported by inspector agent")
  Chef::Log.warn("list of supported regions: #{node['aws-inspector']['supported_regions']}")
end
