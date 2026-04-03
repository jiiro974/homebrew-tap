class Pafw < Formula
  desc "CLI tools for Palo Alto Networks firewalls - Pragma-TIC"
  homepage "https://www.pragma-tic.org"
  version "0.3.2"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v0.3.2/pafw-darwin-arm64.tar.gz"
      sha256 "21105dc90626bf8793b567329ee1d8b1dd04a56522f73290e64a95e1a3fec46d"
    end
    on_intel do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v0.3.2/pafw-darwin-amd64.tar.gz"
      sha256 "325d607b9b64e22cc37fa237a2711a54247025d01c9c998c33a154c0d68acc40"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v0.3.2/pafw-linux-arm64.tar.gz"
      sha256 "dd808f926f26d1e83b32a354c39441d1c66ceb2765f8ab062f4cda01d8a70d5e"
    end
    on_intel do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v0.3.2/pafw-linux-amd64.tar.gz"
      sha256 "21c296d1a3a1e8348f9505c7ec879e6559eb09e2926f30f25ef27985e6d99cb6"
    end
  end

  def install
    bin.install "pafw"
    %w[paping patrace paif paroute paarp pasession pafib pacounter pacap pagp].each do |cmd|
      bin.install_symlink "pafw" => cmd
    end
  end

  test do
    assert_match "v0.3.2", shell_output("#{bin}/pafw --version")
    assert_match "Pragma-TIC", shell_output("#{bin}/pafw --version")
  end
end
