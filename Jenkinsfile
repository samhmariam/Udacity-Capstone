pipeline {
    agent any
    stages {
        stage('Lint') {
            steps {
                sh 'pylint --disable=R,C,W1203,W1202 app.py'
            }
        }
        stage('Docker Build') {
            steps {
                sh "docker build -t hello-udacity:latest ."
            }
        }
        stage('ECR login') {
            steps {
                withAWS(credentials:'udacity-capstone') {
                    script {
                        def login = ecrLogin()
                        sh "${login}"
                    }
                }
            }
        }
        stage ('Docker Push') {
            steps {
                sh 'docker tag hello-udacity:latest 120106008631.dkr.ecr.us-east-1.amazonaws.com/hello-udacity:latest'
                sh 'docker push 120106008631.dkr.ecr.us-east-1.amazonaws.com/hello-udacity:latest'
            }
        }
        stage('Deploy') {
            steps {
                sh 'ansible-playbook playbook.yml'
            }
        }
    }
}