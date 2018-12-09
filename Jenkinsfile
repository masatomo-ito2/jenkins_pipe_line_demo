pipeline {
  agent any
  stages {
    stage('dev') {
      steps {
        build 'test_local_provider'
        sh 'echo deploy'
      }
    }
    stage('staging') {
      steps {
        build 'test_local_provider'
        sh 'echo deploy'
      }
    }
    stage('production') {
      steps {
        build 'test_local_provider'
        sh 'echo deploying'
      }
    }
  }
  environment {
    stage = 'qa'
  }
}