@Library('my-shared-library') _

pipeline{
    agent any
    stages{

        stage('Git Checkout'){
            steps{
                gitCheckout(
                        branch: 'main',
                        url: 'https://github.com/kumarsuraj14253/mrdevops_java_app12345.git'
                    )
                    }
                }
        stage('Unit Test Maven'){
            steps{
                script{
                        mvnTest()
                    }
                }
            }
        stage('Integration Test Maven'){
            steps{
                script{
                        mvnIntegrationTest()
                    }
                }
            }        
        }
    }