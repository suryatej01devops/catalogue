pipeline {
agent {
    node {
        label 'Agent-1'
    }
}

environment {
    COURSE = "JENKINS"
    appVersion = ""
    ACC_ID = "998301374787"
    PROJECT = "roboshop"
    COMPONENT = "catalogue"
}

options {
    timeout(time: 10, unit: 'MINUTES')
    disableConcurrentBuilds()
}

stages {

    stage('Read Version') {
        steps {
            script {
                def packageJSON = readJSON file: 'package.json'
                appVersion = packageJSON.version
                echo "app version: ${appVersion}"
            }
        }
    }

    stage('Install Dependencies') {
        steps {
            sh '''
                npm install
            '''
        }
    }

    stage('Docker Build') {
        steps {
            sh """
                aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin ${ACC_ID}.dkr.ecr.us-east-1.amazonaws.com
                docker build -t ${ACC_ID}.dkr.ecr.us-east-1.amazonaws.com/${PROJECT}/${COMPONENT}:${appVersion} .
                docker images
                docker push ${ACC_ID}.dkr.ecr.us-east-1.amazonaws.com/${PROJECT}/${COMPONENT}:${appVersion}
                docker images
            """
        }
    }
    stage('Deploy') {
        steps {
            sh """
                
            """
        }
    }

}

post {

    always {
        echo "Pipeline execution completed"
        cleanWs()
    }

    success {
        echo "Pipeline executed successfully"
    }

    failure {
        echo "Pipeline execution failed"
    }

}
}
