node("master"){
  stage("Initialize"){
    doGitClone('git@github.com:ten-peb/puppet-module-docker.git','docker')
  }
  stage("Bundle Install"){
    sh("bundle install --path=vendor")
  }
  stage("Validate"){
    sh("bundle exec rake validate")
  }
  stage("Lint"){
    sh("bundle exec rake lint")
  }
  stage("Deploy"){
    build 'executeR10K'
  }
  
}