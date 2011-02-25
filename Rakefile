require 'rubygems'
require 'rake'


begin
  require 'psych'
rescue ::LoadError
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "os"
    gem.summary = %Q{Simple and easy way to know if you're on windows or not (reliably), as well as how many bits the OS is, etc.}
    gem.description = %Q{The OS gem allows for some useful and easy functions, like OS.windows? (=> true or false) OS.bits ( => 32 or 64) etc"}
    gem.email = "rogerpack2005@gmail.com"
    gem.homepage = "http://github.com/rdp/os"
    gem.authors = ["rdp", "David McCullars"]
    gem.add_development_dependency "rspec", ">= 2.0"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
    gem.add_development_dependency "sane"
    # gem.add_development_dependency "fast_require"
  end
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end
