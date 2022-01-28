pipeline {
    agent any
    environment {
        PROJECT_ID = 'cloudcw-338918'
        CLUSTER_NAME = 'cluster-1'
        LOCATION = 'us-central1-c'
        CREDENTIALS_ID = 'cloudCW'
    }
    stages {      
        stage('Deploy to GKE') {
            steps{
                sh "sed -i 's/cloudtest:latest/cloudtest:${env.BUILD_ID}/g' deployment.yaml"
                step([$class: 'KubernetesEngineBuilder', projectId: env.PROJECT_ID, clusterName: env.CLUSTER_NAME, location: env.LOCATION, manifestPattern: 'deployment.yaml', credentialsId: env.CREDENTIALS_ID, verifyDeployments: true])
            }
        }
    }    
}
