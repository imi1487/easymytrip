pipeline {
    agent any

    tools {
        maven 'maven_3.9.4'
    }

    environment {
        IMAGE_NAME = "imran1487/easymytrip:easymytrip-v.1.${BUILD_NUMBER}"
        ECR_IMAGE_NAME = "767398153416.dkr.ecr.ap-south-1.amazonaws.com/easymytrip:dev-easymytrip-v.1.${BUILD_NUMBER}"
        NEXUS_IMAGE_NAME = "3.110.31.226:8085/easymytrip:easymytrip-ms-v.1.${env.BUILD_NUMBER}"
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
                withCredentials([usernamePassword(credentialsId: 'nexus-credentials', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh "docker login http://3.110.31.226:8085/repository/easymytrip-ms/ -u admin -p ${PASSWORD}"
                    echo "Push Docker Image to Nexus: In Progress"
                    sh "docker tag ${IMAGE_NAME} ${NEXUS_IMAGE_NAME}"
                    sh "docker push ${NEXUS_IMAGE_NAME}"
                    echo "Push Docker Image to Nexus: Completed"
                }
            }
        }

        stage('Delete Local Docker Images') {
            steps {
                echo "Deleting Local Docker Images: ${IMAGE_NAME} and ${ECR_IMAGE_NAME}"
                sh "docker rmi ${IMAGE_NAME} ${ECR_IMAGE_NAME}"
                echo "Local Docker Images Deletion Completed"
            }
        }
    }
}
