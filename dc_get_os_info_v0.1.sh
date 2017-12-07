#!/bin/bash
#FILE NAME:dc_get_os_info_v0.1.sh
#DESCRIPTION:Gets Linux OS level info
#USAGE:dc_get_os_info_v0.1.sh
#DATE:
#VERSION 0.1
#OWNER: Deepak Chohan

OSINFOFILE="os.txt"
LOCALSERVER="`hostname`"
INVDATADIR=/
LOGFILE=$INVDATADIR/osinfo.log

#Functions
#error check 
error_check()
{
   ERRORCODE=$?
   if [ $ERRORCODE -ne 0 ]
   then
   echo $DATE "Getting OS data  failed, check the servers and re run" >>$LOGFILE
   exit
   fi
}

#Get OS Info
my_get_os_info ()
{
   echo -e "=========================================================================" > $LOCALSERVER.$OSINFOFILE
   echo -e "=========================================================================" >> $LOCALSERVER.$OSINFOFILE
   echo -e "LINUX VERSION" >> $LOCALSERVER.$OSINFOFILE
   cat  /etc/redhat-release >> $LOCALSERVER.$OSINFOFILE
   echo -e "=========================================================================" >> $LOCALSERVER.$OSINFOFILE
   echo -e "=========================================================================" >> $LOCALSERVER.$OSINFOFILE
   echo -e "CPU INFO" >> $LOCALSERVER.$OSINFOFILE
   cat /proc/cpuinfo >> $LOCALSERVER.$OSINFOFILE
   echo -e "=========================================================================" >> $LOCALSERVER.$OSINFOFILE
   echo -e "=========================================================================" >> $LOCALSERVER.$OSINFOFILE
   echo -e "MEMORY INFO" >> $LOCALSERVER.$OSINFOFILE
   cat /proc/meminfo >> $LOCALSERVER.$OSINFOFILE
   echo -e "=========================================================================" >> $LOCALSERVER.$OSINFOFILE
   echo -e "=========================================================================" >> $LOCALSERVER.$OSINFOFILE
   echo -e "FILE SYSTEM INFO" >> $LOCALSERVER.$OSINFOFILE
   cat /proc/mounts >> $LOCALSERVER.$OSINFOFILE
   echo -e "=========================================================================" >> $LOCALSERVER.$OSINFOFILE
   echo -e "=========================================================================" >> $LOCALSERVER.$OSINFOFILE
   echo -e "SERVICES INFO" >> $LOCALSERVER.$OSINFOFILE
   /sbin/chkconfig --list  >> $LOCALSERVER.$OSINFOFILE  
   echo -e "=========================================================================" >> $LOCALSERVER.$OSINFOFILE
   echo -e "=========================================================================" >> $LOCALSERVER.$OSINFOFILE
   echo -e "=========================================================================" >> $LOCALSERVER.$OSINFOFILE
   echo -e "Disk INFO" >> $LOCALSERVER.$OSINFOFILE
   df -H  >> $LOCALSERVER.$OSINFOFILE
   echo -e "=========================================================================" >> $LOCALSERVER.$OSINFOFILE
   echo -e "=========================================================================" >> $LOCALSERVER.$OSINFOFILE
   echo -e "=========================================================================" >> $LOCALSERVER.$OSINFOFILE
   echo -e "Memory INFO" >> $LOCALSERVER.$OSINFOFILE
   free -g  >> $LOCALSERVER.$OSINFOFILE
   echo -e "=========================================================================" >> $LOCALSERVER.$OSINFOFILE
   echo -e "=========================================================================" >> $LOCALSERVER.$OSINFOFILE
   echo -e "=========================================================================" >> $LOCALSERVER.$OSINFOFILE
   echo -e "Network INFO" >> $LOCALSERVER.$OSINFOFILE
   ifconfig  >> $LOCALSERVER.$OSINFOFILE
   echo -e "=========================================================================" >> $LOCALSERVER.$OSINFOFILE
   echo -e "=========================================================================" >> $LOCALSERVER.$OSINFOFILE
}


my_get_os_info
#zip the files
zip server_os_files.zip *os*.txt

