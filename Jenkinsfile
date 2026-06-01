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
                    appVersion = packageJSON
                    echo "app version: ${appVersion}"
                }   
                
                
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
                // sh 'mvn test'  or  sh 'npm test'
            }
        }

        stage('Deploy') {
            input {
            message "Should we continue?"
            ok "Yes, we should."
            submitter "alice,bob"
            parameters {
                string(name: 'PERSON', defaultValue: 'Mr Jenkins', description: 'Who should I say hello to?')
            }
            }
            steps {
                echo 'Deploying...'
                
            
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
#ssh