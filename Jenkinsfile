pipeline {
   agent {
        dockerfile {
            // Specify the path to the Dockerfile
            filename 'Dockerfile'
        }
    }

    environment {
        DOCKERHUB_CREDENTIALS_ID = 'DockerHub'
	DOCKER_IMAGE_NAME = 'krithikacloud001/zenproject'
        DOCKER_IMAGE_TAG = 'latest'
        DEV_REPO = 'krithikacloud001/zencap-dev'
        PROD_REPO = 'krithikacloud001/kreact-app-prod'
    }

    stages {
        stage('Build and Push Dev Image') {
            steps {
                script {
                    // Build and push Docker image to Dev repository
		       docker.build("${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}")
                       docker.withRegistry('https://index.docker.io/v1', DOCKERHUB_CREDENTIALS_ID) {
                       docker.image("${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}").push()
		       echo "Pushing Dev Image..."
                    }
                }
            }
        }

        stage('Build and Push Prod Image') {
            when {
                branch 'master'
            }
            steps {
                script {
                    // Build and push Docker image to Prod repository
                    docker.withRegistry('https://index.docker.io/v1', DOCKERHUB_CREDENTIALS_ID) {
                        def prodImage = docker.build("${PROD_REPO}:${BUILD_NUMBER}")
                        prodImage.push()
                    }
                }
            }
        }
    }
}

