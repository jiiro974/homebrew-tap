class Pafw < Formula
  desc "CLI tools for Palo Alto Networks firewalls"
  homepage "https://github.com/jiiro974/pafw"
  version "0.6.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v#{version}/pafw-darwin-arm64.tar.gz"
      sha256 "68aada82039ba1d561608788ce821b976f1e445d41994498e5aa043042a83b7c" # darwin-arm64
    end
    on_intel do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v#{version}/pafw-darwin-amd64.tar.gz"
      sha256 "459c77c939d3fffb8e1b91371edbb41e2d1434eb6c8e2d9e2afed9979bdef84c" # darwin-amd64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v#{version}/pafw-linux-arm64.tar.gz"
      sha256 "d6a6f603cdc068b514d4c667ef5c0602087974f963076b6ccd899f47c5f9c34a" # linux-arm64
    end
    on_intel do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v#{version}/pafw-linux-amd64.tar.gz"
      sha256 "4d279435d173c656b3dca4676410f4828587c6ecfb25a851682e2510118051fd" # linux-amd64
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
