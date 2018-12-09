pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        build 'test_local_provider'
        sh 'echo Build finished'
      }
    }
    stage('Test') {
      steps {
        sh 'echo Testing'
      }
    }
    stage('Provisioning') {
      steps {
        sh 'echo Provisioning infrastructure'
      }
    }
    stage('Deploy') {
      steps {
        sh 'echo Deploying'
      }
    }
  }
  environment {
    Dev = 'dev'
    QA = 'qa'
    Staging = 'staging'
    Production = 'prod'
  }
}