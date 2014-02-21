# -*- coding: utf-8 -*-
require 'spec_helper'

rbenv_path = '/usr/local/rbenv'
describe file("#{rbenv_path}/bin/rbenv") do
  it {should be_executable}
end

describe file(rbenv_path) do
  it {should be_directory}
end

ruby_build_path = '/usr/local/rbenv/plugins/ruby-build'

describe file("#{ruby_build_path}/bin/ruby-build") do
  it {should be_executable}
end

describe file(ruby_build_path) do
  it {should be_directory}
end

# rbenvのログイン時設定用ファイルの確認
describe file('/etc/profile.d/rbenv') do
  it {should be_file}
  it {should be_mode '644'}
  it {should be_owned_by 'root'}
  its(:content) { should match(/RBENV_ROOT=/) }
  its(:content) { should match(/PATH=/) }
  its(:content) { should match(/rbenv init/) }
end

# rbenv関係の環境変数が設定されているかどうか
describe command('printenv RBENV_ROOT') do
  /#{rbenv_path}/
end

describe command('printenv PATH') do
  /#{rbenv_path}\/bin/
end

# rbenv initが実行されたかどうか
describe file('/usr/local/rbenv/shims') do
  it {should be_directory}
end
describe file('/usr/local/rbenv/versions') do
  it {should be_directory}
end
