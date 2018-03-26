node ('docker') {
    stage('build docker') {
        withCredentials([usernamePassword(credentialsId: 'docker', passwordVariable: 'password', usernameVariable: 'user')]) {
            sh "docker login -u $user -p $password"
            checkout scm
            sh 'docker build -t kendesoftware/kafka .'
            sh 'docker push kendesoftware/kafka'
        }
    }
}
