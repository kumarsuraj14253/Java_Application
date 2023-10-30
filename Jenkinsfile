@Library('jenkins-shared-library') _
pipeline{
    agent any
    stages{
        stage('Git Checkout'){
            steps{
                script{
                    gitCheckout{
                        branch: 'main'
                        url: ' https://github.com/kumarsuraj14253/mrdevops_java_app12345.git'
                    }
                }
            }
        }
    }
}