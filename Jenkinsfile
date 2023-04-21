<<<<<<< HEAD
pipeline {
	agent any
	environment {
        report = '/var/lib/jenkins/workspace/BE-VSV/Email/email-template.html'
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
				sh 'sudo systemctl enable BE-VSV.service'
				sh 'sudo systemctl stop BE-VSV'
				sh 'sudo systemctl start BE-VSV'
				sh 'sudo systemctl status BE-VSV'
				sh 'rm -rf changelog*'
				sh "cp /var/lib/jenkins/jobs/BE-VSV/builds/${env.BUILD_NUMBER}/changelog* /var/lib/jenkins/workspace/BE-VSV/"
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

=======

pipeline{
    agent {
        label 'MVN3'
    }
    stages{
        stage('clone'){
            steps{
                git url: 'https://github.com/tarunkumarpendem/shopizer.git',
                    branch: 'master'
            }
        }
        stage ('build') {
            steps {
               sh 'mvn clean package'
           }
        }
        stage('Build the Code') {
            steps {
                withSonarQubeEnv('sonarcloud') {
                    sh script: 'mvn clean package sonar:sonar'
                }
            }
        stage('archiving-artifacts'){
            steps{
                archiveArtifacts artifacts: '**/target/*.jar', followSymlinks: false
            }
        }
        stage('junit_reports'){
            steps{
                junit '**/surefire-reports/*.xml'
            }
        }
    }    

pipeline {
    agent {label 'OPENJDK-11-JDK'}
    triggers {
        pollSCM('0 17 * * *')
    }
    stages {
        stage('vcs') {
            steps {
                git branch: 'release', url: 'https://github.com/longflewtinku/shopizer.git'         
            }
        }
        stage('merge') {
            steps {
                sh 'git checkout devops'
                sh 'git merge release --no-ff'
            }
        }
        stage('build') {
            steps {
                sh 'mvn clean install'
            }
        }
    }
}
>>>>>>> 4ddd9b6fa72533376a7bc28085d67eb7a9c8d243
