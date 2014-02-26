# -*- coding: utf-8 -*-

require 'spec_helper'

describe package 'redis' do
  it {should be_installed}
end

describe service 'redis' do
  it {should be_running}
  it {should be_enabled}
end