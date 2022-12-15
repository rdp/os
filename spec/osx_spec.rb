describe 'For OSX (Snow Leopard, 10.6),' do
  before(:each) do
    allow(ENV).to receive(:[]).with('OS').and_return(nil)
    # Issues stubbing RUBY_PLATFORM, using RbConfig instead.
    # Kernel.stub!(:RUBY_PLATFORM => "x86_64-darwin10.6")
    allow(RbConfig::CONFIG).to receive(:[]).with('host_os').and_return("darwin10.6.0")
    allow(RbConfig::CONFIG).to receive(:[]).with('host_cpu').and_return('i386')
  end

  describe OS do
    subject { OS } # class, not instance

    it { is_expected.to be_mac }
    it { is_expected.to be_x } # OS.x?
    it { is_expected.to be_osx }
    it { is_expected.to be_posix }

    it { is_expected.not_to be_windows }

  end

  describe OS::Underlying do
    subject { OS::Underlying } # class, not instance

    it { is_expected.to be_bsd }
    it { is_expected.not_to be_windows }
  end
end
