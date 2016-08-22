#!/usr/bin/expect
set ipaddr [ lindex $argv 0 ]
spawn ssh $ipaddr
expect {
        "yes/no"
        {send "yes\r";exp_continue}
        "password"
        {send "redhat\r"}
        }
interact
