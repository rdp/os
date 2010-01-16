require 'rubygems' if RUBY_VERSION < '1.9'
require File.dirname(__FILE__) + '/../lib/os.rb' # load before sane
require 'sane'
load File.dirname(__FILE__) + '/../lib/os.rb'
require 'spec/autorun'

describe "OS" do

  it "has a windows? method" do
    if RUBY_PLATFORM =~ /mingw|mswin/
      assert OS.windows? == true
      assert OS.doze? == true
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
    elsif RUBY_PLATFORM =~ /64/ # linux...
       assert OS.bits == 64 
    elsif RUBY_PLATFORM =~ /i686/
       assert OS.bits == 32
    elsif RUBY_PLATFORM =~ /java/ && RbConfig::CONFIG['host_os'] =~ /32$/
       assert OS.bits == 32
    elsif RUBY_PLATFORM =~ /java/ && RbConfig::CONFIG['host_cpu'] =~ /i386/
       assert OS.bits == 32
    else      
       pending "os bits not tested!" + RUBY_PLATFORM + ' ' +  RbConfig::CONFIG['host_os'] 
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
      assert OS.ruby_bin.include?('ruby.exe')
    else
      assert OS.ruby_bin.include?('ruby') && OS.ruby_bin.include?('/')
    end
  end
  
  it "should have a mac? method" do
    if RUBY_PLATFORM =~ /darwin/
      assert OS.mac?
    else
      assert !OS.mac?
    end
  end
  
end
