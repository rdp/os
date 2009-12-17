class OS

 require 'rbconfig'
 host_os = RbConfig::CONFIG['host_os']
 WINDOZE = true if host_os =~ /mswin|mingw/

 # OS.windows?
 # true if on windows [and/or jruby]
 # false if on linux or cygwin
 def self.windows?
  WINDOZE
 end

 if host_os =~ /32/
   BITS = 32
 else
   raise unless host_os =~ /64/
   BITS = 64
 end

 def self.bits
  BITS
 end

end