pipeline {
    agent { label 'javaJenkinsSlave_TeamA' }

    options {
        buildDiscarder(logRotator(numToKeepStr: '5', artifactNumToKeepStr: '5'))
    }

    tools {
        maven 'maven_3.9.4'
    }

    stages {
        stage('Compile') {
            steps {
                script {

                    sh 'mvn clean compile'
                    echo 'code has been compiled ok'
                }
            }
        }
        stage('Package') {
            steps {
                script {

                     sh 'mvn clean package'
                    echo 'code has been built'
                }
            }
        }
    }
}
