#!/usr/bin/env groovy
pipeline{
    agent any
        options {
            ansiColor('xterm')
            timeout(time: 15, unit:'MINUTES')
            timestamps()
        }
     stage ('Get app') {
            steps {
                sh 'printenv'
                git branch: 'master', credentialsId: '8c1454ba-81a0-4756-9078-bc73e720885c', url: 'https://gitlab.devlits.com/dmitry.koriakin/redmine.git'
                   
                    sh "cp ./.env.example ./.env"

                  }
            }
     stage ('Build app'){
           agent {
                docker {
                        args '--name $BUILD_TAG '
                        image 'gitlab.devlits.com:4567/dmitry.koriakin/redmine:test'
                        registryCredentialsId 'bde1ab04-d698-49c0-89d0-db23dd6a0740'
                        registryUrl 'https://gitlab.devlits.com:4567'
                        reuseNode true
                        }
                     }
              environment {
                      HOME = "${WORKSPACE}"
                      BUNDLE_PATH = 'redmine-master/gems'
                      RAILS_ENV = test
                      }
              steps {
                      sh 'unzip redmine-master.zip'
                          sh 'ln -s redmine-master redmine'
                            sh 'cd redmine-master'
                               sh 'mkdir gems'
                                 sh 'bundle install --path /redmine-master/gems'
            }
        }
}



Collapse 

Message Input


Message @Valentyn Kalyn 
