class Pafw < Formula
  desc "CLI tools for Palo Alto Networks firewalls"
  homepage "https://github.com/jiiro974/pafw"
  version "0.5.0-4-g7b1554f"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v#{version}/pafw-darwin-arm64.tar.gz"
      sha256 "1f6daa3dc64e91f6e750e7d2d1846744bbe12057d320934cef9e7c27e6b5ab49" # darwin-arm64
    end
    on_intel do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v#{version}/pafw-darwin-amd64.tar.gz"
      sha256 "522ea701bda4c577a40cf3d23e15d93aa6678e0d42193404f1bf93e44b8715e9" # darwin-amd64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v#{version}/pafw-linux-arm64.tar.gz"
      sha256 "26eba8d0a4ac8784f1143452ff187da1e1d0a7e195792ac0040c464c3ce3bfc0" # linux-arm64
    end
    on_intel do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v#{version}/pafw-linux-amd64.tar.gz"
      sha256 "86eebd417981aafd8d4b37f034ca95b555fbe9934d200ea544e2d1cb46b4cb85" # linux-amd64
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
