
pipeline {
    agent {
        node {
            label 'maven'
        }
    }
environment {
    PATH = "/opt/apache-maven-3.9.6/bin:$PATH"
}
    stages {
        stage('CLEAN') {
            steps {
                sh 'mvn clean'
            }
        }
        stage('COMPILE') {
            steps {
                sh 'mvn compile'
            }
        }

        stage('TEST') {
            steps {
                sh 'mvn test'
            }
        }
        stage('PACKAGE') {
            steps {
                sh 'mvn package'
            }
        }
        stage('INSTALL') {
            steps {
                sh 'mvn install'
            }
        }
        stage('Deploy') {
            steps {
                sh 'mvn deploy'
            }
        }


    }
}
