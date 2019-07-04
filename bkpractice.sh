#!/bin/bash
# xxxx
mysqldump -uroot -p501658362 practice > /root/mysqlbackup/practice_$(date +%Y%m%d_%H%M%S).sql
#mysqldump -uroot -proot practice  | gzip > /root/backup/mysql/practice_$(date +%Y%m%d_%H%M%S).sql.gz
#!/bin/bash
cd  /root/mysqlbackup/
find /root/mysqlbackup/ -mtime +60 -name "*.sql" -exec rm -rf {} \;
git pull
git add -A
git commit -m "update sql"
git push -u origin master
