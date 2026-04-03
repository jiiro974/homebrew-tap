class Pafw < Formula
  desc "CLI tools for Palo Alto Networks firewalls - Pragma-TIC"
  homepage "https://www.pragma-tic.org"
  version "0.3.2"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v0.3.2/pafw-darwin-arm64.tar.gz"
      sha256 "501109a4da8af0cbbac7b4d42b8e2b71b866043ad2876fa862b0e55d60c80eb9"
    end
    on_intel do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v0.3.2/pafw-darwin-amd64.tar.gz"
      sha256 "a9cffc5e01151771e04837ca9a06d55be84e903d6fb4e169b3cc272784f9ad3e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v0.3.2/pafw-linux-arm64.tar.gz"
      sha256 "4f10621c938bfa4e3057848f0fef60ec7f325a6f9b07e2b79d25ea0c58c73bfe"
    end
    on_intel do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v0.3.2/pafw-linux-amd64.tar.gz"
      sha256 "21e7054aa5fd8fcf12cb3aa82801057eeb68723326ae36f33eb937c29de33fcd"
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
