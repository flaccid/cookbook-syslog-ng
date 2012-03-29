maintainer       "Artem Veremey"
maintainer_email "artem@veremey.net"
license          "Apache 2.0"
description      "Installs/Configures syslog-ng"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "1.0.0"

%w{ debian ubuntu centos redhat fedora }.each do |os|
  supports os
end

recipe "syslog-ng", "Installs and configures syslog-ng."
recipe "syslog-ng::install", "Installs syslog-ng."
recipe "syslog-ng::configure", "Configures syslog-ng."

attribute "syslog-ng/user",
  :display_name => "syslog-ng System User",
  :description => "The syslog-ng system user.",
  :default => "root",
  :choice => [ 'root', 'syslog-ng' ],
  :recipes => [ "syslog-ng::default" ]

attribute "syslog-ng/group",
  :display_name => "syslog-ng System Group",
  :description => "The syslog-ng system group.",
  :default => "root",
  :choice => [ 'root', 'syslog-ng' ],
  :recipes => [ "syslog-ng::default" ]
  
attribute "syslog-ng/log_dir",
  :display_name => "syslog-ng Log Directory",
  :description => "The syslog-ng log directory.",
  :default => "/var/log",
  :recipes => [ "syslog-ng::default" ]
  
attribute "syslog-ng/config_dir",
  :display_name => "syslog-ng Config Directory",
  :description => "The syslog-ng configuration directory.",
  :default => "/etc/syslog-ng",
  :recipes => [ "syslog-ng::default" ]