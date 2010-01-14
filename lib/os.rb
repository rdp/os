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
      host_os = RbConfig::CONFIG['host_os']
      if host_os =~ /32/
        32
      else
        if host_os =~ /64/
          64
        else # cygwin...
          if (1<<32).class == Fixnum
            64
          else
            32
          end
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
end