#! /bin/bash
#declare -a FILE=("${@}")

if [ -f $FILE ];
then
  echo "$FILE exist"

  for i in $@
    do
      ser=`cat ~/.ssh/config |cut -d " " -f2 |grep $i`
      if [ "$i" == "$ser" ] 
        then
          echo "$FILE is coping to $ser"
          scp -r $FILE  $ser:/tmp &2>1
          echo "Copied"
        fi
    done
  else 
    echo "You need a file copy" 
fi
