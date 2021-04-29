#! /bin/bash
echo "Hello Vijay WhatsUp"
read skill
stageArr=()
i=0
j=0
home(){
cd "c:\user\vn232\doc"
echo "Welcome home"
exec bash
}
pull(){
git pull
echo "Skill Completed"
exec bash
}
push(){
git push
echo "Skill Completed"
exec bash
}
log(){
git log feature --author="Navulla"
echo "Skill Completed"
exec bash
}
UnStage(){
#${#array[@]} length or arr
changes=$(git status)
local isM="false"
while read -r line
do
  abc="${line/modified:/''}";
  abc="${abc/new file:/''}";	
  if [[ "$line" =~ "unstage" ]]; then
		isM="true" 		
  fi
  if [[ "$line" =~ "staged" ]]; then
		isM="false" 		
  fi
  if [[ ${line,,} =~ '.sh' ]] && [ $isM == "true" ]; then
 	stageArr[i]=$abc;	
	i=`expr $i + 1` 
  elif [[ ${line,,} =~ '.txt' ]] && [ $isM == "true" ]; then  
    stageArr[i]=$abc	
	i=`expr $i + 1` 
  elif [[ ${line,,} =~ '.html' ]] && [ $isM == "true" ]; then   
    stageArr[i]=$abc	
	i=`expr $i + 1` 
  fi 
done <<<"$changes"
while [ $j -lt ${#stageArr[@]} ] 
do
    echo "$j ${stageArr[$j]}" 
    j=`expr $j + 1` 
done
if [ $j != "0" ]; then
	read -a arr
	local add
	for i in "${arr[@]}"
	do
	   local data=${stageArr[$i]}; 
	   data="${data## }"
	   add="${add## }"
	   stageArr[$i]="${stageArr[$i]// /}"  
	   add="$add${stageArr[$i]} " 
	done
	git reset $add
	echo "Skill Completed"
	exec bash
else
	echo "Up to date"
fi
}
status(){
changes=$(git status)
local isM="false"
while read -r line
do  
  if [[ "$line" =~ "staged" ]]; then
		isM="true" 		
  fi
  if [[ "$line" =~ "unstage" ]]; then
		isM="false" 		
  fi
  if [[ ${line,,} =~ '.sh' ]] && [ $isM == "true" ]; then
    abc="${line/modified:/''}";
 	stageArr[i]=$abc;	
	i=`expr $i + 1` 
  elif [[ ${line,,} =~ '.txt' ]] && [ $isM == "true" ]; then
    abc="${line/modified:/''}"
    stageArr[i]=$abc	
	i=`expr $i + 1` 
  elif [[ ${line,,} =~ '.html' ]] && [ $isM == "true" ]; then
    abc="${line/modified:/''}"
    stageArr[i]=$abc	
	i=`expr $i + 1`
  fi 
done <<<"$changes"
while [ $j -lt ${#stageArr[@]} ] 
do
    echo "$j ${stageArr[$j]}" 
    j=`expr $j + 1` 
done
if [ $j != "0" ]; then
	read -a arr
	local add
	for i in "${arr[@]}"
	do
	   local data=${stageArr[$i]};    
	   data="${data## }"
	   add="${add## }"
	   stageArr[$i]="${stageArr[$i]// /}"  
	   add="$add${stageArr[$i]} " 
	done
	git add $add
	echo "Skill Completed"
	exec bash
else
	echo "Up to date"
fi
}
showComments(){
echo "1 kbr1 c123"
echo "2 kbr2 c456"
read input
echo "type message"
read msg
case "$input" in
   "1") input="c123 -"
   ;;
   "2") input="c456 -"
   ;;
esac
gitmsg=$input$msg
git commit -m "$gitmsg"
echo "Skill Completed"
exec bash
}
if [ $skill == "home" ]; then
home
fi
if [ $skill == "pull" ]; then
pull
fi
if [ $skill == "push" ]; then
push
fi
if [ $skill == "log" ]; then
log
fi
if [ $skill == "c" ]; then
showComments
fi
if [ $skill == "s" ]; then
status
fi
if [ $skill == "us" ]; then
UnStage
fi
