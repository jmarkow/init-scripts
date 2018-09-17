# assumes we have gcloud installed
sudo gsutil -m rsync -r -n -x ".*google-cloud-sdk.*|.*miniconda3.*" /home gs://storage-clusterfs
