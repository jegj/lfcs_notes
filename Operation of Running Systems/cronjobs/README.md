# Scheduled Jobs

## Cronjobs

* Daemon that schedule tasks, called jobs, to run at a set date and time is cron
* The schedule of various tasks depend by configuration contained in below files/directories:
  * /etc/crontab
    * Normally isn't edited
      * **NOTE**: It's content can be used as remainder of cron files syntax
    * Each row is a task that must be executed in a scheduled way
    * A special syntax indicates the schedule of each commands
  * /etc/cron.d
    * It contains files with same syntax of /etc/crontab
    * Normally it used by software packages installed in system
  * /var/spool/cron
    * It contains tasks for users
    * Contents can be edited using `crontab` command
  * /etc/cron.hourly
    * Each script in this directory will be executed every hour
    * Exact time isn't specified but execution is granted, with a combination of deamon cron and anacron
  * /etc/cron.daily
    * Each script in this directory will be executed every day
    * Exact time isn't specified but execution is granted, with a combination of deamon cron and anacron
  * /ect/cron.weekly
    * Each script in this directory will be executed every week
    * Exact time isn't specified but execution is granted, with a combination of deamon cron and anacron
  * /etc/cron.monthly
    * Each script in this directory will be executed every month
    * Exact time isn't specified but execution is granted, with a combination of deamon cron and anacron

Cron syntax:

```bash
# ┌───────────── minute (0 - 59)
# │ ┌───────────── hour (0 - 23)
# │ │ ┌───────────── day of the month (1 - 31)
# │ │ │ ┌───────────── month (1 - 12)
# │ │ │ │ ┌───────────── day of the week (0 - 6) (Sunday to Saturday;
# │ │ │ │ │                                   7 is also Sunday on some systems)
# │ │ │ │ │
# │ │ │ │ │
# * * * * * command to execute
```

* `#` this line is a comment
* `*` always
* `1 0 * * * /command` command will be executed one minute past midnight (00:01) every day
*  `1-30 * * * * /command` command will be executed every day, every hour at minutes 1 to 30
*  `*/10 * * * * /command` command will be executed every 10 minutes, or rather when minutes are 00, 10, 20, 30, 40 and 50.
*  `00 */2 15 * * /command` command will be executed the fifteenth day of every month, every two hours
*  `00 1-9/2 1 5 * /command` command will be executed on 1st May at 1,00 - 3,00 - 5,00 - 7,00 - 9,00, or rather every two hours from 1,00 to 9,00
*  `00 13 2,8,14 * * /command` command will be executed second, eighth and fourteenth day of each month at 13.00

* `00 21 * * * SUN` command will be executed at 21:00 on Sunday

* `0 22 * * 1-5` At 22:00 on every day-of-week from Monday through Friday.

* `@reboot` After rebooting

* `@yearly` At 00:00 on day-of-month 1 in January.

* `@annually` At 00:00 on day-of-month 1 in January.

* `@monthly` At 00:00 on day-of-month 1.

* `@weekly` At 00:00 on Sunday.

* `@daily` At 00:00.

* `@hourly` At minute 0.


- https://crontab.guru/

## at

```sh
sudo apt-get install at
systemctl start atd
systemctl enable atd
```
### Show scheduled jobs
```sh
atq
```

### Remove scheduled job

```sh
atrm <id>
```

### Check content of scheduled job

```sh
at -c <id>
```

### Examples

* `at 10:00 AM Sun`
* `at 10:00 AM July 25`
* `at 10:00 AM 6/22/2015`
* `at 10:00 AM 6.22.2015`
* `at 10:00 AM next month`
* `at 10:00 AM tomorrow`
* `at now + 1 hour`
* `at now + 30 minutes`
* `at now + 1 week`
* `at now + 2 weeks`
* `at now + 1 year`
* `at now + 2 years`
* `at midnight`