class Pafw < Formula
  desc "CLI tools for Palo Alto Networks firewalls"
  homepage "https://github.com/jiiro974/pafw"
  version "0.6.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v#{version}/pafw-darwin-arm64.tar.gz"
      sha256 "a86c0bfeb39c6a95ce50470795e95b0ba2975cfbba12eb32aca5b02febd493f9" # darwin-arm64
    end
    on_intel do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v#{version}/pafw-darwin-amd64.tar.gz"
      sha256 "0e0254648f32a60f1cf3f091d1e896b5f1f8b278990126bd13cd8e15c895059d" # darwin-amd64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v#{version}/pafw-linux-arm64.tar.gz"
      sha256 "76950464443a5cebfbaa2c501c762cac4809ef155cf182cf2618d520bf7a4a14" # linux-arm64
    end
    on_intel do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v#{version}/pafw-linux-amd64.tar.gz"
      sha256 "c815326c5d455f7eb6cdd8459fd056d2a886cb9205f9ce1b4644de7ef85987cf" # linux-amd64
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
