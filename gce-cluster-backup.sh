# assumes we have gcloud installed
sudo gsutil -m rsync -r -x ".*google-cloud-sdk.*|.*miniconda3.*" /home gs://storage-clusterfs
