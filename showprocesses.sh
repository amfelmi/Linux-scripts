function showprocesses(){
	top
	read -p "Enter PID: " pid
	$(kill $pid)
}

showprocesses
