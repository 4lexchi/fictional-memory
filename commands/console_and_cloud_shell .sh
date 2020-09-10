#OBJECTIVES
#In this lab, you learn how to perform the following tasks:
#get access to Google Cloud
#create a Cloud Storage bucket using the Cloud Console
#create a Cloud Storage bucket using Cloud Shell
#become familiar with Cloud Shell features

#launch the ephemeral VM by clicking on the "Activate Cloud Shell" icon
#ensure the correct project ID is set

gcloud config set project qwiklabs-gcp-04-944a5adac6d5

#create two multi-region buckets with standard default storage class

gsutil mb gs://qwiklabs-gcp-04-944a5adac6d5-1 && gsutil mb gs://qwiklabs-gcp-04-944a5adac6d5-2

#upload a sample text file to the ephemeral VM. this command will prompt you to allow generation of an SSH key if one doesn't already exist so as to ensure encrypted uploads from your local machine

gcloud alpha cloud-shell scp localhost:~sample.txt cloudshell:~/sample.txt

#copy the sample text file to the first bucket

gsutil cp sample.txt gs://qwiklabs-gcp-04-944a5adac6d5-1

#list available regions

gcloud compute regions list

#select us-central1 as your region and save it in a variable 

INFRACLASS_REGION=us-central1

#verify it with echo

echo $INFRACLASS_REGION

#create a subdirectory

mkdir infraclass

#create a config file in this directory

touch infraclass/config

#append the value of the region environment variable to the config file

echo INFRACLASS_REGION=$INFRACLASS_REGION >> ~/infraclass/config

#save the project ID in a variable

INFRACLASS_PROJECT_ID=qwiklabs-gcp-04-944a5adac6d5

#use the source command to set the environment variables

source infraclass/config

#use the echo command to verify that the project variable was set

echo $INFRACLASS_PROJECT_ID

#close and reopen cloud shell and issue the echo command

echo $INFRACLASS_PROJECT_ID

#there is no output since the environment variable no longer exists

#edit the shell profile

nano .profile

#to the end of the file add

source infraclass/config

#use the echo command to verify that the variable is still set

echo $INFRACLASS_PROJECT_ID





