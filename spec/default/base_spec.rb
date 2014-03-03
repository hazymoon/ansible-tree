# -*- coding: ascii-8bit -*-
require 'spec_helper'
describe yumrepo('epel') do
  it { should exist }
end

describe yumrepo('epel') do
  it { should be_enabled }
end

describe package 'yum-plugin-fastestmirror' do
  it {should be_installed}
end

describe command('/usr/bin/yum grouplist "Development tools"') do
  it {should return_stdout(/Installed Groups/)}
end

describe package 'mlocate' do
  it {should be_installed}
end

describe package 'telnet' do
  it {should be_installed}
end

describe package 'bind-utils' do
  it {should be_installed}
end

describe package 'vim-enhanced' do
  it {should be_installed}
end

describe package 'zsh' do
  it {should be_installed}
end

describe package 'tmux' do
  it {should be_installed}
end
