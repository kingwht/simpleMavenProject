
pipeline {

    agent any
    

    stages {

        stage('Build') {
            steps {
                sh '''
                    chmod -R +x ./*
                    ./jenkins/build/mvn.sh mvn -B -DskipTests clean package
                    ./jenkins/build/build.sh
                '''
            }
            post {
              success {
                archiveArtifacts artifacts:'java-app/target/*.jar', fingerprint: true
              }
            }

        }

        stage('Test') {
            steps {
                sh './jenkins/test/mvn.sh mvn test'
            }
            post {
              always {        
                junit 'java-app/target/surefire-reports/*.xml'
              }
            }
        }

        stage('Deploy') {
            steps {
                sh './jenkins/depoly/deploy.sh'
            }
        }
    }
}
