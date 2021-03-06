#!/bin/bash
rm -rf /root/.vnc/*.log
killall -9 firefox

# 此脚本用于 自动重启火狐浏览器 nothing more


# 脚本所在目录 此参数之后可以 当成脚本参数传递
dir=/root/code
#  脚本执行日志路径文件名称 此参数之后可以 当成脚本参数传递
logPath=${dir}/firefox.log


date=`date +%Y-%m-%d:%H:%M:%S`
hour=`date +%H`
day=`date +%d`
echo '-------------------------------------------------------' >> ${logPath}
echo $date" 启动脚本 当前日：${day}" >> ${logPath}

#exit 0
needSkipTime=0
sopShellStartHour=1
sopShellStartHourNew=10
sopShellEndHour=13
stopDay=20
if [ $needSkipTime -ge 1 ]
    then
    if [ $day -gt ${stopDay} ]
    then
        if [ $hour -ge ${sopShellStartHour} -a $hour -lt ${sopShellEndHour} ]
        then
            echo $date" 当前${day}日，当前时间 不执行 免得浪费流量 ${sopShellStartHour}-${sopShellEndHour}点 赚不到东西" >> ${logPath}
            echo '-------------------------------------------------------\n'  >> ${logPath}
            exit 0
        fi
    fi

    if [ $day -le ${stopDay} ]
    then
        if [ $hour -ge ${sopShellStartHourNew} -a $hour -lt ${sopShellEndHour} ]
        then
            echo $date" 当前${day}日，当前时间 不执行 免得浪费流量 ${sopShellStartHourNew}-${sopShellEndHour}点 赚不到东西" >> ${logPath}
            echo '-------------------------------------------------------\n'  >> ${logPath}
            exit 0
        fi
    fi
fi

echo $date" 启动应用" >> ${logPath}
export DISPLAY=:1;firefox
