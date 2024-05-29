read -p "Enter a directory: " directory

result=$(ls -f -1 "$directory" | wc -l)
countfiles=`expr $result - 2`
last_modified=$(stat -c %y $directory)
largest_file=$(find "$directory" -type f -exec ls -s {} + | sort -n | head -n 1 | awk '{print $2}')
smallest_file=$(find "$directory" -type f -exec ls -s {} + | sort -n -r | head -n 1 | awk '{print $2}')



echo $countfiles
echo $last_modified
echo $largest_file
echo $smallest_file
