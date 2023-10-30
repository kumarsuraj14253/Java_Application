@Library('my-shared-library') _

pipeline{
    agent any

    parameters{
        choice(name: 'ACTION', choices: 'Create\nDelete', description: 'CHOOSE: CREATE OR DESTROY')
    }
    stages{

        stage('Git Checkout'){
        when { expression { params.ACTION == 'Create'}}
            steps{
                gitCheckout(
                        branch: 'main',
                        url: 'https://github.com/kumarsuraj14253/mrdevops_java_app12345.git'
                    )
                    }
                }
        stage('Unit Test Maven'){
        when { expression { params.ACTION == 'Create'}}
            steps{
                script{
                        mvnTest()
                    }
                }
            }
        stage('Integration Test Maven'){
        when { expression { params.ACTION == 'Create'}}
            steps{
                script{
                        mvnIntegrationTest()
                    }
                }
            }
        stage('Static Code Analysis:SonarQube'){
        when { expression { params.ACTION == 'Create'}}
            steps{
                script{
                        def SonarQubeCredentialsID= 'sonar-token'
                        staticCodeAnalysis(SonarQubeCredentialsID)
                    }
                }
            }
        stage('Quality Gate Checks:SonarQube'){
        when { expression { params.ACTION == 'Create'}}
            steps{
                script{
                        def SonarQubeCredentialsID= 'sonar-token'
                        qualityGateStatus(SonarQubeCredentialsID)
                    }
                }
            }        
        stage('Maven Build'){
        when { expression { params.ACTION == 'Create'}}
            steps{
                script{
                        mvnBuild()
                    }
                }
            }
        }
    }