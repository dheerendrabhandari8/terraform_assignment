Nodejs Application automatic deployment using Github Action, Kubernetes, Docker, Terraform, and ansible.
Imgage pdf: assignment.pdf
Prerequsite: 
Aws Account: Here I am using aws as a ROOT account.

ec2-instance: t2-medium
s3-bucket
github account

Required Tools to be install in this project
Terraform
ansible
Docker
Helm
Minikube

setps: 
created github repo
created main.tf, and backend.tf file for terrafrom
In terraform created one t2.medium ec2-instance with open required ports, and one s3-bucket file to store the terraform state file.

created ansible.yml file
Installed required tools this project

created terraform.yml file for github action

In github action I have created 3 stage 
Named: 
1- terraform- created ec2-instance and stored terraform state file in s3-bucket
2- ansible- 
- Update apt cache
- installed base dependencies for docker
- Add Docker GPG apt Key
- Install Docker
- Ensure Docker is started and enabled
- Ensure docker group exists
- estart Docker to ensure group change takes effect
- Download Minikube binary
- Move Minikube binary to /usr/local/bin
- Get latest stable kubectl version
- Download kubectl binary
- Move kubectl binary to /usr/local/bin
- Download Helm
- Extract Helm binary
- Move Helm binary to /usr/local/bin
- Enable Docker service for user sessions
- Add Prometheus Helm repo
- Add Grafana Helm repo

3- docker_k8s_deploy: 
- clone the repo
- docker login
- build and push the code in docker hub
- start minikube
- update deployment with latest image
- apply ingress, app, deployment.yml, and service file
- expose app, prometheus, and grafana with ports (3000, 3001, 9090)
