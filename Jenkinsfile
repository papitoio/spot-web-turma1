pipeline {
   agent {
       docker {
           image "ruby"
       }
   }
   stages {
      stage('Build') {
         steps {
            echo 'Building or resolve dependencies!'
            sh 'bundle install'
         }
      }
      stage('Tests') {
         steps {
            echo 'Running regresson tests'
            sh 'bundle exec cucumber -p ci'
         }
      }
      stage('UAT') {
         steps {
            echo 'Wait for User Acceptance Testing'
            input(message: 'Go to production?', ok: 'Yes')
         } 
      }
      stage('Prod') {
          steps {
             echo 'WebApp is Ready :)'
          }
      }
   }
}