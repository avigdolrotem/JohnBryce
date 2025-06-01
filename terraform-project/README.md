# README.md

# Terraform AWS Project

This project is designed to provision AWS resources using Terraform. It includes configurations for a security group, EC2 instance, and VPC data retrieval.

## Project Structure

- **providers.tf**: Configures the AWS provider and backend for storing the Terraform state in an S3 bucket.
- **data.tf**: Retrieves data about the VPC based on specified tags.
- **main.tf**: Defines the security group and its ingress/egress rules.
- **main.tf-1**: Contains additional configurations for the EC2 instance, including key pair and block device settings.
- **variables.tf**: Defines variables used throughout the Terraform configuration.
- **output.tf**: Outputs relevant information about the created resources.
- **output.tf-1**: Additional outputs related to the resources created.

## Getting Started

### Prerequisites

- Terraform installed on your machine.
- AWS account with appropriate permissions.

### Initialization

To initialize the project, run:

```
terraform init
```

### Planning

To see the resources that will be created, run:

```
terraform plan
```

### Applying

To create the resources defined in the configuration, run:

```
terraform apply
```

### Destroying

To remove all resources created by this project, run:

```
terraform destroy
```

## Resources Created

- **Security Group**: A security group with ingress rules allowing traffic from the entire VPC CIDR and egress rules allowing all outbound traffic.
- **EC2 Instance**: An EC2 instance configured with specified settings, including block device and subnet selection.

## Notes

Ensure that you update any necessary variables in `variables.tf` before applying the configuration.