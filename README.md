# Important - Things to perform Post Cluster Formation

curl -o kubectl https://amazon-eks.s3-us-west-2.amazonaws.com/1.13.7/2019-06-11/bin/linux/amd64/kubectl

curl -o kubectl.sha256 https://amazon-eks.s3-us-west-2.amazonaws.com/1.13.7/2019-06-11/bin/linux/amd64/kubectl.sha256

openssl sha1 -sha256 kubectl

chmod +x ./kubectl

mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$HOME/bin:$PATH

echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc

curl -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.13.7/2019-06-11/bin/linux/amd64/aws-iam-authenticator

chmod +x ./aws-iam-authenticator

mkdir -p $HOME/bin && cp ./aws-iam-authenticator $HOME/bin/aws-iam-authenticator && export PATH=$HOME/bin:$PATH

echo 'export PATH=$HOME/bin:$PATH'>> ~/.bashrc

aws configure set region us-east-1 --profile default

sudo apt install python3-pip

pip3 install --upgrade --user awscli

aws eks --region us-east-1 update-kubeconfig --name revpro-preview-cluster --profile default

curl -o aws-auth-cm.yaml https://amazon-eks.s3-us-west-2.amazonaws.com/cloudformation/2019-02-11/aws-auth-cm.yaml

-- don't forget to update the worker-node role arn in the yaml file
sudo vi aws-auth-cm.yaml

kubectl apply -f aws-auth-cm.yaml

kubectl get nodes --watch

kubectl get pods --all-namespaces
