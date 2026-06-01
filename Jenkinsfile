pipeline {
    agent {
        node{
            label 'Agent-1'
        }
    }          // where to run the pipeline (any agent/node)

    environment{
        COURSE = "JENKINS"
        appVersion = ""
    }
    options {
        timeout(time: 10, unit: 'SECONDS')
        disableConcurrentBuilds()
    }

    stages {

        stage('READ Version') {
            steps {
                script{
                    def packageJSON = readJSON file: "package.json"
                    appVersion = packageJSON.version
                    echo "app version: ${appVersion}"
                }   
                
                
            }
        }

        stage('Install Dependencies') {
            steps {
                sh """
                    npm install
                """
                
            }
        }

        stage('build') {
            }
            steps {
               sh """
                    docker build -t catalogue:${appVersion} .
                    docker images
               """
            }
        }
    }
    post{
        always{
        echo "i will always say hello again"
        cleanWs()
        }
        success {
            echo "i will run if success"
        }
        failure{
            echo "i will run if failire"
        }

    }
    
}