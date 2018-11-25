module AWSInspectorAgent
  # get region from ec2 metadata
  module GetRegionHelpers
    def region
      require 'uri'
      url = '/latest/meta-data/placement/availability-zone'
      response = Net::HTTP.get_response('169.254.169.254', url)
      az = response.body
      if az.to_s.strip.empty?
        Chef::Log.warn('empty response from ec2 meta-data')
      else
        region = az.gsub!(/[a-z]*$/, '')
      end
      region
    rescue Timeout::Error => e
      @error = e
      Chef::Log.warn('timeout connecting to 169.254.169.254...')
    end
  end
end
