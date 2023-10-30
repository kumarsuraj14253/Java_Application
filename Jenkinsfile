@Library('my-shared-library') _

pipeline{
    agent any

    parameters{
        choice(name: 'ACTION', choices: 'Create\nDelete', description: 'CHOOSE: CREATE OR DESTROY')
        string(name: 'imagename', description: 'name of the docker build', defaultValue: 'javaapp')
        string(name: 'imagetag', description: 'tag of the docker build', defaultValue: 'v1')
        string(name: 'dockerhubuser', description: 'name of the application', defaultValue: 'kumarsuraj14253')
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
        stage('Maven Build:Maven'){
        when { expression { params.ACTION == 'Create'}}
            steps{
                script{
                        mvnBuild()
                    }
                }
            }
        stage('Docker Image Build'){
        when { expression { params.ACTION == 'Create'}}
            steps{
                script{
                        dockerBuild("${params.imagename}","${params.imagetag}","${params.dockerhubuser}",)
                    }
                }
            }    
        }
    }