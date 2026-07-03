pipeline {
  agent any

  options {
    
    disableConcurrentBuilds()
    timeout(time: 10, unit: 'MINUTES')
  }

  environment {
    // Non-secret env only (secrets via withCredentials)
    PROJECT_NAME = "skivo-devops-course"
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Build metadata') {
      steps {
        sh '''
          set -euo pipefail
          echo "Project:    ${PROJECT_NAME}"
          echo "Job:        ${JOB_NAME}"
          echo "Build:      ${BUILD_NUMBER}"
          echo "Workspace:  ${WORKSPACE}"
          echo "Node:       ${NODE_NAME}"
          echo "Timestamp:  $(date -Is)"
          echo "Git commit: $(git rev-parse HEAD)"
          echo "Git branch: $(git rev-parse --abbrev-ref HEAD)"
        '''
      }
    }

    stage('Repo sanity checks') {
      steps {
        sh '''
          set -euo pipefail
          test -d app || (echo "app/ missing" && exit 1)
          test -d docs || (echo "docs/ missing" && exit 1)
          test -f .gitlab-ci.yml || echo ".gitlab-ci.yml missing (ok if not using GitLab in this repo)"
          test -d .github || echo ".github/ missing (ok if not using GitHub Actions in this repo)"
          echo "Sanity checks: OK"
        '''
      }
    }

    stage('Credentials smoke test (safe)') {
      steps {
        script {
          // We validate presence but never print secrets
          withCredentials([
            usernamePassword(credentialsId: 'scm-read-token', usernameVariable: 'SCM_USER', passwordVariable: 'SCM_TOKEN')
          ]) {
            sh '''
              set -euo pipefail
              test -n "$SCM_USER"
              test -n "$SCM_TOKEN"
              echo "SCM creds present (value not printed)."
            '''
          }
        }
      }
    }
  }

  post {
    always {
      echo "Pipeline finished (success or failure)."
    }
    failure {
      echo "Failure: open Console Output, check which stage failed."
    }
  }
}

EOF
