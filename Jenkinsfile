pipeline {
    agent any

    stages {
       stage('Compile') {
            steps {
                echo 'Compiling the code'
                sh 'mvn -f pom.xml clean compile'
            }
        }
       stage('Build and package app') {
            steps {
                echo 'mvn -f pom.xml package'
            }
            post {
success {
     echo "Achiving the artifacts"
     archiveArtifacts artifacts: '**/*.war', followSymlinks: false, onlyIfSuccessful: true
} 
}
        }
       stage('Creating docker image') {
            steps {
                echo 'creating image'
                sh 'docker image build -t harbor.registry.local/mymavenapp:$BUILD_NUMBER'
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

