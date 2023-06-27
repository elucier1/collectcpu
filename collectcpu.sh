# Sample Code is provided for the purpose of illustration only and is not intended to be used in a production environment.
# THIS SAMPLE CODE AND ANY RELATED INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED,
# INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE.
# We grant You a nonexclusive, royalty-free right to use and modify the Sample Code and to reproduce and distribute the
# object code form of the Sample Code, provided that. You agree: (i) to not use Our name, logo, or trademarks to market Your
# software product in which the Sample Code is embedded; (ii) to include a valid copyright notice on Your software product in
# which the Sample Code is embedded; and (iii) to indemnify, hold harmless, and defend Us and Our suppliers from and against
# any claims or lawsuits, including attorneys’ fees, that arise or result from the use or distribution of the Sample Code.
#!/bin/bash
DATE=`date +"%m%d_%H"`
(echo "++++++++++++++++++++++++++++";date;ps -eo pcpu,pmem,pid,pidns,comm,user,uid --forest | awk 'NR==1 {printf "hostname/podName\t";print $0} NR>1 {cmd="nsenter -t "$3" -u hostname 2>/dev/null"; cmd|getline output; close(cmd); printf "%s\t%s\n", output, $0}';echo "========CPU cores Usage:";mpstat -P ALL 2 1|grep Average) >> /collectcpu/collectcpu_${DATE}
