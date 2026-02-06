#!bin/bash

 USERID=$(id-u)

 if [ $USERID -ne 0 ]; then
     echo "please run this script with root user access"
     exit 1
 fi

 echo "Insatlling Nginx"
 dnf install nginx -y

 if [ $? -ne 0 ]; then
      echo " Installing Nginx .... Failure"
      exit 1
 else
      echo " Installing Nginx .... success"
 fi           