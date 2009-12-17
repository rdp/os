require 'sane'
require_rel '../lib/os'
require 'spec/autorun'

describe "OS" do

  it "has a windows? method" do
    if RUBY_PLATFORM =~ /mingw|mswin/
      assert OS.windows? == true
    else
      assert OS.windows? == false
    end
  end

  it "has a bits method" do
    if RUBY_PLATFORM =~ /mingw32/
       assert OS.bits == 32
    end
  end
end
