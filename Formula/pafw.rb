class Pafw < Formula
  desc "CLI tools for Palo Alto Networks firewalls"
  homepage "https://github.com/jiiro974/pafw-releases"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v0.2.0/pafw-darwin-arm64.tar.gz"
      sha256 "d2147c6a3336dbbfceacf7042a065b6ce61a03d10f847a4d182825f4966130ea"
    end

    on_intel do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v0.2.0/pafw-darwin-amd64.tar.gz"
      sha256 "bbbb700f9c03dd4616b7ef8f7fa16be9f1ba2a234e653f6aae033f27f3bfbfc5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v0.2.0/pafw-linux-arm64.tar.gz"
      sha256 "480bfd9cee25a0dbe595648a203cb137cdded79c73834b4fb834a15f9be87a43"
    end

    on_intel do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v0.2.0/pafw-linux-amd64.tar.gz"
      sha256 "34fd64e25d9dc81eb7259b0a2ad1d4e05104cb5a8eab2f0aaa51feefeb57c414"
    end
  end

  def install
    bin.install Dir["pa*"]
  end

  test do
    assert_match "v0.2.0", shell_output("#{bin}/pafw --version")
  end
end
