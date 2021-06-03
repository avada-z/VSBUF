#!/usr/bin/bash
while :
do
printf "Enter the full URL without final /\n:"
read URL
printf "Enter the path to the wordlist\n:"
read WPATH
while IFS= read -r line; do
     CODE=$(curl -s -o /dev/null -w "%{http_code}" $URL/$line)
	 if [[ $CODE = "200" ]]
	 then
	 printf $URL/$line && echo
	 fi
done < $WPATH
done