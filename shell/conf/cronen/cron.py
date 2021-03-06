#!/usr/bin/python

import cronen
import os
from datetime import timedelta

def my_func():
  print 'Hello, world!'

def foo():
  print 'bar'

def cron_daily():
  os.popen("find /var/www/html/shell/conf/cronen/cron.daily/* -type f -name '*.sh' -exec sh {} \;")

def cron_hourly():
  os.popen("find /var/www/html/shell/conf/cronen/cron.hourly/* -type f -name '*.sh' -exec sh {} \;")

cron = cronen.Cronen(port=12345)

# schedule a simple hello-world job every day at 20:30.
cron.add_job(
  name='cron_daily',
  func=cron_daily,
  trigger=cronen.trigger.DailyTrigger(hour=0, minute=1)
)

# Schedule a simple foo-bar job every 2 minutes
cron.add_job(
  name='cron_hourly',
  func=cron_hourly,
  trigger=cronen.trigger.PeriodicTrigger(timedelta(minutes=60))
)

cron.start()