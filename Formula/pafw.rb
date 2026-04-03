class Pafw < Formula
  desc "CLI tools for Palo Alto Networks firewalls"
  homepage "https://github.com/jiiro974/pafw-releases"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v0.1.1/pafw-darwin-arm64.tar.gz"
      sha256 "4670d6f5c55ef1977bbe16a80e02e19abc00640867550e85188fe9d0870b0a21"
    end

    on_intel do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v0.1.1/pafw-darwin-amd64.tar.gz"
      sha256 "e336939fe8e874c868f13e5fa768647bc3939363ba4152a490acf6aa7afc5f85"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v0.1.1/pafw-linux-arm64.tar.gz"
      sha256 "c653353a04587737b3a3ac45784bae889301b4fa6312f870f475fb55dd883b1c"
    end

    on_intel do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v0.1.1/pafw-linux-amd64.tar.gz"
      sha256 "5be225b881807ccf3f5ed4c205466cda52c105ba91f99f545b1e323b5aced5c4"
    end
  end

  def install
    bin.install Dir["pa*"]
  end

  test do
    assert_match "v0.1.1", shell_output("#{bin}/pafw --version")
  end
end
