#/bin/bash

read s

case "$s" in
1 )
elinks
;;

2 )
vi
;;

3 )
nano
;;

0 )
exit
;;
esac
