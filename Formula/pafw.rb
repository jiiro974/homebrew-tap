class Pafw < Formula
  desc "CLI tools for Palo Alto Networks firewalls - Pragma-TIC"
  homepage "https://www.pragma-tic.org"
  version "0.3.3"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v0.3.3/pafw-darwin-arm64.tar.gz"
      sha256 "1e803bf2d442efdc55aa014da4792233382008034758cdfa425ae3dbe68461f1"
    end
    on_intel do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v0.3.3/pafw-darwin-amd64.tar.gz"
      sha256 "30c88ee7a6d37d5a7c384f10ee9a566a637bb39ebea5addd38f4a3d15d5a4820"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v0.3.3/pafw-linux-arm64.tar.gz"
      sha256 "4a802ddede4877e25c345848ccf9c57392d1320a1cd1e08b04f9abe3b7a75f0a"
    end
    on_intel do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v0.3.3/pafw-linux-amd64.tar.gz"
      sha256 "211157fc6e877226afdc2d2f56b09a41597df97e907df7cff792411b00cbcf4b"
    end
  end

  def install
    bin.install "pafw"
    %w[paping patrace paif paroute paarp pasession pafib pacounter pacap pagp palog].each do |cmd|
      bin.install_symlink "pafw" => cmd
    end
  end

  test do
    assert_match "v0.3.3", shell_output("#{bin}/pafw --version")
    assert_match "Pragma-TIC", shell_output("#{bin}/pafw --version")
  end
end
