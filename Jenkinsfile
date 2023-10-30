@Library('my-shared-library') _

pipeline{
    agent any

    parameters{
        choice(name: 'action', choices: 'create\ndelete', description: 'Choose create/ndestroy')
    }
    stages{

        stage('Git Checkout'){
        when { expression { param.action == 'create'}}
            steps{
                gitCheckout(
                        branch: 'main',
                        url: 'https://github.com/kumarsuraj14253/mrdevops_java_app12345.git'
                    )
                    }
                }
        stage('Unit Test Maven'){
        when { expression { param.action == 'create'}}
            steps{
                script{
                        mvnTest()
                    }
                }
            }
        stage('Integration Test Maven'){
        when { expression { param.action == 'create'}}
            steps{
                script{
                        mvnIntegrationTest()
                    }
                }
            }
        stage('Static Code Analysis:SonarQube'){
        when { expression { param.action == 'create'}}
            steps{
                script{
                        staticCodeAnalysis()
                    }
                }
            }        
        }
    }