def project = 'kumo-scratch'
def servicename = 'servicesample-springboot-java'
def imagetag = "gcr.io/${project}/${servicename}:${env.GIT_COMMIT}"

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
        stage('Docker Build') {
            steps {
                echo 'Docker Build....'
                sh "docker build -t ${imagetag} ."
            }
        }
        stage('Docker Push') {
            steps {
                echo 'Docker Push....'
                sh("gcloud auth activate-service-account --key-file ${project}.json")
                sh("gcloud docker -- push ${imageTag}")
                sh("gcloud auth revoke")
            }
        }
    }
}
