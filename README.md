**Nodejs application automatic deployment using Github Action, Kubernetes, Docker, Terraform, minikube, and ansible.**

Reference image pdf: assignment.pdf

**Pre-requisite:** 

Aws Account: Here AWS is used as a ROOT account.


Ec2-instance: t2-medium

S3-bucket

Github account with repo

**Required Tools to be install in this project:**

- Terraform
- Ansible
- Docker
- Helm
- Minikube

**Steps:**
- Created github repo
  
- Created main.tf, and backend.tf file for terraform.
  
  In terraform created one t2.medium ec2-instance with open required ports, and one s3-bucket file to store the terraform state file.

- Created ansible.yml file.
  
  Installed required tools this project.

- Created terraform.yml file for github action

In github action 3 stages has been created.

**Named As:**

**1. terraform:**
- Created ec2-instance and stored terraform state file in s3-bucket

**2. ansible:**
- Update apt cache
- Installed base dependencies for docker
- Add Docker GPG apt Key
- Install Docker
- Ensure Docker is started and enabled
- Ensure docker group exists
- Restart Docker to ensure group change takes effect
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

**3. docker_k8s_deploy:**
- Clone the repo
- Docker login
- Build and push the code in docker hub
- Start minikube
- Update deployment with latest image
- Apply ingress, app, deployment.yml, and service file
- Expose app, prometheus, and grafana with ports (3000, 3001, 9090)
