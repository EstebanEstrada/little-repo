

import datetime

utc_time_now = datetime.datetime.utcnow() 
utc_time_now_print = (utc_time_now.strftime(('%Y-%m-%d')+'T'+('%H:%M:%S')+'Z'))
print(utc_time_now_print)


utc_time_yesterday = utc_time_now - datetime.timedelta(days=1)
utc_time_yesterday_print = (utc_time_yesterday.strftime(('%Y-%m-%d')+'T'+('%H:%M:%S')+'Z'))
print(utc_time_yesterday_print)

