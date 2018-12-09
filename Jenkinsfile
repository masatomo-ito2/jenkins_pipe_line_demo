pipeline {
  agent any
  stages {
    stage('Dev') {
      steps {
        sh '''echo Some debugs
echo HOME: $HOME
echo TERRAFORM_WORKING_DIR: $TERRAFORM_WORKING_DIR'''
        input(message: 'OK to QA?', ok: 'OK')
      }
    }
    stage('QA') {
      steps {
        sh 'echo Do QA stuff'
        input(message: 'Provision QA env?', ok: 'OK')
        sh '''echo XXX I am `whoami`
export TF_IN_AUTOMATION=1

cd $TERRAFORM_WORKING_DIR
# cp /home/vagrant/jenkins_pipe_line_demo/remote.tf $TERRAFORM_WORKING_DIR
# git clone https://github.com/masatomo-ito2/jenkins_pipe_line_demo.git

echo ==== executing workspace select =====
terraform workspace select QA

echo ==== executing apply =====
terraform apply -auto-approve'''
        input(message: 'Move to Staging?', ok: 'OK')
      }
    }
    stage('Staging') {
      steps {
        sh 'echo do some work here'
        input(message: 'Provision Staging env?', ok: 'OK')
        sh '''echo XXX I am `whoami`
export TF_IN_AUTOMATION=1

cd $TERRAFORM_WORKING_DIR
# cp /home/vagrant/jenkins_pipe_line_demo/remote.tf $TERRAFORM_WORKING_DIR
# git clone https://github.com/masatomo-ito2/jenkins_pipe_line_demo.git

echo ==== executing workspace select =====
terraform workspace select Staging

echo ==== executing apply =====
terraform apply -auto-approve'''
        input(message: 'Move to Production?', ok: 'OK')
      }
    }
    stage('Production') {
      steps {
        input(message: 'Provision Production?', ok: 'OK')
        sh '''echo XXX I am `whoami`
export TF_IN_AUTOMATION=1

cd $TERRAFORM_WORKING_DIR
# cp /home/vagrant/jenkins_pipe_line_demo/remote.tf $TERRAFORM_WORKING_DIR
# git clone https://github.com/masatomo-ito2/jenkins_pipe_line_demo.git

echo ==== executing workspace select =====
terraform workspace select Production

echo ==== executing apply =====
terraform apply -auto-approve'''
      }
    }
  }
  environment {
    TERRAFORM_WORKING_DIR = '/home/vagrant/terraform_working_dir'
  }
}