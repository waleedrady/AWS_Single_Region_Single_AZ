// Creating Internet Gateway
resource "aws_internet_gateway" "Virginia_IGW" {
  vpc_id = aws_vpc.My_First_VPC.id
  tags = {
    Name       = "${var.username}_Terraform_IGW"
    Owner      = var.username
    Enviroment = "Terraform Testing"
  }
}

// Route Table

// Virgina Public Route Table  (Main / Default Route Table)

resource "aws_default_route_table" "Virginia_Public_Subnet_RT" {
  default_route_table_id = aws_vpc.My_First_VPC.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Virginia_IGW.id
  }

  tags = {
    Name       = "${var.username}_Terraform_Virgina_Public_RT"
    Owner      = var.username
    Enviroment = "Terraform Testing"
  }
}

// Virgina Private Subnet Route Table

resource "aws_route_table" "Virgina_Private_Subnet_RT" {
  vpc_id = aws_vpc.My_First_VPC.id

  tags = {
    Name       = "${var.username}_Terraform_Virgina_Private_RT"
    Owner      = var.username
    Enviroment = "Terraform Testing"
  }
}


// Security Group

resource "aws_security_group" "Public_SG" {
  name        = "${var.username}_SDWAN_Public_Allow_SG"
  description = "Public Allow traffic"
  vpc_id      = aws_vpc.My_First_VPC.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "6"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "6"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 10443
    to_port     = 10443
    protocol    = "6"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name       = "${var.username}_SDWAN_Public_Allow_SG"
    Owner      = var.username
    Enviroment = "Terraform Testing"
  }
}

resource "aws_security_group" "Private_SG" {
  name        = "${var.username}_SDWAN_Private_SG"
  description = "Place Holder for a Private Security Group"
  vpc_id      = aws_vpc.My_First_VPC.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name       = "${var.username}_SDWAN_Private_SG"
    Owner      = var.username
    Enviroment = "Terraform Testing"
  }
}