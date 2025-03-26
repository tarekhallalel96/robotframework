pipeline {
    agent {
        docker {
            image 'python:3.9-slim' 
            args '--user root'
        }
    }

    environment {
        ROBOT_DIR = 'tests'  
    }

    stages {
        stage('Install Dependencies') {
            steps {
                sh '''
                pip install --upgrade pip
                pip install robotframework
                pip install robotframework-seleniumlibrary
                '''
            }
        }

        stage('Run Robot Framework Tests') {
            steps {
                sh '''
                robot --variable REMOTE_URL:http://192.168.1.97:4444/wd/hub $ROBOT_DIR
                '''
            }
        }

        stage('Publish Test Results') {
            steps {
                junit '**/output.xml'
                archiveArtifacts artifacts: '**/report.html', allowEmptyArchive: true
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
