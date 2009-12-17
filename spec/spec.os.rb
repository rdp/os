require 'rubygems' if RUBY_VERSION < '1.9'
# try to help sane gem out a bit
$: << File.dirname(__FILE__) + '/../lib'
require 'os'
require 'sane'
require 'spec/autorun'

describe "OS" do

  it "has a windows? method" do
    if RUBY_PLATFORM =~ /mingw|mswin/
      assert OS.windows? == true
      assert OS.windoze? == true
      assert OS.linux? == false
    else # ltodo jruby
      if RUBY_PLATFORM =~ /linux/
        assert OS.windows? == false
        assert OS.linux? == true
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
      assert OS.java? == true
    else
      assert OS.java? == false
    end
  end
end
