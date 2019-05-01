node("master"){
  stage("Initialize"){
    doGitClone('git@github.com:ten-peb/puppet-module-docker.git','docker')
  }
  stage("Bundle Install"){
    dir("docker") {
      sh("bundle install --path=vendor")
    }
  }
  stage("Validate"){
    dir("docker") {
      sh("bundle exec rake validate")
    }
  }
  stage("Lint"){
    dir("docker"){
      sh("bundle exec rake lint")
    }
  }
  stage("Deploy"){
    build 'executeR10K'
  }
  
}