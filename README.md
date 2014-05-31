Alarm
=====

A cli alarm clock that uses beeps 


## Time Arguments 
--hours: Set the number of hours until alarm goes off  
--minutes: Set the number of minutes until the alarm goes off  
--seconds: Set the number of seconds until the alarm goes off  
You can also use the short flag -h for hours, -m for minutes, and -s for seconds   
  
## Beep Arguments  
--number: Set the number of the beeps. Default is 20  
--frequency: Set the frequency of the beeps. Default is 550  
--length: Set the length of the beeps (in milliseconds). Default is 400  
You can also use the short flag -n for number, -f for frequency, and -l for length  
  
## Examples
Set the alarm to go off in 5 minutes 20 seconds with default beep settings  
`./alarm.sh --minutes 5 --seconds 20`  
Set the alarm to go off in 2 hours, 3 minutes, and 10 seconds using 20 one second long beeps at the frequency of 100.  
`./alarm.sh --hours 2 --minutes 3 --seconds 10 --length 1000 --frequency 100 --number 20 `
