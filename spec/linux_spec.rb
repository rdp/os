# encoding: utf-8
describe 'For Linux, (Ubuntu, Ubuntu 10.04 LTS) ' do
  before(:each) do
    allow(ENV).to receive(:[]).with('OS')
    ## Having difficulties finding a stub for RUBY_PLATFORM
    #  Looking into something like: http://stackoverflow.com/questions/1698335/can-i-use-rspec-mocks-to-stub-out-version-constants
    #  For now, simply using RbConfig::CONFIG
    # Kernel.stub!(:const_get).with('RUBY_PLATFORM').and_return("i686-linux")
    allow(RbConfig::CONFIG).to receive(:[]).with('host_os').and_return('linux_gnu')
    allow(RbConfig::CONFIG).to receive(:[]).with('host_cpu').and_return('i686')
  end

  describe OS do
    subject { OS } # class, not instance

    it { is_expected.to be_linux }
    it { is_expected.to be_posix }

    it { is_expected.not_to be_mac }
    it { is_expected.not_to be_osx }
    it { is_expected.not_to be_windows }
  end

  describe OS::Underlying do
    subject { OS::Underlying } # class, not instance

    it { is_expected.to be_linux }

    it { is_expected.not_to be_bsd }
    it { is_expected.not_to be_windows }
  end
end
