#!/bin/bash

nohup /usr/local/bin/net_speeder venet0 "ip" >/dev/null 2>&1 &
shift
/usr/local/bin/ssserver $@
