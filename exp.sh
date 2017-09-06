#/usr/bin/expect -f

# run the application
set timeout 15
spawn su -
expect "password:"
send "EUIfgwe7\r"
expect "#"
send "sh /run.sh\r"             
expect "#"
send "echo #?\r"
expect "#"
send "echo '========'\r"
expect "#"
sleep 15
expect eof 
interact
