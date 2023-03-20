pipeline {
	agent any
    stages {
		stage ('Load functions') {      // Define the function files will be used
            steps {
                script {
                    emailFunction = load "Email/emailFunction.groovy"
                }
            }
        }
        stage('clone repo') {
            git url: 'https://github.com/DrakeNguyenDuy/BE_KLTN',
            credentialsId:'DrakeNguyenDuy',
            branch: 'main'
        }
        stage('build docker') {
            dockerImage = docker.build("springboot-deploy:${env.VERSION_NUMBER}")
        }
        stage('deploy docker') {
            echo "Docker image tag name: ${dockerImageTag}"
            sh 'docker stop springboot-deploy || true && docker rm springboot-deploy || true'
            sh "docker run --name springboot-deploy -dp 8091:8080 springboot-deploy:${env.VERSION_NUMBER}"
        }
    }
	post ('Send e-mail') {          // Stage for send an email
        always {
                script {
                    emailFunction.emailSendingnoattachment("ndlong28@gmail.com")       // Define the emails address should be received the mail
                }
        }
    }
}