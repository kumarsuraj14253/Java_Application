@Library('my-shared-library') _

pipeline{
    agent any

    parameters{
        choice(name: 'Action', choices: 'Create\nDelete', description: 'Choose Create/nDestroy')
    }
    stages{

        stage('Git Checkout'){
        when { expression { params.action == 'create'}}
            steps{
                gitCheckout(
                        branch: 'main',
                        url: 'https://github.com/kumarsuraj14253/mrdevops_java_app12345.git'
                    )
                    }
                }
        stage('Unit Test Maven'){
        when { expression { params.action == 'create'}}
            steps{
                script{
                        mvnTest()
                    }
                }
            }
        stage('Integration Test Maven'){
        when { expression { params.action == 'create'}}
            steps{
                script{
                        mvnIntegrationTest()
                    }
                }
            }
        stage('Static Code Analysis:SonarQube'){
        when { expression { params.action == 'create'}}
            steps{
                script{
                        def SonarQubeCredentialsID= 'sonar-token'
                        staticCodeAnalysis(SonarQubeCredentialsID)
                    }
                }
            }
        stage('Quality Gate Checks:SonarQube'){
        when { expression { params.action == 'create'}}
            steps{
                script{
                        def SonarQubeCredentialsID= 'sonar-token'
                        qualityGateStatus(SonarQubeCredentialsID)
                    }
                }
            }        
        }
    }