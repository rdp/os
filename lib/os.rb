# a set of friendly files for determining your Ruby runtime
# treats cygwin as linux
# also treats IronRuby on mono as...linux
class OS

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
          rescue NotImplementedError, NoMethodError
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
  
  def self.iron_ruby?
   @iron_ruby ||= begin
     if defined?(RUBY_ENGINE) && (RUBY_ENGINE == 'ironruby')
       true
     else
       false
     end
   end
  end

  def self.bits
    @bits ||= begin
      require 'rbconfig'
      host_cpu = RbConfig::CONFIG['host_cpu']
      if host_cpu =~ /_64$/ # x86_64
        64
      elsif RUBY_PLATFORM == 'java' && ENV_JAVA['sun.arch.data.model'] # "32" or "64" http://www.ruby-forum.com/topic/202173#880613
        ENV_JAVA['sun.arch.data.model'].to_i
      elsif host_cpu == 'i386'
        32
      elsif RbConfig::CONFIG['host_os'] =~ /32$/ # mingw32, mswin32
        32
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
    @mac = begin
      if RUBY_PLATFORM =~ /darwin/
        true
      else
        false
      end
    end      
  end

  # amount of memory the current process "is using", in RAM
  # (doesn't include any swap memory that it may be using, just that in actual RAM)
  # raises 'unknown' on jruby currently
  def self.rss_bytes
    # attempt to do this in a jruby friendly way
    if OS::Underlying.windows?
      # MRI, Java, IronRuby, Cygwin
      if OS.java?
        # no win32ole yet available...
        require 'java'
        mem_bean = java.lang.management.ManagementFactory.memory_mxbean
        mem_bean.heap_memory_usage.used + mem_bean.non_heap_memory_usage.used
      else
        wmi = nil
        begin
          require 'win32ole'
          wmi = WIN32OLE.connect("winmgmts://")
        rescue LoadError, NoMethodError # NoMethod for IronRuby currently [sigh]
          raise 'rss unknown for this platform'
        end        
        processes = wmi.ExecQuery("select * from win32_process where ProcessId = #{Process.pid}")
        memory_used = nil
        # only allow for one...
        for process in processes; raise if memory_used; memory_used = process.WorkingSetSize.to_i; end
        memory_used
      end
    elsif OS.posix? # assume linux I guess...
      kb = `ps -o rss= -p #{Process.pid}`.to_i # in kilobytes
    else
      raise 'unknown rss for this platform'
    end
  end

  class Underlying

    def self.windows?
      ENV['OS'] == 'Windows_NT'
    end

  end
  
  def self.cygwin?
    @cygwin = begin
      if RUBY_PLATFORM =~ /-cygwin/
        true
      else
        false
      end
    end
  end

end
