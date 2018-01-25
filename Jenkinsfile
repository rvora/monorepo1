def servicename = 'servicesample-springboot-java'
pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                sh 'env'
                sh './mvnw compile'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
                sh 'env'
                sh './mvnw test'
            }
        }
        stage('Package') {
            steps {
                echo 'Deploying....'
                sh './mvnw package'
            }
        }
    }
}
