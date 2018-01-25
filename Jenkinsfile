def servicename = 'servicesample-springboot-java'
pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                sh 'env'
                sh 'mvn compile'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
                sh 'env'
                sh 'mvn test'
            }
        }
        stage('Package') {
            steps {
                echo 'Deploying....'
                sh 'mvn package'
            }
        }
    }
}
