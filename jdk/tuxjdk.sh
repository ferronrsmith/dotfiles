#!/bin/bash
wget http://urshulyak.com/jdk-8u5-tuxjdk-b08.tar.gz
tar -zxvf jdk-8u5-tuxjdk-b08.tar.gz
sudo mv jdk-8u5-tuxjdk-b08 /usr/lib/jvm
rm jdk-8u5-tuxjdk-b08.tar.gz


# add this to ur intellij startup script
#export JAVA_HOME=/usr/lib/jvm/jdk-8u5-tuxjdk-b08/

# Note: Can modify $IDEA_HOME/bin/idea{,64}.vmoptions
# instead of setting here.
# "-Dawt.useSystemAAFontSettings=on" seems worse to me
# "-Dsun.java2d.xrender=true" makes fonts darker
#export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=lcd \
#                      -Dsun.java2d.xrender=true"
