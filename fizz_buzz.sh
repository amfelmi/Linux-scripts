numbers=()

function fizz_buzz(){
	while true;
	do
		read -p "Enter a number >= 1 (type 'done' to finish): " input
		if [ $input == "done" ]
		then
			break
		fi
		if [ $input -eq 0 ]
		then
			echo "Enter a number above 0"
		fi
		numbers+=("$input")
		result3=`expr $input % 3`
		result5=`expr $input % 5`
		if [ $result3 -eq 0 ]
		then
			echo "Fizz!"
		elif [ $result5 -eq 0 ]
		then
			echo "Buzz!"
		fi
	done
}

fizz_buzz
