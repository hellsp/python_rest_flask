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


echo "======== destroy previous ver image ======="
DOCKER_ID=$(docker ps -a|grep "test-python-rest-flask"|awk \'{print $1}\')
if [ "$DOCKER_ID" ]; then
	for id in $DOCKER_ID
    do
		docker rm -f $id
    done
fi

echo "========= build docker image ======"
docker build -t test-python-rest-flask:v$BUILD_NUMBER .

echo "========= run docker image ======"
docker run -d -p 5010:5000 test-python-rest-flask:v$BUILD_NUMBER


echo "========= new docker logs ======="
NEW_DOCKER_ID=$(docker ps -a|grep "test-python-rest-flask"|awk \'{print $1}\')
docker inspect -f \'{{.State.Running}}\' $NEW_DOCKER_ID

sleep 2
docker logs $NEW_DOCKER_ID 


echo "Test URL:" http://aws-jks.dynu.net:5010/employees
echo "Test URL: " http://aws-jks.dynu.net:5010/showtest'''
      }
    }
  }
}