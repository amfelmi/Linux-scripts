function useridgroup(){
	read -p "Enter username: " username
	echo $(id "$username")
}

useridgroup
