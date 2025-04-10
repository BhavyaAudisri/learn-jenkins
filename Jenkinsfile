pipeline{
    agent {
            label 'agent-1'
    }
    options {
        timeout(time: 10, unit: 'MINUTES')
        //disableconcurrentBuilds()
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
            steps {
                sh 'echo this is deploy'
            }
        }

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