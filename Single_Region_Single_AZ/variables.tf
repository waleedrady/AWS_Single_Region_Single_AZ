//AWS Configuration
variable access_key {}
variable secret_key {}

variable "username" {
  default = "<Your Username>"
}

variable "US_East_1" {
  default = "us-east-1"
}

variable "USEast1_VPC" {
  default = "10.150.0.0/16"
}

variable "virginia_public_subnet_1" {
  default = "10.150.1.0/24"
}

variable "virginia_private_subnet_1" {
  default = "10.150.5.0/24"
}

//  Existing SSH Key on the AWS
variable "keyname" {
  default = "<Your SSH Key>"
}
