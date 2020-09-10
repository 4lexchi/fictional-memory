#OBJECTIVES
#In this lab, you learn how to perform the following tasks:
#Create several standard VMs
#create advanced VMs

#launch the ephemeral VM by clicking on the "Activate Cloud Shell" icon
#ensure the correct project ID is set

gcloud config set project qwiklabs-gcp-03-f201f63eb23c

#create the VM "instance-1" in the zone "us-central1-c" on the "default network" of machine type "n1-standard-1" from the image "debian-9-stretch-v20200902" on a "10 GB" boot disk with "no external IP address"

gcloud compute instances create instance-1 --zone=us-central1-c --machine-type=n1-standard-1 --image-project=debian-cloud --image=debian-9-stretch-v20200902 --subnet=default --no-address

#create the VM "instance-2" in the zone "europe-west2-a" on the "default network" of machine type "n1-standard-2" from the image "windows-server-2016-dc-core-v20200813" on a "100 GB" boot disk

gcloud compute instances create instance-2 --zone=europe-west2-a --machine-type=n1-standard-2 --image-project=windows-cloud --image=windows-server-2016-dc-core-v20200813 --boot-disk-size=100GB --boot-disk-type=pd-ssd --boot-disk-device-name=instance-2 --subnet=default --tags=http,https 

#allow HTTP and HTTPS traffic for "instance-2"

gcloud compute firewall-rules create default-allow-http --direction=INGRESS --priority=1000 --network=default --action=ALLOW --rules=tcp:80 --source-ranges=0.0.0.0/0 --target-tags=http


gcloud compute firewall-rules create default-allow-https --direction=INGRESS --priority=1000 --network=default --action=ALLOW --rules=tcp:443 --source-ranges=0.0.0.0/0 --target-tags=https

#create the VM "instance-3" in the zone "us-west1-b" on the "default network" of custom machine type with "6 vCPUs and 32 GB memory" from the image "debian-9-stretch-v20200902" on a "10 GB" boot disk

gcloud compute instances create instance-3 --zone=us-west1-b --machine-type=custom-6-32768 --image-project=debian-cloud --image=debian-9-stretch-v20200902 --boot-disk-size=10GB --boot-disk-type=pd-standard --boot-disk-device-name=instance-3 --subnet=default 

#SSH into the VM "instance-3" and run the following command to see information about used, unused memory and swap space

free

#to see details about the installed RAM run

sudo dmidecode -t 17

#to verify the number of processors run

nproc

#to see details about the installed CPUs run

lscpu

#to exit the SSH terminal run

exit
