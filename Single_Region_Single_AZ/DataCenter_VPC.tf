// AWS VPC
resource "aws_vpc" "My_First_VPC" {
  cidr_block           = var.USEast1_VPC
  enable_dns_support   = true
  enable_dns_hostnames = true
  enable_classiclink   = false
  instance_tenancy     = "default"
  tags = {
    Name       = "${var.username}_Terraform_VPC"
    Owner      = var.username
    Enviroment = "Terraform Testing"
  }
}

// --------------------------------------------------------------------------------------- Availability Zones

// Get all avaliable AZ's in Virgina (US-East-1)

data "aws_availability_zones" "AZs_US_East_1" {
  state = "available"
}

// ------------------------------------------------------------------------------------------------------------- Virginia Subnets 

// ------------------------------------------------------------------------------ Virginia Public Subnets

// Virginia Public Subnet 1

resource "aws_subnet" "Virginia_Public_Subnet_1" {
  vpc_id            = aws_vpc.My_First_VPC.id
  cidr_block        = var.virginia_public_subnet_1
  availability_zone = data.aws_availability_zones.AZs_US_East_1.names[0]
  tags = {
    Name       = "${var.username}_Terraform_SDAWN_Virginia_Public_Subnet_1"
    Owner      = var.username
    Enviroment = "Terraform Testing"
  }
}


// Virginia Public Subnets Association with Main Route Table

// Public Subnet 1 Association

resource "aws_route_table_association" "virginia_public1_RT_association" {
  subnet_id      = aws_subnet.Virginia_Public_Subnet_1.id
  route_table_id = aws_default_route_table.Virginia_Public_Subnet_RT.id
}

// ------------------------------------------------------------------------------ Virginia Private Subnets


// Virginia Private Subnet 1

resource "aws_subnet" "Virginia_Private_Subnet_1" {
  vpc_id            = aws_vpc.My_First_VPC.id
  cidr_block        = var.virginia_private_subnet_1
  availability_zone = data.aws_availability_zones.AZs_US_East_1.names[0]
  tags = {
    Name       = "${var.username}_Terraform_SDAWN_Virginia_Private_Subnet_1"
    Owner      = var.username
    Enviroment = "Terraform Testing"

  }
}

// Virginia Private Subnets Association with Private Route Table

// Private Subnet 1 Association

resource "aws_route_table_association" "virginia_private1_RT_association" {
  subnet_id      = aws_subnet.Virginia_Private_Subnet_1.id
  route_table_id = aws_route_table.Virgina_Private_Subnet_RT.id
}
