pipeline {
	agent any
	environment {
        report = '/var/lib/jenkins/workspace/BE_VSV/Email/email-template.html'
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
				sh 'sudo systemctl enable BE_VSV.service'
				sh 'sudo systemctl stop BE_VSV'
				sh 'sudo systemctl start BE_VSV'
				sh 'sudo systemctl status BE_VSV'
				sh 'rm -rf changelog*'
				sh "cp /var/lib/jenkins/jobs/BE_VSV/builds/${env.BUILD_NUMBER}/changelog* /var/lib/jenkins/workspace/BE_VSV/"
            }
        }
    }
	post ('Send e-mail') {          // Stage for send an email
        always {
                script {
                    emailFunction.emailSendingnoattachment("ndlong28@gmail.com, 19130131@st.hcmuaf.edu.vn")       // Define the emails address should be received the mail
                }
        }
    }
}

