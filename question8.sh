# $HOME to go striaght to the current users home directory. Neat.
output_file="$HOME/user_info.txt"

echo "User ID and usernames" > $output_file #Title
echo "---------------------" >> $output_file #Seperator

#IFS = In Field Seperater, will take a char to seperate data. The Data in etc/passwd is seperated by :. 
#The read -r will read the whole line. The first data is the username, then x (which is ignored using _), then the ID
#There are 4 more : therefore, we must use underscore 4 more times to ignore the rest of the line.
#To make it neat, there is a string followed by the stored data in the variables. This will repeat until the end.
#Finally, we must redirect this into the file we created. The while loop is reading the file passed into it using <.

while IFS=: read -r username _ user_id _ _ _ _;
do
	echo "User ID: $user_id - Username: $username" >> "$output_file"
done < /etc/passwd

echo "File read and copied to $output_file"

user=$(whoami);

#To check each file in the home directory, we must use a for loop.
temp_file=$(mktemp)
ls -p $HOME | grep -v / > "$temp_file"
while IFS= read -r file;
do
	file_owner=$(stat -c "%U" $HOME/"$file");
	#echo "The file is: $file
	#echo $(stat -c %U $HOME/"$file)
	if [ $file_owner != "majid" ] && [ $file_owner != "root" ]; then
		rm "$file"
		echo "Deleted the file: $file"
	else
		echo "Not a parasyte"
	fi
done < "$temp_file"

rm "$temp_file"
