pipeline {
   agent { dockerfile true}

    environment {
        DOCKERHUB_CREDENTIALS_ID = 'DockerHub'
        DEV_REPO = 'krithikacloud001/zencap-dev'
        PROD_REPO = 'krithikacloud001/kreact-app-prod'
    }

    stages {
        stage('Build and Push Dev Image') {
            steps {
                script {
                    // Build and push Docker image to Dev repository
                    docker.withRegistry('https://docker.io', DOCKERHUB_CREDENTIALS_ID) {
                        def devImage = docker.build("${DEV_REPO}:${BUILD_NUMBER}")
			echo "Pushing Dev Image..."
                        devImage.push()
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
                    docker.withRegistry('https://docker.io', DOCKERHUB_CREDENTIALS_ID) {
                        def prodImage = docker.build("${PROD_REPO}:${BUILD_NUMBER}")
                        prodImage.push()
                    }
                }
            }
        }
    }
}

