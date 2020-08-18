pipeline{
    agent any
    
    // agent {
    //     docker {
    //         image 'maven:3-alpine'
    //         // args '-v $HOME/.m2:/root/.m2'
    //     }
    // }
    
    // triggers {
    //     cron('H/2 * * * *')
    // }
    options {
    buildDiscarder(logRotator(numToKeepStr: '15', artifactNumToKeepStr: '10'))
  }
    stages{
        stage("SCM")
        {
            steps{
                git branch: 'master',credentialsId: 'GITHUB_Credential', url: 'https://github.com/abhishek-singh-220/Springboot.git'
            }
        }
    stage('build user') {
      steps {
        wrap([$class: 'BuildUser']) {
          sh 'echo "Full name : ${BUILD_USER}"'
          sh 'echo "First name : ${BUILD_USER_FIRST_NAME}"'
          sh 'echo "Last name : ${BUILD_USER_LAST_NAM}"'
          sh 'echo "User Id : ${BUILD_USER_ID}"'
          sh 'echo "User name : ${BUILD_USER_EMAIL}"'
        }
      }
    }
        stage("Build the app")
        {
            steps{
                dir("complete")
                {
                sh 'mvn clean install'
            }
            }
        }
        stage("Test the job")
        {
            steps{
                dir("complete")
                {
                sh 'mvn test'
            }
          }
        }
        /*stage("Quality check")
        {
            steps{
                dir("complete")
                {
                sh 'mvn clean verify sonar:sonar'
            }
           }
        }
         stage("Deploy Artifact")
        {
            steps{
                sh ''
            }
        }*/
        stage("Container")
        {
            steps{
                dir("complete")
                {
            sh 'docker build -t springbootapp .'
            }
        }
        
        }
        
        stage("Deploy on tomcat"){
            steps{
                dir("complete")
                {
                sh  'sh ./containercheck.sh'
            }
        }
        }
    }
      post {
        always {  
            cleanWs()
        }
    }
}
