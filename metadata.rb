name 'aws-inspector'
maintainer 'The Authors'
maintainer_email 'illia.shpak@gmail.com'
license 'MIT'
description 'Installs/Configures aws-inspector'
long_description 'Installs/Configures aws-inspector'
version '0.1.0'
chef_version '>= 13.12.3' if respond_to?(:chef_version)

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
issues_url 'https://github.com/illia-sh/chef-aws-inspector/issues'
source_url 'https://github.com/illia-sh/chef-aws-inspector.git'

%w(centos redhat ubuntu debian amazon).each do |os|
  supports os
end
