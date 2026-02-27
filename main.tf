resource "aws_security_group" "ec2sg"{
		name = "EC2_SG"

ingress{
	from_port = 80
	to_port = 80
	protocol = "tcp"
	cidr_blocks = ["0.0.0.0/0"]
	}
egress{
	from_port = 0
	to_port = 0
	protocol = "-1"
	cidr_blocks = ["0.0.0.0/0"]
	}
}

resource "aws_instance" "ec2instance"{
	ami = "ami-0b6c6ebed2801a5cb"
	instance_type = "t2.micro"
	security_groups = ["${aws_security_group.ec2sg.name}"]
	
	user_data = <<-EOF
	      #!/bin/bash
              # Update and install Apache
              apt-get update -y
              apt-get install -y apache2
              systemctl start apache2
              systemctl enable apache2

              echo "<html><body><h1>Hello, my name is Nandini</h1>	      </body></html>" > /var/www/html/index.html
              EOF
tags = {
	Name = "MyEC2Server"
	}
}

resource "aws_ami_from_instance" "ec2ami"{
	name = "MyEC2Image"
	source_instance_id = aws_instance.ec2instance.id
}

resource "aws_instance" "ec2amiinstance"{
	ami = aws_ami_from_instance.ec2ami.id
	instance_type = "t2.micro"
	security_groups = ["${aws_security_group.ec2sg.name}"]

tags = {
	Name = "MyEC2AMIServer"
	}
}
	