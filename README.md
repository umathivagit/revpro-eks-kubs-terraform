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

#-- don't forget to update the worker-node role arn in the yaml file
sudo vi aws-auth-cm.yaml

kubectl apply -f aws-auth-cm.yaml

kubectl get nodes --watch

kubectl get pods --all-namespaces

# HAProxy Controller
kubectl apply -f https://raw.githubusercontent.com/haproxytech/kubernetes-ingress/master/deploy/haproxy-ingress.yaml

# execute haproxy ingress
kubectl apply -f haproxy-ingress.yml

# modify the haproxy service type to LoadBalancer from NodePort , Now check for the kubectl get svc (svc of haproxy) should display the classic load balancer url

# Edit the Listener of LoadBalancer created in AWS from  TCP to Http/80 to HaProxy Service Port No same for HTTPS also


#ELK Installation and Configuration (From the ElasticSearch EC2)
sudo apt-get update
sudo apt-get install apt-transport-https
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
sudo apt-get install default-jdk
sudo update-rc.d elasticsearch defaults 95 10
sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable elasticsearch.service
sudo systemctl start elasticsearch.service
sudo journalctl --unit elasticsearch
sudo nano /etc/elasticsearch/elasticsearch.yml
sudo nano etc/elasticsearch/jvm.options
sudo nano /etc/default/elasticsearch

--uninstall
sudo apt-get --purge autoremove elasticsearch
sudo rm -rf /var/lib/elasticsearch/
sudo rm -rf /etc/elasticsearch
sudo journalctl -u elasticsearch
--uninstall

 curl -X PUT "localhost:9200/_cluster/_settings?pretty" -H 'Content-Type: application/json' -d'
{
    "index" : {
        "refresh_interval" : "-1"
    }
}
'

curl -XPUT "localhost:9200/filebeat-*/_settings?pretty" -H 'Content-Type: application/json' -d'
{
    "index" : {
        "number_of_replicas" : 0
    }
}
'

#uncomment the below lines in the file
	bootstrap.memory_lock: true
	network.host: localhost
	http.port: 9200
	xpack.security.enabled: true
	xpack.security.audit.enabled: true
	node.name: rev-es-node-1
  
sudo nano /usr/lib/systemd/system/elasticsearch.service or sudo /bin/systemctl enable elasticsearch.service
sudo systemctl edit elasticsearch

#Kibana Installation
sudo apt-get update && sudo apt-get install kibana

sudo update-rc.d kibana defaults 95 10

sudo /bin/systemctl daemon-reload

sudo /bin/systemctl enable kibana.service

sudo nano /etc/kibana/kibana.yml


  

