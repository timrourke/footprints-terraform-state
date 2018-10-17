# footprints-terraform-state 

This repository contains the Terraform plan for provisioning our shared S3
bucket for storing Terraform state, and the corresponding DynamoDB table we use
for locking state access in the event we are working concurrently.

See [https://medium.com/@jessgreb01/how-to-terraform-locking-state-in-s3-2dc9a5665cb6](https://medium.com/@jessgreb01/how-to-terraform-locking-state-in-s3-2dc9a5665cb6)
for the inspiration of this simple plan.
