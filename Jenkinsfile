pipeline {
    agent any

    stages {
       stage('Compile') {
            steps {
                echo 'Compiling the code'
            }
        }
       stage('Unit test') {
            steps {
                echo 'Running unit test'
            }
        }
       stage('Build and package app') {
            steps {
                echo 'Building artifact'
            }
        }
       stage('Upload artifact') {
            steps {
                echo 'uploading artifact'
            }
        }
       stage('Creating docker image') {
            steps {
                echo 'creating image'
            }
        }
       stage('scan docker image') {
            steps {
                echo 'Scanning docker image'
            }
        }
       stage('Push docker image to registry') {
            steps {
                echo 'Uploading image to registry'
            }
        }
       stage('Deploy app to dev env') {
            steps {
                echo 'Deploying to dev env'
            }
        }
    }
}

