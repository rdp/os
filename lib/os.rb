class OS

  # treat cygwin as linux
  # also treat IronRuby on mono as...linux


  # OS.windows?
  # true if on windows [and/or jruby]
  # false if on linux or cygwin
  def self.windows?
    @windows ||= begin
      if RUBY_PLATFORM =~ /cygwin/ # i386-cygwin
        false
      elsif ENV['OS'] == 'Windows_NT'
        true
      else
        false
      end
    end

  end

  # true for linux, os x, cygwin
  def self.posix?
    @posix ||=
    begin
      if OS.windows?
        begin
          begin
            # what if we're on interix...
            # untested, of course
            Process.wait fork{}
            true
          rescue NotImplementedError
            false
          end
        end
      else
        # assume non windows is posix
        true
      end
    end

  end

  class << self
    alias :doze? :windows? # a joke but I use it
  end

  def self.bits
    @bits ||= begin
      require 'rbconfig'
      if RbConfig::CONFIG['host_cpu'] =~ /_64$/ # x86_64
        64
      elsif RbConfig::CONFIG['host_os'] =~ /32$/ # mingw32, mswin32
        32
      elsif RUBY_PLATFORM == 'java' && ENV_JAVA['sun.arch.data.model'] # "32" or "64" http://www.ruby-forum.com/topic/202173#880613
        puts 'using it'
         ENV_JAVA['sun.arch.data.model'].to_i
      else # cygwin only...I think
        if 1.size == 8
          64
        else
          32
        end
      end
    end
  end


  def self.java?
    @java ||= begin
      if RUBY_PLATFORM =~ /java/
        true
      else
        false
      end
    end
  end

  def self.ruby_bin
    @ruby_exe ||= begin
      require 'rbconfig'
      config = RbConfig::CONFIG
      File::join(config['bindir'], config['ruby_install_name']) + config['EXEEXT']
    end
  end
  
  def self.mac?
     RUBY_PLATFORM =~ /darwin/  
  end
  
end
