numbers=()

function infinity(){
	while true;
	do
		read -p "Enter a number (or type 'done' to finish): " input
		if [ "$input" == "done" ]; then
			break
		else
			numbers+=("$input")
		fi
	done 
}

infinity

sorted_numbers=($(for num in "${numbers[@]}";
do
	echo "$num";
done | sort -n))

echo Your numbers:
for number in "${sorted_numbers[@]}";
do
	echo "$number"
done
