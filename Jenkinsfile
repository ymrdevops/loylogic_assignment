pipeline {
    agent any
	
	  tools
    {
       maven "Maven"
    }
 stages {
      stage('checkout') {
           steps {
             
                git branch: 'master', url: 'git clone https://github.com/spring-projects/spring-petclinic.git'
             
          }
        }
	 stage('Execute Maven') {
           steps {
             
                sh 'cd spring-petclinic/'
                sh './mvnw package'
                sh 'cp ./target/spring-petclinic-2.5.0-SNAPSHOT.jar /mnt/artefact'				
          }
        }
        

  stage('Docker Build and Tag') {
           steps {
              
                sh 'docker build -t petclinic .' 
                sh 'docker tag petclinic ymrcse/petclinic:latest'
             
          }
        }
     
  stage('Publish image to Docker Hub') {
          
            steps {
        withDockerRegistry([ credentialsId: "dockerHub", url: "https://hub.docker.com" ]) {
          sh  'docker push ymrcse/petclinic:latest'
        }
                  
          }
        }
     
      stage('Run Docker container on Jenkins Agent') {
             
            steps 
			{
                sh "docker run -d -p 8080:8080 ymrcse/petclinic"
 
            }
        }
 stage('Run Docker container on remote hosts') {
             
            steps {
                sh "docker -H ssh://jenkins@IP run -d -p 8080:8080 ymrcse/petclinic"
 
            }
        }
		
stage('Ansible Deploy') {
             
            steps {
                 
             
               
               sh "ansible-playbook main.yml -i inventories/dev/hosts --user jenkins --key-file ~/.ssh/id_rsa"

               
            
            }
        }
    }
}
    

