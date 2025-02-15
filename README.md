chmod 400 keypair.pem
ssh-keygen -f keypair.pem -y > mypubkey.pub

# Terrafrom setup
curl -o terraform.zip https://releases.hashicorp.com/terraform/1.10.5/terraform_1.10.5_linux_amd64.zip
unzip -o terraform.zip && sudo mv terraform /usr/local/bin/
terraform --version

terraform init
terraform validate
terraform plan
terraform apply -auto-approve
   
terraform destroy -auto-approve

# EKS Setup
curl -o kubectl https://s3.us-west-2.amazonaws.com/amazon-eks/1.23.9/2022-09-27/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
kubectl version --client

curl -sL "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_Linux_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
eksctl version
