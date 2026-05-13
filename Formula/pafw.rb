class Pafw < Formula
  desc "CLI tools for Palo Alto Networks firewalls - Pragma-TIC"
  homepage "https://www.pragma-tic.org"
  version "0.3.4"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v0.3.4/pafw-darwin-arm64.tar.gz"
      sha256 "c457b7f8616356d676495cd6f21ccd2d9a1448a412308bf71443d338fbd84199"
    end
    on_intel do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v0.3.4/pafw-darwin-amd64.tar.gz"
      sha256 "a95fdba6c31b4a62523fc6d07884116bb83ac02cc8edf28b5ca234b828e62591"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v0.3.4/pafw-linux-arm64.tar.gz"
      sha256 "f15511bd410a70c15f64679b8c03c66974d34a32fa4416b6578ae279bc5eda85"
    end
    on_intel do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v0.3.4/pafw-linux-amd64.tar.gz"
      sha256 "dfe03b88dd079b30ff5fadec97e0cc2725c064e4948d0ba70bcc0dc19f21ae3e"
    end
  end

  def install
    bin.install "pafw"
    %w[paping patrace paif paroute paarp pasession pafib pacounter pacap pagp palog].each do |cmd|
      bin.install_symlink "pafw" => cmd
    end
  end

  test do
    assert_match "v0.3.4", shell_output("#{bin}/pafw --version")
    assert_match "Pragma-TIC", shell_output("#{bin}/pafw --version")
  end
end
