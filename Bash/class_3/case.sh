#!/bin/bash

read daynum
case $daynum
in
	1) dayofweek='Mondays';;
	2) dayofweek='Tuesdays';;
	3) dayofweek='Wednesdays';;
	4) dayofweek='Thursdays';;
	5) dayofweek='Fridays';;
	6) dayofweek='Saturdays';;
	7) dayofweek='Sundays';;
esac
echo $dayofweek

echo "Program terminated ..."
