#!/bin/bash
# author: ethan
# date: 4/14/2025
# date modified: 4/14/2025
# descirption:
# using the select command to give the user a number of options to choose from
# then using a loop to execute a statement based on the users chosen variable

PS3="What type of operating system do you use?: "

select OS in windows mac linux; do
        echo "You chose $OS"
        break
done

PS3="What department do you work in?: "

select department in finance sales marketing engineering "human resources"; do
        echo "You chose $department"
        break
done

echo "$OS,$department" >> OS-department.csv
