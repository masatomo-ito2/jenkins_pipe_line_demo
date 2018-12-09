pipeline {
  agent any
  stages {
    stage('Dev') {
      steps {
        sh '''echo Build finished
echo $HOME'''
        input(message: 'OK to QA?', ok: 'OK')
      }
    }
    stage('QA') {
      steps {
        sh 'echo Testing'
        input(message: 'Provision QA env?', ok: 'OK')
        sh '''cp /home/vagrant/jenkins_pipe_line_demo/remote.tf $WORKSPACE
terraform init
terraform workspace select QA
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
}