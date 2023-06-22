#!/bin/bash
#this project creates a new user on remote system to test merge
#you will be promted to enter user name(loogin) person name, and password
#username password and hostname  will be displayed at the end of the project 
#
#1) make sure taht script is running in root or superuser previalages

if [[ "${UID}" -ne 0 ]]
then 
	echo "please run in the root user"

	exit 1
fi

#2) create a username
#
echo "please enter your username to create"
read USER_NAME

#3) Get the real name 
echo "please ennter your name or application name which you wish to keep"
read COMMENT

#4) get the password

echo "please enter your password"
read PASSWORD

#CREATING USERNAME
#
useradd -c "${COMMENT}" -m ${USER_NAME}

#5) checking  if username is created or not
#
if [[ "${?}" -ne 0 ]]
then 
	echo "this account could not be created"
	exit 1

fi

#6) creating password 
#
echo "${PASSWORD}" | passwd --stdin ${USER_NAME}

#7) checking the condition weather its accpeting or not
#
if [[ "${?}" -ne 0 ]]
then
	echo "your password is not correct"
	exit 1

fi

#8) forcing the user to change his/her password
passwd -e "${USER_NAME}"


#9) Displaying the username pasword and host 
#
echo 
echo "${USER_NAME}"
echo 
echo "${PASSWORD}"
echo 
echo "${HOSTNAME}"

