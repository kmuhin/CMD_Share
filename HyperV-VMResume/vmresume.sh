killall ntpd
sleep 20
/etc/init.d/ntp-client restart
/etc/init.d/ntpd restart