class Pafw < Formula
  desc "CLI tools for Palo Alto Networks firewalls"
  homepage "https://github.com/jiiro974/pafw-releases"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v0.3.0/pafw-darwin-arm64.tar.gz"
      sha256 "f062afe7f4a730979282b6586cd93bb5be9441f75214084a539130401280569b"
    end
    on_intel do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v0.3.0/pafw-darwin-amd64.tar.gz"
      sha256 "c19a53edcf334790a1545ae0e51fe854a92fc76b8384c49bf0a4b04b61537b84"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v0.3.0/pafw-linux-arm64.tar.gz"
      sha256 "d0636dd0b3344687f1a184a0757a5a7572ec14132433e06969dda427f627452c"
    end
    on_intel do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v0.3.0/pafw-linux-amd64.tar.gz"
      sha256 "02cd6898d467351c719fedd9fc9b000a32f474b284605bdc529a622a40bd96c2"
    end
  end

  def install
    bin.install Dir["pa*"]
  end

  test do
    assert_match "v0.3.0", shell_output("#{bin}/pafw --version")
  end
end
