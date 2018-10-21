# assumes we have gcloud installed
sudo gsutil -m rsync -P -r -d -x ".*\.cache.*|.*\.git.*|.*google-cloud-sdk.*|.*miniconda3.*" /home gs://storage-clusterfs
