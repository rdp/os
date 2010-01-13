require 'rubygems' if RUBY_VERSION < '1.9'
require File.dirname(__FILE__) + '/../lib/os' # load before sane
require 'sane'
require 'spec/autorun'

describe "OS" do

  it "has a windows? method" do
    if RUBY_PLATFORM =~ /mingw|mswin/
      assert OS.windows? == true
      assert OS.windoze? == true
      assert OS.posix? == false
    else # ltodo jruby
      if RUBY_PLATFORM =~ /linux/
        assert OS.windows? == false
        assert OS.posix? == true
      end
    end
  end

  it "has a bits method" do
    if RUBY_PLATFORM =~ /mingw32/
       assert OS.bits == 32
    end
  end

  it "should know if you're on java" do
    if RUBY_PLATFORM == 'java'
      assert OS.java? == true # I want just this value...
    else
      assert OS.java? == false
    end
  end
  
  it "should have a ruby.exe method" do
    if OS.windows?
      assert OS.ruby_exe.include? 'ruby.exe'
    else
      OS.ruby
    end
  end
  
end
