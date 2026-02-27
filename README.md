## 1. Project Overview
This project automates the creation of a custom Amazon Machine Image (AMI) on AWS. It provisions an Ubuntu server, installs an Apache web server with a custom "Nandini" landing page, and "bakes" that configuration into a reusable image for consistent deployments.
### 2. Architecture

## 3. Project Structure
```text
project/
├── provider.tf
├── variables.tf
├── terraform.tfvars
└── main.tf
```
## 4. Terraform Commands Used
* `terraform init`
* `terraform validate`
* `terraform plan`
* `terraform apply`
* `terraform destroy`
```
```
## 5. Troubleshooting
* **Problem: Variables Not Fetching**
  * Terraform prompted for the `aws_access_key` manually in the CLI because it could not find the `terraform.tfvars` file.
* **Solution: Extension Correction**
  * The file was incorrectly saved as `terraform.tfvars.txt` due to hidden Windows file extensions. 
  * After enabling file extensions in Windows Explorer and removing the `.txt` suffix, Terraform successfully auto-loaded the credentials.
```
