provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "kn09_tf" {
  name        = "KN09 - TF"
  description = "Allow SSH and MySQL traffic"

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow MySQL"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "kn09_tf"
  }
}

resource "aws_instance" "kn09_tf" {
  ami           = "ami-04b4f1a9cf54c11d0"
  instance_type = "t2.micro"
  security_groups = [
    aws_security_group.kn09_tf.name,
  ]

  user_data = <<-EOF
                 #cloud-config
                 users:
                   - name: ubuntu
                     sudo: ALL=(ALL) NOPASSWD:ALL
                     groups: users, admin
                     home: /home/ubuntu
                     shell: /bin/bash
                     ssh_authorized_keys:
                       - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC0WGP1EZykEtv5YGC9nMiPFW3U3DmZNzKFO5nEu6uozEHh4jLZzPNHSrfFTuQ2GnRDSt+XbOtTLdcj26+iPNiFoFha42aCIzYjt6V8Z+SQ9pzF4jPPzxwXfDdkEWylgoNnZ+4MG1lNFqa8aO7F62tX0Yj5khjC0Bs7Mb2cHLx1XZaxJV6qSaulDuBbLYe8QUZXkMc7wmob3PM0kflfolR3LE7LResIHWa4j4FL6r5cQmFlDU2BDPpKMFMGUfRSFiUtaWBNXFOWHQBC2+uKmuMPYP4vJC9sBgqMvPN/X2KyemqdMvdKXnCfrzadHuSSJYEzD64Cve5Zl9yVvY4AqyBD aws-key
                       - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCU1B7+jwdy08QksJMs+swxlmIAShQnxtkoXbdLrE4rWktWEUGQHpwJWr/9+PSGcFUxgsvEHcAFzR59WKwB4uL1PCaGDeAxL+2h2W4jyt/sF20Q7J6haJe/7Ke5YK5EZpmcWtI5lQmxDoL32NFYRrp5pnjZ9lxGLvIyO8xMiYSrzqPqzW58P2Cf6vQXIE5bCq+KWRCSE3T9/ZTMrGoSCC5/v+AotFVwRbK8+tPS/8hGG4MfMkdXCk2vwCxcuzrei0CZl1lhsubBajjBsdVyckbDY0oOoWIVgP5Jmnaho1/bZaKUl7FEMU8ULOQfq+kiJLxX01ww7AUQTCrvR7CzTwrv aws-key
                 ssh_pwauth: false
                 disable_root: false
                 package_update: true
                 packages:
                   - curl 
                   - wget 
                   - mariadb-server
                 runcmd:
                   - sudo mysql -sfu root -e "GRANT ALL ON *.* TO 'admin'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION;"
                   - sudo sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
                   - sudo systemctl restart mariadb.service
              EOF

  tags = {
    Name = "kn09_tf"
  }
}

output "instance_public_ip" {
  value = aws_instance.kn09_tf.public_ip
}
