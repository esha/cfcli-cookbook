require 'spec_helper'

describe command('cf --version') do
  its(:exit_status) { should eq 0 }
end
