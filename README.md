# Class 7 Gut Check: Jenkins + Terraform + S3 Webhook Lab

This is a Jenkins pipeline that is triggered by a GitHub webhook and uses Terraform to deploy AWS infrastructure. The pipeline creates an S3 bucket, uploads project screenshots proving my capability of creating a Jenkins pipeline to Github.

## Project Goals

- GitHub can trigger Jenkins automatically through a webhook
- Jenkins can pull a repository from GitHub
- Jenkins can run Terraform successfully
- Terraform can use an S3 backend for state storage
- Terraform can create an S3 bucket in AWS
- Terraform can upload screenshots and project files into that bucket
- Uploaded files can be made publicly accessible

## Repository Contents

```text
.
├── Jenkinsfile
├── test-bucket.tf
├── user-data.sh
├── plugins.yaml
├── trigger.md
├── armageddon.md
├── Screenshots/
└── README.md

