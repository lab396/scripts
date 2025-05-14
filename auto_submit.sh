#!/bin/bash

# Root directory to search from (can be customized or passed as argument)
ROOT_DIR="$(pwd)"  # or set this explicitly, e.g., /path/to/test/jobs

echo "Searching for .slurm submission scripts under $ROOT_DIR..."

# Find all *.slurm files and process them
find "$ROOT_DIR" -type f -name "*.slurm" | while read -r slurm_file; do
    job_dir=$(dirname "$slurm_file")
    echo "----------------------------------------"
    echo "Submitting job from directory: $job_dir"
    echo "Script: $(basename "$slurm_file")"
    
    # Change to the directory and submit the job
    cd "$job_dir" || { echo "Failed to enter $job_dir"; continue; }
    submission_output=$(sbatch "$(basename "$slurm_file")")
    echo "$submission_output"
done

echo "All .slurm jobs have been submitted."

