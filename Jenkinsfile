pipeline {
    agent any
    environment {
    CONTAINER_REGISTRY_AND_REPO="mymavenapp"  
}

    stages {
       stage('Compile') {
            steps {
                echo 'Compiling the code'
                sh 'mvn -f pom.xml clean compile'
            }
        }
       stage('Build and package app') {
            steps {
                sh 'mvn -f pom.xml package'
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
                sh 'docker image build -t $CONTAINER_REGISTRY_AND_REPO:$BUILD_NUMBER .'
            }
        }
       stage('scan docker image') {
            steps {
                echo 'Scanning docker image'
               sh 'trivy image --format json --output result.json --scanners vuln --exit-code 1 --severity HIGH,CRITICAL --ignore-unfixed $CONTAINER_REGISTRY_AND_REPO:$BUILD_NUMBER'
            }
        }
       stage('Push docker image to registry') {
            steps {
                echo 'Uploading image to registry'
                withDockerRegistry([credentialsID: 'dockerregcred', url: '']) {
sh 'docker image push $CONTAINER_REGISTRY_AND_REPO:$BUILD_NUMBER'             
}
            }
        }
       stage('Deploy app to dev env') {
            steps {
                echo 'Deploying to dev env'
            }
        }
    }
}

