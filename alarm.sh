#!/bin/bash
#Alarm.sh
#Requires beep (apt-get install beep)
hours=0
minutes=0
seconds=0
beeps=20
frequency=550
length=400

if [ -z "$1" ] #If no arguments
then
    echo "Usage: $0 [time]"
    echo "Time arguments"
    echo -e "\t--hours: Set the number of hours until alarm goes off"
    echo -e "\t--minutes: Set the number of minutes until the alarm goes off"
    echo -e "\t--seconds: Set the number of seconds until the alarm goes off"
    echo "Beep arguments"
    echo -e "\t--number: Set the number of the beeps. Default is 20"
    echo -e "\t--frequency: Set the frequency of the beeps. Default is 550"
    echo -e "\t--length: Set the length of the beeps (in milliseconds). Default is 400"
    echo "Examples" 
    echo "$0 --minutes 5 --seconds 20"
    echo "$0 --hours 2 --minutes 3 --seconds 10 --length 1000 --frequency 100 --number 20 "
    exit 1
fi

for i in $(seq 1 $#)
do
    eval "currentarg=${!i}" #Holds the current argument
    if [[ "$currentarg" == "-h" ]] || [[ "$currentarg" == "--hours" ]]
    then
        hoursarg=$(($i + 1)) #Holds the current argument number + 1
        eval "hours=${!hoursarg}"  #Holds the argument after the one we're on
    fi
    if [[ "$currentarg" == "-s" ]] || [[ "$currentarg"  == "--seconds" ]] 
    then
        secondsarg=$(($i + 1))
        eval "seconds=${!secondsarg}"
    fi
    if [[ "$currentarg" == "-m" ]] || [[ "$currentarg" == "--minutes" ]]
    then
        minutesarg=$(($i + 1))
        eval "minutes=${!minutesarg}"
    fi
    if [[ "$currentarg" == "--number" ]] || [[ "$currentarg" == "-n" ]]
    then
        numberarg=$(($i + 1))
        eval "beeps=${!numberarg}"
    fi
    if [[ "$currentarg" == "--length" ]] || [[ "$currentarg" == "-l" ]]
    then
        lengtharg=$(($i + 1))
        eval "length=${!lengtharg}"
    fi
    if [[ "$currentarg" == "--frequency" ]] || [[ "$currentarg" == "-f" ]]
    then
        frequencyarg=$(($i + 1))
        eval "frequency=${!frequencyarg}"
    fi
done

alarmseconds=$(echo "($minutes*60) + ($hours*60*60) + $seconds" | bc)
sleep $alarmseconds
beep -r $beeps -l $length -f $frequency
