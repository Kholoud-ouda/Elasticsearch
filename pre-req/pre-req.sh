#/bin/bash

echo "Install Velero on ubuntu"
wget https://github.com/vmware-tanzu/velero/releases/download/v1.2.0/velero-v1.2.0-linux-amd64.tar.gz
tar -zxvf velero-v1.2.0-linux-amd64.tar.gz
sudo mv velero-v1.2.0-linux-amd64/velero /usr/local/bin/

echo "Please enter the bucket name for Velero backup"
read BUCKET

velero install --provider gcp --plugins velero/velero-plugin-for-gcp:v1.3.0  --bucket $BUCKET --secret-file ./credentials-velero

echo "Install Elasticsearch operator"
kubectl apply -f https://download.elastic.co/downloads/eck/1.5.0/all-in-one.yaml