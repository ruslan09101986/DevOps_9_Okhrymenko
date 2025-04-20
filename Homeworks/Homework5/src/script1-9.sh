#!/bin/bash
#1
echo "Hello, World!"

#2
echo "What is your name"
read name
echo "Hello $name"

#3
echo "Specify the file name"
read filename
if [ -e $filename ]; then
   echo "The file you specified $filename exists"
else
   echo "The file you specified $filename does not exist"
fi

#4
for numbers in 1 2 3 4 5 6 7 8 9 10
    do
    echo $numbers
done
 
#5
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <source> <destination>"
    exit 1
fi

SOURCE=$1
DESTINATION=$2

# Copy the file
if cp "$SOURCE" "$DESTINATION"; then
    echo "File copied from '$SOURCE' to '$DESTINATION'"
else
    echo "Error: Could not copy '$SOURCE' to '$DESTINATION'"
fi

#6
read -r -p "Enter a sentence: " sentence

words=($sentence)
reversed_sentence=""

for (( i=${#words[@]}-1; i>=0; i-- )); do
    reversed_sentence+="${words[i]} "
done

reversed_sentence=${reversed_sentence%% }

echo "Reversed sentence: $reversed_sentence"

#7
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 filename"
    exit 1
fi

filename="$1"

if [ ! -f "$filename" ]; then
    echo "Error: File '$filename' not found!"
    exit 1
fi

line_count=$(wc -l < "$filename")
echo "The file '$filename' has $line_count lines."

#8
fruits=("Apple" "Banana" "Cherry" "Date" "Elderberry")

for fruit in "${fruits[@]}"; do
    echo "$fruit"
done

#9
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 filename" >&2
    exit 1
fi

filename="$1"

if [ ! -e "$filename" ]; then
    echo "Error: File '$filename' does not exist!" >&2
    exit 1
fi

if [ ! -r "$filename" ]; then
    echo "Error: File '$filename' is not readable!" >&2
    exit 1
fi

while IFS= read -r line; do
    echo "$line"
done < "$filename"
