#!/bin/bash

# wake up network after a long sleep
function wake_network {
    nmcli nm sleep false
}

function who_lock {
  sudo netstat -tulpn | grep :${1}
}
