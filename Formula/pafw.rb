class Pafw < Formula
  desc "CLI tools for Palo Alto Networks firewalls"
  homepage "https://github.com/jiiro974/pafw"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v#{version}/pafw-darwin-arm64.tar.gz"
      sha256 "1f3195fe0d018b8e185ae175cb898afc69ab9452c061a3acd4b83aa7dd14a61a" # darwin-arm64
    end
    on_intel do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v#{version}/pafw-darwin-amd64.tar.gz"
      sha256 "b700c6f825bba97dacbea7e08118f6391aff2153d34bfbc38c55d2a17e3472e3" # darwin-amd64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v#{version}/pafw-linux-arm64.tar.gz"
      sha256 "8d977114b5b6454e959856cb66a4e8c579fd236c0683e6cb541a9d15e15e6379" # linux-arm64
    end
    on_intel do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v#{version}/pafw-linux-amd64.tar.gz"
      sha256 "64c6fe44e916e63e3267f55027c514efb331888faa8596bad139b28faf7e5d50" # linux-amd64
    end
  end

  SYMLINKS = %w[
    paping patrace paif paroute paarp pasession pafib pacounter pacap pagp palog
  ].freeze

  def install
    bin.install "pafw"
    SYMLINKS.each { |s| bin.install_symlink "pafw" => s }
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pafw version")
  end
end
