class OS

 require 'rbconfig'
 host_os = RbConfig::CONFIG['host_os']
 if host_os =~ /mswin|mingw/
   WINDOZE = true
 else
   WINDOZE = false
 end

 # OS.windows?
 # true if on windows [and/or jruby]
 # false if on linux or cygwin
 def self.windows?
  WINDOZE
 end

 def self.linux?
  !WINDOZE
 end

 class << self
   alias :windoze? :windows? #the joke one
 end

 if host_os =~ /32/
   BITS = 32
 else
   if host_os =~ /64/
    BITS = 64
   else # cygwin
    if (1<<32).class == Fixnum
      BITS = 64
    else
      BITS = 32
    end
  end
 end


 def self.bits
  BITS
 end

 def self.java?
   if RUBY_PLATFORM =~ /java/
     true
   else
     false
   end
 end

end