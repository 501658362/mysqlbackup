#!/bin/bash
mysqldump -uroot -proot practice > /root/backup/mysql/practice_$(date +%Y%m%d_%H%M%S).sql
#mysqldump -uroot -proot practice  | gzip > /root/backup/mysql/practice_$(date +%Y%m%d_%H%M%S).sql.gz
#!/bin/bash
cd /root/backup/mysql/
find /root/backup/mysql/ -mtime +60 -name "*.sql" -exec rm -rf {} \;
git pull
git add . 
git commit -m "update sql"
git push -u origin master
