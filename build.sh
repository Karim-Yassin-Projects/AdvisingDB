#!/bin/bash

db_name="Advising_Team_57"
# Get the directory of the current script
script_name="$(realpath "$0")"
script_dir="$(dirname "$script_name")"
# Define the output file
outputFile="$script_dir/$db_name.sql"

echo $outputFile

# Use pushd to change to the script's directory
pushd "$script_dir/AdvisingDB"

# Clear the output file if it already exists
echo -n -e "USE MASTER" > $outputFile
echo -n -e "\n\nGO\n\n" >> $outputFile

echo -n -e "IF EXISTS (SELECT * FROM sys.databases WHERE name = '$db_name')\n\tDROP DATABASE $db_name\n\nGO\n\n" >> $outputFile
echo -n "CREATE DATABASE $db_name" >> $outputFile
echo -n -e "\n\nGO\n\n" >> $outputFile
echo -n "USE $db_name" >> $outputFile
echo -n -e "\n\nGO\n\n" >> $outputFile

# Concatenate the root files
for file in CreateAllTables.sql DropAllTables.sql ClearAllRecords.sql
do
    sed '1s/^\xEF\xBB\xBF//' $file >> $outputFile
    echo -n -e "\n\nGO\n\n" >> $outputFile
done

echo -n -e "EXECUTE CreateAllTables\n\nGO\n\n" >> $outputFile
# Concatenate the files in the subfolders
for folder in views fns procs
do
    for file in $folder/*.sql
    do
        sed '1s/^\xEF\xBB\xBF//' $file >> $outputFile
        echo -n -e "\n\nGO\n\n" >> $outputFile
    done
done

popd