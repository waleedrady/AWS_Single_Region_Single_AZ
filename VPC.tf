module "singleregion-singleaz-module" {
  source     = "WEEMR/singleregion-singleaz-module/aws"
  version    = "0.0.1"
  access_key      = " < Access Key > "                         #  IAM Account Access Key
  secret_key      = " < Secret Key > "                         #  IAM Account Secret Key
  username        = " < Name > "                               #  Your 1st Initial, Last Name to tag resources
  keyname         = " < AWS Keypair > "                        #  Your AWS Keypair to create resources
}



#  ----------------  Outputs  -----------------  # 

output "VPC_CIDR" {
  value = module.singleregion-singleaz-module.VPC_CIDR
}

output "Public_Subnet_CIDR" {
  value = module.singleregion-singleaz-module.Public_Subnet_CIDR
}

output "Private_Subnet_CIDR" {
  value = module.singleregion-singleaz-module.Private_Subnet_CIDR
}
