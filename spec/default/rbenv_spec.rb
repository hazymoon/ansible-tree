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
describe file('/etc/profile.d/rbenv.sh') do
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

# sudoからrbenvが実行できるようになっているか
describe file('/etc/sudoers.d/rbenv') do
  it {should be_file}
  it {should be_mode '644'}
  it {should be_owned_by 'root'}
end
describe command('rbenv') do
  it {should return_exit_status 0}
end

# rubyのコンパイルに必要なパッケージの確認
describe package('libcurl-devel') do
  it { should be_installed }
end
describe package('openssl-devel') do
  it { should be_installed }
end
describe package('zlib-devel') do
  it { should be_installed }
end
describe yumrepo('epel') do
  it {should exist}
  it {should be_enabled}
end
describe package('libcurl-devel') do
  it { should be_installed }
end

# ruby 2.1.0がインストールされているか確認
describe command('ruby --version') do
  it {should return_stdout(/ruby 2\.1\.0/)}
end
