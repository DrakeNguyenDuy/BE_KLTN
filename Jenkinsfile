pipeline {
	agent any
	environment {
        report = '/var/lib/jenkins/workspace/WebKTX-BE/Email/email-template.html'
    }
    stages {
		stage ('Load functions') {      // Define the function files will be used
            steps {
                script {
                    emailFunction = load "Email/emailFunction.groovy"
                }
            }
        }
        stage('clone repo') {
             steps {
                    git url: 'https://github.com/DrakeNguyenDuy/BE_KLTN',
                    credentialsId:'DrakeNguyenDuy',
                    branch: 'main'
             }
        }
        stage('Build Maven Project') { 
            steps {
				sh 'mvn clean install'
            }
        } 
		stage('Deploy') { 
            steps {
				sh 'sudo systemctl enable BE_KLTN.service'
				sh 'sudo systemctl stop BE_KLTN'
				sh 'sudo systemctl start BE_KLTN'
				sh 'sudo systemctl status BE_KLTN'
				sh 'rm -rf changelog*'
				sh "cp /var/lib/jenkins/jobs/BE_KLTN/builds/${env.BUILD_NUMBER}/changelog* /var/lib/jenkins/workspace/BE_KLTN/"
            }
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

