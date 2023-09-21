#!/bin/bash

# Name of the data file
DATA_FILE="phonedata.txt"

# Check if the phonedata.txt exists, if not, create it
[ -f $DATA_FILE ] || touch $DATA_FILE

# Function to add a new entry
add_entry() {
    echo "$1: $2" >> $DATA_FILE
}

# Function to display an entry
display_entry() {
    grep -i "^$1:" $DATA_FILE
    if [ $? -ne 0 ]; then
        echo "Entry not found for $1"
    fi
}

# Function to list all entries
list_entries() {
    if [[ -s $DATA_FILE ]]; then
        cat $DATA_FILE
    else
        echo "phonebook is empty"
    fi
}

# Function to remove an entry
remove_entry() {
    sed -i "/^$1:/Id" $DATA_FILE
}

# Function to clear the phonebook
clear_phonebook() {
    > $DATA_FILE
}

# Check the command-line arguments and call the appropriate function
case $1 in
    "new")
        add_entry $2 $3
        ;;
    "list")
        list_entries
        ;;
    "remove")
        remove_entry $2
        ;;
    "clear")
        clear_phonebook
        ;;
    *)
        display_entry $1
        ;;
esac
