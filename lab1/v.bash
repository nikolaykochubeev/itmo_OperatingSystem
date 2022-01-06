#/bin/bash

grep -E "INFO" /var/log/anaconda/syslog | awk '{if ($2=="INFO") print $0}' > /home/admin/lab1/info.log


