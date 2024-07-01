resource "aws_elastic_beanstalk_application" "beanstalk_application" {
  name        = var.nome
  description = var.descricao
}

resource "aws_elastic_beanstalk_environment" "beanstalk_environment" {
  name                = var.ambiente
  application         = aws_elastic_beanstalk_application.beanstalk_application.name
  solution_stack_name = "64bit Amazon Linux 2023 v4.3.3 running Docker"

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = var.maquina
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = var.max
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = aws_iam_instance_profile.beanstalk_ec2_profile.name
  }
}

resource "aws_elastic_beanstalk_application_version" "default" {
  depends_on = [ 
    aws_elastic_beanstalk_environment.beanstalk_environment,
    aws_elastic_beanstalk_application.beanstalk_application,
    aws_s3_bucket_object.docker
   ]
  name        = var.ambiente
  application = var.nome
  description = var.descricao
  bucket      = aws_s3_bucket.beanstalk_deploys.id
  key         = aws_s3_bucket_object.docker.id
}