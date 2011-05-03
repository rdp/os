require 'rubygems' if RUBY_VERSION < '1.9.0'

require File.dirname(__FILE__) + '/../lib/os.rb' # load before sane to avoid sane being able to requir the gemified version...
require 'rspec' # rspec2

describe "OS" do
  describe 'OSX (Snow Leopard, 10.6)' do
    before(:each) do
      ENV.stub!(:[]).with('OS').and_return(nil)
      Kernel.stub!(:RUBY_PLATFORM => "x86_64-darwin10.6")
    end

    subject { OS }

    it { should_not be_windows }
    it { should be_mac }
    it { should be_osx }
    it { should be_posix }
  end
end
