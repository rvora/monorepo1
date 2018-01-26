def project = 'kumo-scratch'
def servicename = 'servicesample-springboot-java'

def commitHash = checkout(scm).GIT_COMMIT
def imagetag = "gcr.io/${project}/${servicename}:${commitHash}"

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
                sh "gcloud docker -- push ${imagetag}"
            }
        }
    }
}
