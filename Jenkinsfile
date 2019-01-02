node {
  checkout scm

  stage("Build Image") {
    sh '''
      export IMAGE_NAME=docker.io/armory/demoapp:${BRANCH_NAME}-${BUILD_ID}
      docker build -t $IMAGE_NAME -f Dockerfile .
    '''
  }

  stage("Push Image") {
    sh '''
      export VERSION=${BRANCH_NAME}-${BUILD_ID}
      export IMAGE_NAME=docker.io/armory/demoapp:${VERSION}
      docker push $IMAGE_NAME
      echo "VERSION=$VERSION" > build.properties
    '''
    archiveArtifacts artifacts: 'build.properties'
  }  
}


