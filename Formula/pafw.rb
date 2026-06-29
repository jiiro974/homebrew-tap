class Pafw < Formula
  desc "CLI tools for Palo Alto Networks firewalls"
  homepage "https://github.com/jiiro974/pafw"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v#{version}/pafw-darwin-arm64.tar.gz"
      sha256 "26fa52fb0f366c1b7e7fb10f62640fa532a79b8c782d6e2dfe89210bc5fcf90f" # darwin-arm64
    end
    on_intel do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v#{version}/pafw-darwin-amd64.tar.gz"
      sha256 "8fcf3aecb69cdf4e7985794c2e5c6bcec3081c4fe423f3482a29331fd6f3bfeb" # darwin-amd64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v#{version}/pafw-linux-arm64.tar.gz"
      sha256 "b48e0043b73fad460e807d0e25b29815addb086166848b38bb648aaed8eea948" # linux-arm64
    end
    on_intel do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v#{version}/pafw-linux-amd64.tar.gz"
      sha256 "44c20bfb4abac9029870c43a599dc68b874b5053b409bc395218dc58eae354ab" # linux-amd64
    end
  end

  SYMLINKS = %w[
    paping patrace paif paroute paarp pasession pafib pacounter pacap pagp palog
    pavpn paaudit papano pacluster
  ].freeze

  def install
    bin.install "pafw"
    SYMLINKS.each { |s| bin.install_symlink "pafw" => s }
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pafw version")
  end
end
