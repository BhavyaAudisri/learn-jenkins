pipeline{
    agent {
            label 'agent-1'
    }
    options {
        timeout(time: 10, unit: 'MINUTES')
        disableConcurrentBuilds()
    }
    environment {
        DEBUG = 'true'
    }
    parameters {
        string(name: 'PERSON', defaultValue: 'Mr Jenkins', description: 'Who should I say hello to?')
        text(name: 'BIOGRAPHY', defaultValue: '', description: 'Enter some information about the person')

        booleanParam(name: 'TOGGLE', defaultValue: true, description: 'Toggle this value')

        choice(name: 'CHOICE', choices: ['One', 'Two', 'Three'], description: 'Pick something')

        password(name: 'PASSWORD', defaultValue: 'SECRET', description: 'Enter a password')
    }
    stages {
        stage('Build') {
            steps {
                sh 'echo this is build'
            }
        }
        stage('Test') {
            steps {
                sh 'echo this is Test'
            }
        }
        stage('Deploy') {
             when {
                //branch 'production'
                 expression { env.GIT_BRANCH == "origin/main" }
            }
            steps {
                sh 'echo this is deploy'
            }
        }
        stage('scan') {
            steps {
                sh 'echo this is scan'
            }
        }
        // stage('Approval'){
        //     input {
        //         message "Should we continue?"
        //         ok "Yes, we should."
        //         submitter "alice,bob"
        //         parameters {
        //             string(name: 'PERSON', defaultValue: 'Mr Jenkins', description: 'Who should I say hello to?')
        //         }
        //     }
        //     steps {
        //         echo "Hello, ${PERSON}, nice to meet you."
        //     }
        // }
        // stage('Print Params'){
        //     steps{
        //         echo "Hello ${params.PERSON}"
        //         echo "Biography: ${params.BIOGRAPHY}"
        //         echo "Toggle: ${params.TOGGLE}"
        //         echo "Choice: ${params.CHOICE}"
        //         echo "Password: ${params.PASSWORD}"  
        //     }
        // }

    }
    post {
        always {
            echo " this section runs always"
            deleteDir()
        }
        success {
            echo " this section run when pipeline is success"
        }
        failure {
            echo " this section run when pipeline is failure"
        }
    }
}