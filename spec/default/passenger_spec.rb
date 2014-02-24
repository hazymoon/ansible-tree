# -*- coding: utf-8 -*-
require 'spec_helper'

# passenger経由でnginxを入れるので、パッケージ版は不要
describe package 'nginx' do
  it {should_not be_installed}
end
# passengerがインストールされているか確認
describe command('gem list') do
  it {should return_stdout(/passenger/)}
end

describe service 'nginx' do
  it {should be_enabled}
  it {should be_running}
end
