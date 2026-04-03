class Pafw < Formula
  desc "CLI tools for Palo Alto Networks firewalls"
  homepage "https://github.com/jiiro974/pafw-releases"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v0.3.0/pafw-darwin-arm64.tar.gz"
      sha256 "20f658a8c0d41cbf001b743cba24818b876ec0748a2be9c2b4aa3a3feb296265"
    end
    on_intel do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v0.3.0/pafw-darwin-amd64.tar.gz"
      sha256 "fc437e0014591e37ccb6efdac70aa832dab6ff34d356750f16bf6194368fe0a2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v0.3.0/pafw-linux-arm64.tar.gz"
      sha256 "029954d101b934a392bf0fcc99655ed8d4bd40fa3017b1f690acebec09d9044a"
    end
    on_intel do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v0.3.0/pafw-linux-amd64.tar.gz"
      sha256 "87073525626f423501a5ce2369ad0196e67a143c6e1de914289aec11d2c2eb22"
    end
  end

  def install
    bin.install Dir["pa*"]
  end

  test do
    assert_match "v0.3.0", shell_output("#{bin}/pafw --version")
  end
end
