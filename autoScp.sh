#!/bin/bash
echo ### HELLO START SCP ###
FILE1="scp styl@10.10.40.223:/home/styl/ryder/android_Orca7_v2/out/target/product/msm8909/emmc_appsboot.mbn ."
FILE2="scp styl@10.10.40.223:/home/styl/ryder/android_Orca7_v2/out/target/product/msm8909/boot.img ."
PASS="123"
trap ctrl_c INT

function ctrl_c() {
  echo "Removing left-over files..."
  rm -f /tmp/expect
}




rm -f /tmp/expect

cat << EOF > /tmp/expect
#!/usr/bin/expect -f
match_max 1000000
set timeout -1

spawn $FILE1
expect "styl@10.10.40.223's password:"
send -- "$PASS"
send -- "\r"
expect "\r"
interact

spawn $FILE2
expect "styl@10.10.40.223's password:"
send -- "$PASS"
send -- "\r"
expect "\r"
interact

exit 1
close
EOF

chmod 500 /tmp/expect
/usr/bin/expect -f /tmp/expect

rm -f /tmp/expect
