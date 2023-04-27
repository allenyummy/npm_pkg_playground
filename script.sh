# Define the git diff command and capture its output to a variable
file_list=$(git diff --name-only HEAD~1 HEAD)

# Split the output into an array of file names
IFS=$'\n' read -d '' -r -a file_array <<< "$file_list"

# Check if a specific directory is present in the file_array
dir_to_check="src"
found_dir=false
for file_name in "${file_array[@]}"
do
    dir_name=$(dirname "$file_name")
    if [ "$dir_name" = "$dir_to_check" ]; then
        found_dir=true
        break
    fi
done

if $found_dir; then
    echo "Found directory: $dir_to_check"
else
    echo "Directory not found: $dir_to_check"
fi