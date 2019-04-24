resource "aws_lightsail_static_ip" "devops" {
  name = "${var.staticip}"
}
resource "aws_lightsail_static_ip_attachment" "devops" {
  static_ip_name = "${aws_lightsail_static_ip.devops.name}"
  instance_name = "${aws_lightsail_instance.devops.name}"
   provisioner "remote-exec" {
  connection {
    timeout = "5m"
    user = "ubuntu"
    host = "${aws_lightsail_static_ip.devops.ip_address}"
    private_key = "${file("~/.ssh/id_rsa")}"
    }
    inline = [
      "touch hello",
      "sudo apt update -y",
      "echo ************************apt update************* >> hello",
      #"sudo apt upgrade -y",
      #RUN apt install -y less curl git ssh
      #"sudo apt update -y && sudo apt-get upgrade -y && sudo apt-get install -y less curl ssh",
      #Python Pip
      "sudo apt-get install python3 python3-pip -y && sudo ln -s /usr/bin/python3 /usr/bin/python && sudo ln -s /usr/bin/pip3 /usr/bin/pip",
      #RUN curl -O https://deb.nodesource.com/setup_8.x && chmod +x setup_8.x && ./setup_8.x && apt-get install -y nodejs",
      #Docker
      "sudo apt install apt-transport-https ca-certificates software-properties-common -y",
      "sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -",
      "sudo add-apt-repository 'deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable'",
      "sudo apt update -y",
      "sudo apt install docker-ce -y",
      "sudo usermod -aG docker ubuntu",
      #Docker-compose
      "sudo curl -L https://github.com/docker/compose/releases/download/1.19.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose",
      #Awscli
      "pip install awscli --upgrade --user && export PATH=~/.local/bin:$PATH",
      #Kubectl
      "curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && chmod +x ./kubectl && sudo mv ./kubectl /usr/local/bin/kubectl",
      #Terraform
      "curl -O https://releases.hashicorp.com/terraform/0.11.7/terraform_0.11.7_linux_amd64.zip && sudo apt-get install -y zip && unzip terraform_0.11.7_linux_amd64.zip && sudo mv ./terraform /usr/local/bin/terraform",
      #Kops
      #"curl -Lo kops https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64",
      #"chmod +x ./kops",
      #"sudo mv ./kops /usr/local/bin/",
      ]
      }
}