# Class 7 Gut Check: Jenkins + Terraform + S3 Webhook Lab

This project demonstrates a Jenkins pipeline that is triggered by a GitHub webhook and uses Terraform to deploy AWS infrastructure. The pipeline creates an S3 bucket, uploads project files and screenshots, and optionally destroys the resources at the end of the run.

## Project Goals

This lab is designed to prove that:

- GitHub can trigger Jenkins automatically through a webhook
- Jenkins can pull a repository from GitHub
- Jenkins can run Terraform successfully
- Terraform can use an S3 backend for state storage
- Terraform can create an S3 bucket in AWS
- Terraform can upload screenshots and project files into that bucket
- Uploaded files can be made publicly accessible
- Infrastructure can optionally be destroyed after testing

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

