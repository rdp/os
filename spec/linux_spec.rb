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

    it 'detects cgroup-v2 Docker containers from the environment file' do
      allow(File).to receive(:exist?).with('/.dockerenv').and_return(true)

      expect(OS::Underlying.docker?).to eq(true)
    end

    it 'detects Docker markers in cgroup membership without spawning grep' do
      allow(File).to receive(:exist?).with('/.dockerenv').and_return(false)
      allow(File).to receive(:foreach).with('/proc/self/cgroup').and_return([
        "0::/system.slice/docker-012345.scope\n"
      ])

      expect(OS::Underlying.docker?).to eq(true)
    end

    it 'returns false when Docker metadata is unavailable' do
      allow(File).to receive(:exist?).with('/.dockerenv').and_return(false)
      allow(File).to receive(:foreach).with('/proc/self/cgroup').and_raise(Errno::ENOENT)

      expect(OS::Underlying.docker?).to eq(false)
    end
  end
end
