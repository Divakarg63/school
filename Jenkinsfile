pipeline {
    agent any

    environment {
        IMAGE_NAME = "divakar2141/school-app"
        TAG = "latest"
        GIT_REPO = "https://github.com/Divakarg63/school.git"
        GIT_BRANCH = "main"
    }

    stages {

        stage('Clone Repo') {
            steps {
                git branch: "${GIT_BRANCH}",
                    url: "${GIT_REPO}",
                    credentialsId: "Divaa"
            }
        }

        stage('Build') {
            steps {
                sh 'echo "Build step here"'
                // Example:
                // sh 'npm install'
                // sh 'mvn clean package'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t $IMAGE_NAME:$TAG .'
            }
        }

        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-cred',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                }
            }
        }

        stage('Docker Push') {
            steps {
                sh 'docker push $IMAGE_NAME:$TAG'
            }
        }

        stage('Docker Run') {
            steps {
                sh '''
                docker rm -f school-container || true
                docker run -d -p 3001:80 --name school-container $IMAGE_NAME:$TAG
                '''
            }
        }
    }
}
