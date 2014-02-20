require 'spec_helper'

describe command '/usr/bin/yum check-update' do
  it { should return_exit_status 0 }
end

describe package 'yum-plugin-fastestmirror' do
  it { should be_installed }
end
