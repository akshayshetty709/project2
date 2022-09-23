#!/bin/bash
echo "1. Name is file/dir/link? \n
2. Create a link \n
3. Search the Pattern \n
4. Edit the file \n
5. Find file location \n
6. Exit"
echo "Enter your choice"
read choice
case $choice in
1) echo "enter name to check"
read name
if [ -f $name ]; then
echo "$name is a file"
elif [ -d $name ]; then
echo "$name is a directory"
elif [ -L $name ]; then
echo "$name is a link"
else
echo "$name doesnt exist"
fi
;;
2) echo "enter file name"
read name
if [ ! -f $name ]; then
echo "$name doesnt exist"
exit 1
fi
echo "enter link name"
read lin
if [ -L $lin ];then
echo "$lin already exists"
exit 1
fi
ln -s $name $lin
echo "link created succesfully"
;;
3) echo "enter a pattern/word to search in files"
read pattern
grep -l -r "$pattern" *>found.txt
if [ $? -eq 0 ]; then
echo "$pattern found in following file/files"
cat found.txt
else
echo "$pattern not found in any files"
fi
;;
4) echo "enter file name to edit"
read file
if [ -f $file ];then
echo "file found; opening it to edit"
 vi $file
else
echo "file doesnt exist"
fi
;;
5) echo "enter file name to search"
read file
find . -type f -iname "$file">found
empt=`cat found| wc -l`
if [ $empt -ne 0 ];then
echo "$file is located in the below location/locations"
cat found
else
echo "$file not found"
fi
;;
6) echo "Thank you; Exiting script"
exit 0
;;
*) echo "You have entered a invalid choice"
;;
esac
