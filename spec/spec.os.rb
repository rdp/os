require 'rubygems' if RUBY_VERSION < '1.9'
#require 'fast_require'
require File.dirname(__FILE__) + '/../lib/os.rb' # load before sane
require 'sane'
load File.dirname(__FILE__) + '/../lib/os.rb'
require 'spec/autorun'
require 'rbconfig'

describe "OS" do

  it "has a windows? method" do
    if ENV['OS'] == 'Windows_NT'
      unless RUBY_PLATFORM =~ /cygwin/
        assert OS.windows? == true
        assert OS.doze? == true
        assert OS.posix? == false
      else
        assert OS::Underlying.windows?
        assert OS.windows? == false
        assert OS.posix? == true
      end
      assert OS::Underlying.windows?
    elsif (RbConfig::CONFIG["host_os"] == 'linux') || RUBY_PLATFORM =~ /linux/
      assert OS.windows? == false
      assert OS.posix? == true
      assert !OS::Underlying.windows?
    else
      pending "create test"
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
    elsif RUBY_PLATFORM =~ /i386/
      assert OS.bits == 32
    else
      pending "os bits not tested!" + RUBY_PLATFORM + ' ' +  RbConfig::CONFIG['host_os']
    end

  end
  
  it "should have an iron_ruby method" do
    if defined?(RUBY_ENGINE) && RUBY_ENGINE == 'ironruby'
      assert OS.iron_ruby? == true
    else
      assert OS.iron_ruby? == false
    end
  end

  it "should know if you're on java" do
    if RUBY_PLATFORM == 'java'
      assert OS.java? == true # must be [true | false]
    else
      assert OS.java? == false
    end
  end

  it "should have a ruby_bin method" do
    if OS.windows?
      assert OS.ruby_bin.include?('.exe')
      if OS.iron_ruby?
        assert OS.ruby_bin.include?('ir.exe')
      else
        assert OS.ruby_bin.include?('ruby.exe')
      end
    else
      assert OS.ruby_bin.include?('ruby') && OS.ruby_bin.include?('/')
    end

    if OS.java?
      assert OS.ruby_bin.include?('jruby') # I think
    end

  end
  
  it "should have a cygwin? method" do
    if RUBY_PLATFORM =~ /cygwin/
      assert OS.cygwin? == true
    else
      assert OS.cygwin? == false
    end
  end

  it "should have a mac? method" do
    if RUBY_PLATFORM =~ /darwin/
      assert OS.mac? == true
    else
      assert OS.mac? == false
    end
  end

  it "should have a way to get rss_bytes on each platform" do
    if !OS.iron_ruby?
      bytes = OS.rss_bytes
      assert bytes > 0 # should always be true
      assert bytes.is_a?(Numeric) # don't want strings from any platform...
    end
  end


end
