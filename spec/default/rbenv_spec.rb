# -*- coding: utf-8 -*-
require 'spec_helper'

describe file('/usr/local/rbenv/bin/rbenv') do
  it {should be_executable}
end
