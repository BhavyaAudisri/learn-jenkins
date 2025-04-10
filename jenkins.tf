resource "aws_instance" "jenkins" {
  ami                    = "ami-09c813fb71547fc4f"
  vpc_security_group_ids = [data.aws_security_group.jenkins_sg]
  instance_type          = "t3.micro"
  tags = merge(
    var.common_tags,
    {

      Name = "${var.project_name}-${var.environment}-jenkins"
    }
  )
  user_data = file("jenkins-install.sh")

}
# jenkins agent creating
resource "aws_instance" "jenkins-agent" {
  ami                    = "ami-09c813fb71547fc4f"
  vpc_security_group_ids = [data.aws_security_group.jenkins_sg]
  instance_type          = "t3.micro"
  tags = merge(
    var.common_tags,
    {
      Name = "${var.project_name}-${var.environment}-jenkins-agent"
    }
  )
  user_data = file("jenkins-agent.sh")

}