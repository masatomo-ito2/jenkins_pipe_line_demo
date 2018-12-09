pipeline {
  agent any
  stages {
    stage('Dev') {
      steps {
        sh '''echo Build finished
echo HOME: $HOME
echo TERRAFORM_WORKING_DIR: $TERRAFORM_WORKING_DIR'''
        input(message: 'OK to QA?', ok: 'OK')
      }
    }
    stage('QA') {
      steps {
        sh 'echo Testing'
        input(message: 'Provision QA env?', ok: 'OK')
        sh '''export TF_IN_AUTOMATION=1

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
        sh 'echo Provisioning infrastructure'
        input(message: 'Provision Staging env?', ok: 'OK')
        echo 'Staging OK'
        input(message: 'Move to Production?', ok: 'OK')
      }
    }
    stage('Production') {
      steps {
        input(message: 'Provision Production?', ok: 'OK')
        sh 'echo provisioning production'
      }
    }
  }
  environment {
    TERRAFORM_WORKING_DIR = '/home/vagrant/terraform_working_dir'
  }
}