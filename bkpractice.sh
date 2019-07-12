#!/bin/bash
# xxxx
echo '开始执行脚本' >> /root/mysqlbackup/update.log
echo '开始mysql文件' >> /root/mysqlbackup/update.log
mysqldump -uroot -p501658362 practice > /root/mysqlbackup/practice_$(date +%Y%m%d_%H%M%S).sql >> /root/mysqlbackup/update.log 2>&1
#mysqldump -uroot -proot practice  | gzip > /root/backup/mysql/practice_$(date +%Y%m%d_%H%M%S).sql.gz
echo '已生成mysql文件' >> /root/mysqlbackup/update.log
cd  /root/mysqlbackup/ 
echo '删除超过两个月的sql' >> /root/mysqlbackup/update.log
find /root/mysqlbackup/ -mtime +60 -name "*.sql" -exec rm -rf {} \;  >> /root/mysqlbackup/update.log 2>&1
git pull >> /root/mysqlbackup/update.log 2>&1
git add -A >> /root/mysqlbackup/update.log 2>&1
git commit -m "update sql" >> /root/mysqlbackup/update.log 2>&1
git push -u origin master >> /root/mysqlbackup/update.log 2>&1
