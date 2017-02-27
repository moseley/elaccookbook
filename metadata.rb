name 'elaccookbook'
maintainer 'Jeremy Moseley'
maintainer_email 'jeremymoseley@me.com'
license 'all_rights'
description 'Installs/Configures Wordpress'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.1'

%w{ php openssl }.each do |cb|
  depends cb
end

depends "apache2", ">= 2.0.0"
depends "php", "~> 2.2.1"

%w{ centos redhat }.each do |os|
  supports os
end

attribute "WordPress/version",
  :display_name => "WordPress download version",
  :description => "Version of WordPress to download from the WordPress site or 'latest' for the current release.",
  :default => "latest"

attribute "WordPress/checksum",
  :display_name => "WordPress tarball checksum",
  :description => "Checksum of the tarball for the version specified.",
  :default => ""

attribute "WordPress/dir",
  :display_name => "WordPress installation directory",
  :description => "Location to place WordPress files.",
  :default => "/var/www/html"

attribute "WordPress/db/name",
  :display_name => "WordPress MySQL database",
  :description => "WordPress will use this MySQL database to store its data.",
  :default => "wordpress"

attribute "WordPress/db/user",
  :display_name => "WordPress MySQL user",
  :description => "WordPress will connect to MySQL using this user.",
  :default => "wordpress"

attribute "WordPress/db/password",
  :display_name => "WordPress MySQL password",
  :description => "Password for the WordPress MySQL user.",
  :default => "randomly generated"

attribute "WordPress/db/host",
  :display_name => "WordPress MySQL location",
  :description => "MySQL host location.",
  :default => "localhost"

attribute "WordPress/db/table_prefix",
  :display_name => "WordPress MySQL table prefix",
  :description => "MySQL table prefix.",
  :default => "wp_"

attribute "WordPress/db/charset",
  :display_name => "WordPress MySQL character set",
  :description => "MySQL character set.",
  :default => "utf8"

attribute "WordPress/db/collate",
  :display_name => "WordPress MySQL collate",
  :description => "MySQL collate.",
  :default => ""

attribute "WordPress/keys/auth",
  :display_name => "WordPress auth key",
  :description => "WordPress auth key.",
  :default => "randomly generated"

attribute "WordPress/keys/secure_auth",
  :display_name => "WordPress secure auth key",
  :description => "WordPress secure auth key.",
  :default => "randomly generated"

attribute "WordPress/keys/logged_in",
  :display_name => "WordPress logged-in key",
  :description => "WordPress logged-in key.",
  :default => "randomly generated"

attribute "WordPress/keys/nonce",
  :display_name => "WordPress nonce key",
  :description => "WordPress nonce key.",
  :default => "randomly generated"

attribute "WordPress/salt/auth",
  :display_name => "WordPress auth salt",
  :description => "WordPress auth salt.",
  :default => "randomly generated"

attribute "WordPress/salt/secure_auth",
  :display_name => "WordPress secure auth salt",
  :description => "WordPress secure auth salt.",
  :default => "randomly generated"

attribute "WordPress/salt/logged_in",
  :display_name => "WordPress logged in salt",
  :description => "WordPress logged in salt.",
  :default => "randomly generated"

attribute "WordPress/salt/nonce",
  :display_name => "WordPress nonce salt",
  :description => "WordPress nonce salt.",
  :default => "randomly generated"

attribute "WordPress/server_aliases",
  :display_name => "WordPress Server Aliases",
  :description => "WordPress Server Aliases",
:default => "FQDN"