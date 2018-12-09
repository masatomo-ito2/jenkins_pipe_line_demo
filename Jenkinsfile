pipeline {
  agent any
  stages {
    stage('Dev') {
      steps {
        build 'test_local_provider'
        sh 'echo Build finished'
        input(message: 'OK to QA?', id: 'dev', ok: 'OK')
      }
    }
    stage('QA') {
      steps {
        sh 'echo Testing'
        input(message: 'Provision QA env?', id: 'QA', ok: 'OK')
        echo 'Test SUCCESS'
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