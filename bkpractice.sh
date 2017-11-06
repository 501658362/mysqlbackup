#!/bin/bash
mysqldump -uroot -proot practice > /root/backup/mysql/practice_$(date +%Y%m%d_%H%M%S).sql
#!/bin/bash
#mysqldump -uroot -proot practice  | gzip > /root/backup/mysql/practice_$(date +%Y%m%d_%H%M%S).sql.gz
#!/bin/bash
echo ww
#!/bin/bash
cd /root/backup/mysql/
git add . 
git commit -m "update sql"
git push -u origin master
