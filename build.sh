#!/bin/bash

# Define the output file
outputFile="Advising_Team_57.sql"

# Clear the output file if it already exists
echo "CREATE DATABASE Advising_Team_57" > $outputFile
echo "\nGO\n" >> $outputFile
echo "USE Advising_Team_57" >> $outputFile
echo "\nGO\n" >> $outputFile

# Concatenate the root files
for file in CreateAllTables.sql DropAllTables.sql ClearAllRecords.sql
do
    cat $file >> $outputFile
    echo -e "\nGO\n" >> $outputFile
done

# Concatenate the files in the subfolders
for folder in views fns procs
do
    for file in $folder/*.sql
    do
        cat $file >> $outputFile
        echo -e "\nGO\n" >> $outputFile
    done
done