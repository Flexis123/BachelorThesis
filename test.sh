#!/bin/bash

# Define the function
process_array_and_int() {
  local -n arr=$1  # Use nameref to refer to the passed array
  local num=$2

  # Process the array and integer
  echo "Processing array: ${arr[@]}"
  echo "Processing integer: $num"

  # Example of using the array and integer
  for item in "${arr[@]}"; do
    echo "$item"
    
  done
}

# Example usage
my_array=(0.05 0.1 0.25)
number=3

process_array_and_int my_array $number
