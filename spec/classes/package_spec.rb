require 'spec_helper'
include RspecPuppetFacts
describe 'docker::package' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) {
{
  architecture => "amd64",
  distro => {
    codename => "bionic",
    description => "Ubuntu 18.04.2 LTS",
    id => "Ubuntu",
    release => {
      full => "18.04",
      major => "18.04"
    }
  },
  family => "Debian",
  hardware => "x86_64",
  name => "Ubuntu",
  release => {
    full => "18.04",
    major => "18.04"
  },
  selinux => {
    enabled => false
  }
}
      }
puts :facts.inspect 
      it { is_expected.to compile }
    end
  end
end
