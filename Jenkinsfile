pipeline {
    agent any

    environment {
        IMAGE_NAME = "school-app"
        TAG = "latest"
    }

    stages {

        stage('Clone Repo') {
            steps {
                git 'https://github.com/Divakarg63/school.git'
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

        stage('Docker Run') {
            steps {
                sh '''
                docker rm -f school-container || true
                docker run -d -p 3000:3000 --name school-container $IMAGE_NAME:$TAG
                '''
            }
        }
    }
}
