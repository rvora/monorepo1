def servicename = 'servicesample-springboot-java'
pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                sh 'env'
                ./mvnw compile
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
                sh 'env'
                ./mvnw test
            }
        }
        stage('Package') {
            steps {
                echo 'Deploying....'
                ./mvnw package
            }
        stage('BuildPushImage') {
            steps {
                echo 'Building and Pushing image....'
                docker.withRegistry('https://gcr.io', 'kumo-scratch') {
                    def customImage = docker.build("$servicename:${env.COMMIT_TAG}")
                    customImage.push()
                }
            }
        }
    }
}

