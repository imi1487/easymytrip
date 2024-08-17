pipeline {
    agent any

    tools {
        maven 'maven_3.9.4'
    }

    environment {
        IMAGE_NAME = "imran1487/easymytrip:easymytrip-v.1.${BUILD_NUMBER}" // Correctly using BUILD_NUMBER
    }

    stages {
        stage('Code Compilation') {
            steps {
                echo 'Code Compilation is In Progress!'
                sh 'mvn clean compile'
                echo 'Code Compilation is Completed Successfully!'
            }
        }
        stage('Code QA Execution') {
            steps {
                echo 'JUnit Test Case Check in Progress!'
                sh 'mvn test'
                echo 'JUnit Test Case Check Completed!'
            }
        }
        stage('Code Package') {
            steps {
                echo 'Creating WAR Artifact'
                sh 'mvn package'
                echo 'WAR Artifact Creation Completed'
            }
        }
        stage('Building & Tag Docker Image') {
            steps {
                echo "Starting Building Docker Image: ${IMAGE_NAME}"
                sh "docker build -t ${IMAGE_NAME} ."
                echo 'Docker Image Build Completed'
            }
        }
        stage('Docker Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'DOCKER_HUB_CRED', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    echo "Pushing Docker Image to DockerHub: ${IMAGE_NAME}"
                    sh "docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}"
                    sh "docker push ${IMAGE_NAME}"
                    echo "Docker Image Push to DockerHub Completed"
                }
            }
        }
    }
}
