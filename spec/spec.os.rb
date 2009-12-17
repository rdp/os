require 'rubygems' if RUBY_VERSION < '1.9'
require 'sane'
require_rel '../lib/os'
require 'spec/autorun'

describe "OS" do

  it "has a windows? method" do
    if RUBY_PLATFORM =~ /mingw|mswin/
      assert OS.windows? == true
    else
     puts OS.windows?
      assert OS.windows? == false
    end
  end

  it "has a bits method" do
    if RUBY_PLATFORM =~ /mingw32/
       assert OS.bits == 32
    end
  end

  it "should know if you're on java" do
    if RUBY_PLATFORM == 'java'
      assert OS.java? == true
    else
      assert OS.java? == false
    end
  end
end
