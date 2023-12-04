/*
	Copyright CESSDA ERIC 2017-2019

	Licensed under the Apache License, Version 2.0 (the "License"); you may not
	use this file except in compliance with the License.
	You may obtain a copy of the License at
	http://www.apache.org/licenses/LICENSE-2.0

	Unless required by applicable law or agreed to in writing, software
	distributed under the License is distributed on an "AS IS" BASIS,
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	See the License for the specific language governing permissions and
	limitations under the License.
*/
pipeline {

	options {
		disableConcurrentBuilds abortPrevious: true
	}

	environment {
		productName = 'cmv'
		componentName = 'documentation'
		imageTag = "${docker_repo}/${productName}-${componentName}:${env.BRANCH_NAME}-${env.BUILD_NUMBER}"
	}

	agent any

	stages {
		stage('Lint Documentation') {
			agent {
				dockerfile {
					filename 'jekyll.Dockerfile'
					reuseNode true
				}
			}
			steps {
				sh "bundle exec rake lint"
			}
		}
		stage('Build Documentation') {
			agent {
				dockerfile {
					filename 'jekyll.Dockerfile'
					reuseNode true
				}
			}
			steps {
				sh "jekyll build"
				sh "bundle exec rake htmlproofer"
			}
		}
		stage('Generate Site') {
			agent {
				docker {
					image 'openjdk:8'
					reuseNode true
				}
			}
			steps {
				withMaven {
					sh './mvnw clean site'
				}
			}
			post {
				always {
					recordIssues tools: [javaDoc(), mavenConsole()]
				}
			}
		}
		stage('Deploy Project') {
			agent {
				docker {
					image 'openjdk:8'
					reuseNode true
				}
			}
			steps {
				withMaven {
					sh './mvnw deploy'
				}
			}
			when {
				anyOf {
					branch 'main'
					buildingTag()
				}
			}
		}
	}
}
