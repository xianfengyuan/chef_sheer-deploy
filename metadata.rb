maintainer       "Xianfeng Yuan"
name		         "sheer-deploy"
maintainer_email "xyuan@sheermountain.com"
license          "All rights reserved"
description      "Installs/Configures sheer app"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"

provides "sheer"

depends "opsworks_nodejs"
depends "runit"
