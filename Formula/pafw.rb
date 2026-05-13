class Pafw < Formula
  desc "CLI tools for Palo Alto Networks firewalls - Pragma-TIC"
  homepage "https://www.pragma-tic.org"
  version "0.3.5"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v0.3.5/pafw-darwin-arm64.tar.gz"
      sha256 "f15ae2fc52a2a80102b5b809ffccc0b9093dd5a66bc737d681d1510f8b5003ea"
    end
    on_intel do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v0.3.5/pafw-darwin-amd64.tar.gz"
      sha256 "298032ad3c9abed3d98ce41b0d4394f12db13269088db2f4f0c16716a54953f9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v0.3.5/pafw-linux-arm64.tar.gz"
      sha256 "1d43e1a898425468b8e13f8df7adb692bb6c1be4f04c9eaae526dac20456292b"
    end
    on_intel do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v0.3.5/pafw-linux-amd64.tar.gz"
      sha256 "bcd87246d643efc0129cfb61f6ff2201ff3063c5d331e63e69fd59dc41df0a2a"
    end
  end

  def install
    bin.install "pafw"
    %w[paping patrace paif paroute paarp pasession pafib pacounter pacap pagp palog].each do |cmd|
      bin.install_symlink "pafw" => cmd
    end
  end

  test do
    assert_match "v0.3.5", shell_output("#{bin}/pafw --version")
    assert_match "Pragma-TIC", shell_output("#{bin}/pafw --version")
  end
end
