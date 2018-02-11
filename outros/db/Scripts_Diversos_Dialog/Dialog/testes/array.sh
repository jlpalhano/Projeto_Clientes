#IFS=$'\n' read -d '' -r -a lines < ../../dados.result

#printf "line 1: %s\n" "${lines[0]}"
#printf "line 5: %s\n" "${lines[4]}"
#echo "${lines[@]}"

file="../../dados.result"
lines=`cat $file`
for line in $lines; do
        echo "$line" | tr "|"  " " | sed 's/.* .*/& OFF/' 
done
