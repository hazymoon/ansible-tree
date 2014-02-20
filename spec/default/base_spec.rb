# -*- coding: ascii-8bit -*-
require 'spec_helper'

describe command('/usr/bin/yum grouplist "Development tools"') do
  it {should return_stdout(/Installed Groups/)}
end

