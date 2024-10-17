#!/bin/bash

# Mapping for any special activity names
declare -A activity_map
activity_map=( ["Spain"]="run" )  # Map 'Spain' to 'run' or appropriate activity

for dir in Lab2*/; do
    # Remove the trailing slash
    dirname="${dir%/}"
    
    # Remove 'Lab2' prefix to get activity and number
    activity_and_num="${dirname#Lab2}"
    
    # Extract activity and number using regex
    if [[ $activity_and_num =~ ^([a-zA-Z]+)([0-9]+)$ ]]; then
        activity="${BASH_REMATCH[1]}"
        num="${BASH_REMATCH[2]}"
        
        # Handle any special activity names
        if [[ ${activity_map[$activity]} ]]; then
            activity="${activity_map[$activity]}"
        fi
        
        echo "Processing directory: $dirname (Activity: $activity, Number: $num)"
        
        # Original filenames
        accel_original="$dir/Accelerometer.csv"
        gyro_original="$dir/Gyroscope.csv"
        
        # New filenames
        accel_new="$dir/acc_${activity}${num}.csv"
        gyro_new="$dir/gyro_${activity}${num}.csv"
        
        # Rename Accelerometer.csv
        if [ -f "$accel_original" ]; then
            mv "$accel_original" "$accel_new"
            echo "Renamed $accel_original to $accel_new"
        else
            echo "File $accel_original does not exist."
        fi
        
        # Rename Gyroscope.csv
        if [ -f "$gyro_original" ]; then
            mv "$gyro_original" "$gyro_new"
            echo "Renamed $gyro_original to $gyro_new"
        else
            echo "File $gyro_original does not exist."
        fi
    else
        echo "Directory name $dirname does not match expected pattern."
    fi
done
