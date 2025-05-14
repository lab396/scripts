#!/bin/bash

# Root directory to search from
ROOT_DIR="$(pwd)"

echo "Searching for *.err files in job directories under $ROOT_DIR..."

# Find all directories containing .slurm files
find "$ROOT_DIR" -type f -name "*.slurm" | while read -r slurm_file; do
    job_dir=$(dirname "$slurm_file")

    echo "----------------------------------------"
    echo "Looking for .err files in: $job_dir"

    # List and cat all .err files in this directory
    err_files=("$job_dir"/*.err)

    # Check if any .err files exist
    if compgen -G "$job_dir"/*.err > /dev/null; then
        for err_file in "${err_files[@]}"; do
            echo "Contents of: $err_file"
            echo "----------------------------------------"
            cat "$err_file"
            echo -e "\n"  # extra spacing between files
        done
    else
        echo "No .err files found in $job_dir"
    fi
done

echo "Done printing all .err files."
