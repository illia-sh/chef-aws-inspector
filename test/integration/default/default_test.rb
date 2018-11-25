# # encoding: utf-8

# Inspec test for recipe aws-inspector::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

if os.family == 'debian'
  describe service('awsagent', '/opt/aws/awsagent/bin/awsagent') do
    it { should be_running }
    it { should be_enabled }
  end
else
  describe service('awsagent') do
    it { should be_running }
    it { should be_enabled }
  end
end
