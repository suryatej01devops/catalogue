pipeline {
agent {
    node {
        label 'Agent-1'
    }
}

environment {
    COURSE = "JENKINS"
    appVersion = ""
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
                env.appVersion = packageJSON.version

                echo "Application Version: ${env.appVersion}"
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
                docker build -t catalogue:${env.appVersion} .
                docker images
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
