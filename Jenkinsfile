pipeline{
    agent any
    tools{
        nodejs "nodejs22.3.0"
    }
    stages{
        stage("build"){
            steps {
                sh './build.sh'
            }
        }
        stage("deploy"){
            steps {
                sshPublisher(
                    continueOnError: false, 
                    failOnError: true,
                    publishers: [
                        sshPublisherDesc(
                            configName: "2c2g",
                            transfers: [sshTransfer(sourceFiles: 'output.tar.gz'), sshTransfer(execCommand: "ls -l"),],
                            verbose: true
                        )
                    ]
                )
            }
        }
    }
}
