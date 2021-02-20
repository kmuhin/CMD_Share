echo y | PLINK.EXE -T -i "ntpflush.ppk" root@172.16.136.2

if  {%errorlevel%} NEQ {0} (
 timeout 30
 echo y | PLINK.EXE -T -i "ntpflush.ppk" root@172.16.136.2
}

if  {%errorlevel%} NEQ {0} (
 timeout 30
 echo y | PLINK.EXE -T -i "ntpflush.ppk" root@172.16.136.2
}