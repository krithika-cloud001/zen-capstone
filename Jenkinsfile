pipeline {
   agent any

    environment {
        DOCKERHUB_CREDENTIALS_ID = 'DockerHub'
	DOCKER_IMAGE_NAME = 'krithikacloud001/zencap-dev'
        DOCKER_IMAGE_TAG = 'latest'
        DEV_REPO = 'krithikacloud001/zencap-dev'
        PROD_REPO = 'krithikacloud001/kreact-app-prod'
    }

    stages {
	stage('Checkout') {
            steps {
                // Checkout the code from the Git repository
                checkout scm
		echo "Current Branch : ${env.BRANCH_NAME}"
            }
        }

        stage('Build and Push Dev Image') {
	    when {
                // Trigger the stage only when changes are pushed to the 'dev' branch
               expression { env.BRANCH_NAME == 'dev' }
            }
            steps {
                script {
                    // Build the Docker image
		    def gitbranch = env.BRANCH_NAME
		    echo "Current Branch : ${gitbranch}" 
                    def dockerImage = docker.build("${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}")

                    // Authenticate with Docker Hub
                    docker.withRegistry('https://registry-1.docker.io', DOCKERHUB_CREDENTIALS_ID) {
                        // Push the Docker image to Docker Hub
                        dockerImage.push()
                    }
                }
            }
	}
	stage('Build and Push Prod Image') {
	    when {
                // Trigger the stage only when changes are pushed to the 'dev' branch
               expression { env.BRANCH_NAME == 'master' }
            }
            steps {
                script {
                    // Build the Docker image
		    def gitbranch = env.BRANCH_NAME
		    echo "Current Branch : ${gitbranch}" 
                    def dockerImage = docker.build("${PROD_REPO}:${DOCKER_IMAGE_TAG}")

                    // Authenticate with Docker Hub
                    docker.withRegistry('https://registry-1.docker.io', DOCKERHUB_CREDENTIALS_ID) {
                        // Push the Docker image to Docker Hub
                        dockerImage.push()
                    }
                }
            }
	}
    }
}

