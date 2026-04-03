class Pafw < Formula
  desc "CLI tools for Palo Alto Networks firewalls"
  homepage "https://github.com/jiiro974/pafw-releases"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v0.3.0/pafw-darwin-arm64.tar.gz"
      sha256 "13b1484c96c1d40daa72264a346da68d8d29b4ad63aab7c716abdc5626103de0"
    end
    on_intel do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v0.3.0/pafw-darwin-amd64.tar.gz"
      sha256 "e05a6eacb34775ab2f0eba3919d61f91e8ff8ed2d710e90805bc698610f280e8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v0.3.0/pafw-linux-arm64.tar.gz"
      sha256 "67d59ee291a8e36e21610d64e1a4b56995f2d40ee4838eb2d391b22366d02a03"
    end
    on_intel do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v0.3.0/pafw-linux-amd64.tar.gz"
      sha256 "203c50e6e88bff20ed90705e8a73415fcd7b0895c5b3825148c591d53d73cf47"
    end
  end

  def install
    bin.install Dir["pa*"]
  end

  test do
    assert_match "v0.3.0", shell_output("#{bin}/pafw --version")
  end
end
