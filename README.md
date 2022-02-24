# test-v1

Task given:
----------------
AWS, Kubernetes & Terraform: Setting up an EKS Cluster
This assignment is about setting up an AWS Elastic Kubernetes Service (EKS) cluster through
Terraform and having it run a simple web application reachable from the internet.
In more detail, the requirements are as follows:
• There are two environments, develop and production, each in a separate AWS account. Your
Terraform code should allow for this distinction; for example, it should be possible to have a
different number of worker nodes in each environment (for example, 3 in develop, 6 in
production).
• The cluster’s nodes should be distributed over one region’s availability zones.
• A simple application should be deployed to the cluster. For example, see
https://hub.docker.com/r/nginxdemos/hello/.
• Everything should be setup such that the application is available from the internet through a
load balancer.
You can hand in your solution through a GitHub repository. Please include the following:
• Code that represents what you think clear, well-structured and maintainable code should
look like.
• A readme file that documents how to provision the cluster in an AWS account.

*  As given task these are the steps to provision the eks cluster on aws 
   - create aws account as given requirement two account aws account 
     I have sperated the repo's for both dev and prod terraform provisioning and given the repos in github
     Optionl - As we pass the terraform.tfvars as a variable values we can still use a same code with passing in the main code directory -
      $  terraform plan -var-file env_var/devvalues.tfvars 
      $  terraform plan -var-file env_var/prodvalues.tfvars 

Steps to provision env - dev 
----------------------

Pre-requsites 
  - aws account 
  - aws cli installed and configured with profile name dev
  
   $ sudo ln -s /folder/installed/aws-cli/aws /usr/local/bin/aws 
   
   $ sudo ln -s /folder/installed/aws-cli/aws_completer /usr/local/bin/aws_completer
   
   -  aws configure 
   
    $ aws configure --profile dev  #configure aws cli 
    
  - Install kubectl 
  
  - Install terraform  #brew install hashicorp/tap/terraform
  

   - inside terraform-dev dir, execute terraform dynamoDB/s3bucket creation for keeping terraform statefile 
   
    $ cd terraform/dev/s3-bucket/ && vi create-s3bucket.tf    # create bucketname insde the file create-s3bucket.tf
    
    $ terraform init 
    
    $ terraform plan 
    
    $ terraform apply #s3 bucket will get created
    
    $ cd ../
    
  - add required values on file - terraform.tfvars and backend.tf on main directory to provision the aws eks cluster
   
    $ terraform init    
        
    $ terraform plan
    
    
    $ terraform apply
    
    
    $ aws eks --region us-east-1 update-kubeconfig --name demo  # Create a kubeconfig for aws eks 
    
    
     $ aws eks --region us-east-1 update-kubeconfig --name demo --profile dev
     
     Updated context arn:aws:eks:us-east-1:272075116514:cluster/demo in /Users/narayanm/.kube/config 
     

  - Deploy k8s nginx deployment and service, and allow it to load from public interface using Load balancer.
  
   $ cd k8s/
   
   $ kubectl apply -f deployment.yaml  # deploy nginx deployment 
   
   $ kubectl apply -f public-lb.yaml  #deploy service 
   
   $ kubectl get svc
   

NAME         TYPE           CLUSTER-IP      EXTERNAL-IP                                                                     PORT(S)        AGE
kubernetes   ClusterIP      172.20.0.1      <none$                                                                          443/TCP        31m
public-lb    LoadBalancer   172.20.53.208   afe17ded2ad844aa8b27311f5b9e3aed-33ad2b092fc22b58.elb.us-east-1.amazonaws.com   80:31727/TCP   46s 


  - DNS record can be added in route53 with valid host name with given EXTERNAL-IP whihc is public-lb.yaml 
  
   - afe17ded2ad844aa8b27311f5b9e3aed-33ad2b092fc22b58.elb.us-east-1.amazonaws.com serves on the web with port 80 
   

• Documentation on...

o ...any assumptions you made, since the requirements are certainly far from
complete.

  - As part of the requireement we still missing the cicd in terms of provisioning infrastructure  
  
  - for abow requirenment I add some point too
  
   - Can add terraforn code into cicd pipeline to manage the deployment easily with multiple stages
   
     -  E.g Can usee gitlab cicd pipeline , github , aws codePipeline 
     

o ...a concept for how you would monitor the cluster’s operation.

- I have attached the seperate document along  giving some insight baout it as I have deployed and given the POC  # not in well formated - my appologies

• A diagram of the infrastructure your code provisions.

- I have attached the current  provisioned infrastructure diagram , designed using draw.io 
