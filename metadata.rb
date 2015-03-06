name              'cfcli'
maintainer        'Christopher Elkins'
maintainer_email  'chrise@esha.com'
license           'Apache 2.0'
description       'Installs the Cloud Foundry command line client'
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           '0.1.0'

recipe 'cfcli::default', 'Installs the Cloud Foundry command line client'

%w( amazon centos debian fedora oracle redhat scientific ubuntu ).each do |os|
  supports os
end
