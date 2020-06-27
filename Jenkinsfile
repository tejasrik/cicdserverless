node {
    stage('SCM Checkout') {
        git 'https://github.com/kishorsg/e2epipeline'
    }
  stage('Compile-Package') {
        // Get maven home path
        def mvnHome =  tool name: 'maven', type: 'maven'
        sh "${mvnHome}/bin/mvn clean package"
        }

  /* stage('SonarQube Analysis') {
       def mvnHome =  tool name: 'maven', type: 'maven'
        withSonarQubeEnv('sonar') {
        sh "${mvnHome}/bin/mvn sonar:sonar"
        }
   }
   stage ('TestNG result'){
    sh "[$class : 'Publisher', reportFilenamePattern : '**/ /*testng-result.xml']"
  }*/

    stage ('Build Docker Image') {
        sh 'docker build -t kishorsg/my-app:2.0.0 .'
    }

        stage('Push Docker image') {
        withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerHubPwd')]) {
            sh "docker login -u kishorsg -p ${dockerHubPwd}"
        }
        sh 'docker push kishorsg/my-app:2.0.0'
        }
   /* stage ('copy public key') {
        print 'Copy id_rsa file'

        sh '''
        cp -r /home/ubuntu/.ssh/ /var/lib/jenkins/ 
        '''
    }*/
    stage ('Terraform Init') {
        print 'Init Provider'
        sh '''
        pwd
        cd vpc
         terraform init
          '''
    }

    stage ('Terraform Validate') {
        print 'Validating The TF Files'
        withCredentials([string(credentialsId: 'aws-access-key', variable: 'AWS_ACCESS_KEY_ID'),
                      string(credentialsId: 'aws-secret-key', variable: 'AWS_SECRET_ACCESS_KEY')]) {
            sh '''
        pwd
        cd vpc
         terraform validate
          '''
                      }
    }

    stage ('Terraform Plan') {
        print 'Planning The TF Files'
        withCredentials([string(credentialsId: 'aws-access-key', variable: 'AWS_ACCESS_KEY_ID'),
                      string(credentialsId: 'aws-secret-key', variable: 'AWS_SECRET_ACCESS_KEY')]) {
            sh '''
        pwd
        cd vpc
         terraform plan -out createplan
          '''
                      }
    }

    stage ('Terraform Apply') {
        print 'Execute the plan'
        withCredentials([string(credentialsId: 'aws-access-key', variable: 'AWS_ACCESS_KEY_ID'),
                      string(credentialsId: 'aws-secret-key', variable: 'AWS_SECRET_ACCESS_KEY')]) {
            sh '''
        pwd
        cd vpc
         terraform apply createplan
          '''
                      }
    }
     /*stage ('Deployment to k8s through ansible') {
        print 'Deployment through ansible'
        sh '''
        pwd
         ansible-playbook -i /home/ubuntu/hosts ansibledep.yml
          '''
    } 
      stage ('Terraform Destroy') {
        print 'Destroy the resources'
        withCredentials([string(credentialsId: 'aws-access-key', variable: 'AWS_ACCESS_KEY_ID'),
                      string(credentialsId: 'aws-secret-key', variable: 'AWS_SECRET_ACCESS_KEY')]) {
            sh '''
        pwd
        cd vpc
         terraform destroy -auto-approve
          '''
                      }
    } */
   
   //Change the ip address in hosts file
   // input 'Added IP address?'
    
  
} 
