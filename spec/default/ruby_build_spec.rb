# -*- coding: utf-8 -*-
require 'spec_helper'

describe file('/usr/local/rbenv/plugins/ruby-build/bin/ruby-build') do
  it {should be_executable}
end
