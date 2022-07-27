
## updateprices_script.sh
- Execute all update python files of supermarket prices
- Crontab config: every day at 4am GMT0 (1am GTM-3)

## checkstatus.sh
- Crontab config: every hour, every day
- Execute comprobation status Django, front, nginx servers
- Save the status return in text file
- If one not runing, restart this server
- Save status and date error and send notification email with attachment

## Crontab comands
- crontab -l : view crontab file
- crontab -e : edit crontab file
- execute sudo service cron restart after change this file
