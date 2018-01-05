#!/bin/bash
#
# Displays times in various places.
# Use tzselect to find wished-for timezones if it is not listed here.


export_zones=(
	'America/Chicago'
	'America/Indiana/Indianapolis'
	'America/Lima'
	'Europe/Copenhagen'
	'Pacific/Auckland'
)


convert_timezone(){
	local   from_tz=$1
	local     to_tz=$2
	local from_time=$3

	tz_from_arg="TZ=\"$from_tz\""
	to_time=`TZ=$to_tz date --date="$tz_from_arg $requested_datestring"`
	printf "%-30s: %s\n" "$to_tz" "$to_time"
}


case $# in
	0*)
		local_tz=`cat /etc/timezone` # This should work for Ubuntu, Mint, Debian; not sure about other distributions
		requested_datestring=`date +'%F %T'`
	;;
	1*)
		local_tz=`cat /etc/timezone` # See comment above
		asked_time=$1
		current_date=`date +%F`
		requested_datestring="$current_date $asked_time"
	;;
	2*)
		local_tz=$1
		asked_time=$2
		current_date=`date +%F`
		requested_datestring="$current_date $asked_time"
	;;
	*)
		echo "Timezone script takes zero arguments or one."
		echo "If argument is given, it should be the time you are looking for."
		echo "Format: hh:mm"
	;;
esac


echo "Time:   $requested_datestring"
echo "Locale: $local_tz"
echo "----------------------------------------------------------"

for export_zone in ${export_zones[*]}
do
	convert_timezone $local_tz $export_zone $requested_datestring
done
