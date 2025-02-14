#!/bin/bash

# Check if a file is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

# File containing user IDs
FILE="$1"

# Ensure the file exists
if [ ! -f "$FILE" ]; then
    echo "Error: File '$FILE' not found!"
    exit 1
fi

# Get unique user IDs
unique_ids=$(sort "$FILE" | uniq)

# Count unique user IDs
count=$(echo "$unique_ids" | wc -l)

# Display results
echo "Unique User ID Count: $count"
echo "Unique User IDs:"
echo "$unique_ids"

