#! /bin/bash

# Enter the directory with source control (SVN).
cd "[PROJECT DIRECTORY]/[YOUR NETID]/hw00"

# Following is example for project 00, innerproduct.m

# It works by making small changes to code every time you submit.

if grep -q autosvn 'innerproduct.m'; then
  # Flag = has 'autosvn'
  # Here, helperfun can be any function name, notice to be unique, 
  # or other content may be altered
  sed -i 's/helper/helperfun/g' innerproduct.m
  # Switch flag
  sed -i 's/autosvn/svnauto/g' innerproduct.m
else
  # Flag = ! has 'autosvn'
  sed -i 's/helperfun/helper/g' innerproduct.m
  sed -i 's/svnauto/autosvn/g' innerproduct.m
fi

# Maintain a counter at the end of file, here it's simply a comment:
# % submit 123

# Get counter value using grep
COUNTER=$(grep -o 'submit\s[0-9]*' innerproduct.m | grep -o '[0-9]*')

# Create a new value for counter++
COUNTER_N=$(expr $COUNTER + 1)

# Replace the counter in file
sed -i "s/submit $COUNTER/submit $COUNTER_N/g" innerproduct.m

# Check you have sshpass installed AND have logged in at least 
# once onto CSUGLAB to save the server credential (public key).

# PLEASE MAKE SURE YOU ARE ON CAMPUS OR CONNECTED TO CUVPN.

# Commit using this command, comment can be anything
sshpass -p [YOUR PASSWORD] svn commit -m "this is a retry"

# YOUR CORNELL PASSWORD IS STORED IN PLAIN TEXT!!!
# Store the script in a secure location (e.g. NOT in a Samba folder) 
# and make sure only you have access.
