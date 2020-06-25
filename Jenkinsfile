node {
   stage('SCM Checkout') {
        git 'https://github.com/kishorsg/e2epipeline'
    }
   /* stage ('copy public key') {
        print 'Copy id_rsa file'

        sh '''
        //chmod 440 /home/ubuntu/.ssh/id_rsa
        cp -r /home/ubuntu/.ssh/ /var/lib/jenkins/
        //chmod 400 /var/lib/jenkins/.ssh/id_rsa
        //chmod 400 /home/ubuntu/.ssh/id_rsa
        
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
     /*stage ('Terraform Destroy') {
        print 'Destroy the resources'
        withCredentials([string(credentialsId: 'aws-access-key', variable: 'AWS_ACCESS_KEY_ID'),
                      string(credentialsId: 'aws-secret-key', variable: 'AWS_SECRET_ACCESS_KEY')]) {
            sh '''
        pwd
        cd vpc
         terraform destroy -auto-approve
          '''
                      }
    }
    # Change the ip address in hosts file
    input 'Added IP address?'
    
   stage ('Deployment to k8s through ansible') {
        print 'Deployment through ansible'
        sh '''
        pwd
         ansible-playbook ansibledep.yml
          '''
    }*/
   
} 
 
