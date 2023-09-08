# Terraform Init

This repo is a module containing the resources and deployments steps needed to start using Terraform to provision AWS resources.

## Deployment Steps
1. manually create an S3 bucket and a dynamoDB table
2. `terraform import aws_s3_bucket.state terraform-state-assorted`
3. `terraform import aws_dynamodb_table.lock terraform-state-lock`
4. `terraform apply`

## todo

- [ ] make a terragrunt version
- [x] write deployment steps
- [ ] check permissions
