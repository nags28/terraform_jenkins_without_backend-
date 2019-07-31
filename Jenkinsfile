pipeline {
    agent any
	environment {
        AWS_ROLE = "terraform"
    }
   
    parameters {
        choice(name: 'env', choices: 'dev\nTEST_PRACTICE', description: 'Select Environment')
        choice(name: 'action', choices: 'init\nplan\napply\nplan-destroy\ndestroy', description: 'Select Action')
    }
    stages {
	    
	    
	    stage('git') {
            steps {
                  git 'https://github.com/nags28/game-of-life.git'
                 }
                 }// stage git
     stage('build'){
            steps  {
                     sh 'mvn package'
                   }
     }//stage build
	
        stage('terraform') {
            environment {
                LAYER = "${params.env}"
                INFRA_ACTION = "${params.action}"
            }
      
		 steps {
			git 'https://github.com/nags28/terraform_jenkins_without_backend-.git'
                script {
			sh 'chmod +x infra.sh'
                       if (params.env == 'dev')
			sh 'AWS_ACCOUNT_ID=378808291776  ./infra.sh'
                       
                }
            }
		
        }
		
		
		stage('Deploy') {
	
	when {
    expression { 
        params.action == 'apply'
        
   	 }
	}

	steps{
		sh "chmod 777 ec2.py"
		sh "chmod 777 ec2.ini" 
		sh "./ec2.py --list --profile default --refresh-cache"
		//sh "ansible -i ec2.py -u ec2-user tag_ec2_manual -m ping "
		//sh "ansible-playbook -i ec2.py -u ec2-user  ansi.yml"
		sh "ansible-playbook ansi.yml -i ec2.py -u ec2-user --private-key=control_server.pem"
		
		} 
}
		
    }//stages
 
}//pipeline


