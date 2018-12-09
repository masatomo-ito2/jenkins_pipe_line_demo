pipeline {
  agent any
  stages {
    stage('Dev') {
      steps {
        build 'test_local_provider'
        sh 'echo Build finished'
        input(message: 'OK to QA?', id: 'dev', ok: '1')
      }
    }
    stage('QA') {
      steps {
        sh 'echo Testing'
        input(message: 'OK to Staging?', id: 'QA', ok: '1')
      }
    }
    stage('Staging') {
      steps {
        sh 'echo Provisioning infrastructure'
      }
    }
    stage('Production') {
      steps {
        sh 'echo Deploying'
      }
    }
  }
}