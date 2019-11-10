pipeline {
  agent {
    dockerfile {
      filename 'Dockerfile'
    }

  }
  stages {
    stage('Build') {
      steps {
        sh '''echo "========= list all files ======"
ls *.*

echo "========= commit information ========="
echo "BUILD_NUMBER: "$BUILD_NUMBER
echo "GIT_BRANCH: " $GIT_BRANCH
echo "GIT_COMMIT URL: " $GIT_URL/commit/$GIT_COMMIT


echo "Test URL:" http://aws-jks.dynu.net:5010/employees
echo "Test URL: " http://aws-jks.dynu.net:5010/showtest'''
      }
    }
  }
  environment {
    t = 'test-python-rest-flask:v$BUILD_NUMBER'
  }
}