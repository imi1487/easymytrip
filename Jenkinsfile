pipeline {
    agent any

    environment {

               IMAGE_NAME = "imran1487/easymytrip:easymytrip-v.1.${BUILD_NUMBER}"
               ECR_IMAGE_NAME = "767398153416.dkr.ecr.ap-south-1.amazonaws.com/easymytrip:easymytrip-v.1.${BUILD_NUMBER}"
               NEXUS_IMAGE_NAME = "15.206.69.255:8085/easymytrip:easymytrip-ms-v.1.${env.BUILD_NUMBER}"
    }

    options {
        buildDiscarder(logRotator(numToKeepStr: '5', artifactNumToKeepStr: '5'))
    }

    tools {
        maven 'maven_3.9.4'
    }

    stages {
        stage('Code Compilation') {
            steps {
                echo 'Code Compilation is In Progress!'
                sh 'mvn clean compile'
                echo 'Code Compilation is Completed Successfully!'
            }
        }
        stage('Code Package') {
            steps {
                echo 'Creating WAR Artifact'
                sh 'mvn clean package'
                echo 'Artifact Creation Completed'
            }
        }
        stage('Building & Tag Docker Image') {
            steps {
                echo "Starting Building Docker Image: ${env.IMAGE_NAME}"
                sh "docker build -t ${env.IMAGE_NAME} ."
                echo 'Docker Image Build Completed'
            }
        }
        stage('Docker Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'DOCKER_HUB_CRED', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    echo "Pushing Docker Image to DockerHub: ${env.IMAGE_NAME}"
                    sh "docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}"
                    sh "docker push ${env.IMAGE_NAME}"
                    echo "Docker Image Push to DockerHub Completed"
                }
            }
        }
         stage('Docker Image Push to Amazon ECR') {
                    steps {
                        echo "Tagging Docker Image for ECR: ${ECR_IMAGE_NAME}"
                        sh "docker tag ${IMAGE_NAME} ${ECR_IMAGE_NAME}"
                        echo "Docker Image Tagging Completed"

                        withDockerRegistry([credentialsId: 'ecr:ap-south-1:ecr-credentials', url: "https://767398153416.dkr.ecr.ap-south-1.amazonaws.com"]) {
                            echo "Pushing Docker Image to ECR: ${ECR_IMAGE_NAME}"
                            sh "docker push ${ECR_IMAGE_NAME}"
                            echo "Docker Image Push to ECR Completed"
                }
            }
        }
        stage('Upload the Docker Image to Nexus') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'nexus-credentials', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                        sh 'docker login http://15.206.69.255:8085/repository/demo-application/ -u admin -p ${PASSWORD}'
                        echo "Push Docker Image to Nexus: In Progress"
                        sh "docker tag ${env.IMAGE_NAME} ${env.NEXUS_IMAGE_NAME}"
                        sh "docker push ${env.NEXUS_IMAGE_NAME}"
                        echo "Push Docker Image to Nexus: Completed"
                    }
                }
            }
        }
        stage('Delete Local Docker Images') {
            steps {
                echo "Deleting Local Docker Images: ${env.IMAGE_NAME} ${env.ECR_IMAGE_NAME} ${env.NEXUS_IMAGE_NAME}"
                sh "docker rmi ${env.IMAGE_NAME} ${env.ECR_IMAGE_NAME} ${env.NEXUS_IMAGE_NAME}"
                echo "Local Docker Images Deletion Completed"
            }
        }
    }
}