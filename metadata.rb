name             'wincleanmgr'
maintainer       'Nathan Faulkner'
maintainer_email 'nfaulkner@kmionline.com'
license          'All rights reserved'
description      'Installs/Configures wincleanmgr'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.1'
%w{ windows }.each do |os|
  supports os
end

%w{ windows }.each do |cb|
  depends cb
end
