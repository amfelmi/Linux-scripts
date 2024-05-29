function is_odd(){
	read -p "Enter a number: " number
	result=`expr $number % 2`
	if [ $result -eq 0 ]
	then
		echo "Even"
	else
		echo "Odd"
fi
}

is_odd
