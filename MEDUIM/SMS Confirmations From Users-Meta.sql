select count(b.phone_number)/count(a.phone_number)*100 as perc
from fb_sms_sends a 
left join fb_confirmers b 
on a.ds=b.date and a.phone_number = b.phone_number 
where a.ds='2020-08-04' and a.type='message'