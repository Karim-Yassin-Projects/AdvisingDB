#!/bin/bash

# Get the directory of the current script
script_dir="$(dirname "$0")"

# Use pushd to change to the script's directory
pushd "$script_dir/AdvisingDB"
# Define the output file
outputFile="$script_dir/Advising_Team_57.sql"

# Clear the output file if it already exists
echo -n "CREATE DATABASE Advising_Team_57" > $outputFile
echo -n -e "\r\n" >> $outputFile
echo -n "USE Advising_Team_57" >> $outputFile
echo -n -e "\r\n\r\nGO\r\n\r\n" >> $outputFile

# Concatenate the root files
for file in CreateAllTables.sql DropAllTables.sql ClearAllRecords.sql
do
    sed '1s/^\xEF\xBB\xBF//' $file >> $outputFile
    echo -n -e "\r\n\r\nGO\r\n\r\n" >> $outputFile
done

# Concatenate the files in the subfolders
for folder in views fns procs
do
    for file in $folder/*.sql
    do
        sed '1s/^\xEF\xBB\xBF//' $file >> $outputFile
        echo -n -e "\r\n\r\nGO\r\n\r\n" >> $outputFile
    done
done

popd