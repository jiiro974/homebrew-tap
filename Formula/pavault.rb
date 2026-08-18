# Homebrew formula pavault — coffre K/V chiffré age (X25519).
# Binaires pré-buildés servis publiquement par mini-1 (/pavault-releases),
# découplés du login de la forge. Bump auto : `make release` (ou workflow
# autoupdate sur tag v*).
class Pavault < Formula
  desc "Coffre K/V chiffré age (X25519) partagé pafw/oob-bastion"
  homepage "https://mini-1.tail5a7648.ts.net/pavault-releases/"
  version "0.1.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.7-darwin-arm64.tar.gz"
      sha256 "839cf1e9588577bb30a578f8959972b0e02b00bc72b0d275bc886ae439344373" # darwin-arm64
    else
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.7-darwin-amd64.tar.gz"
      sha256 "ba8b9745afb3653cb8ae5a29a4e204da05793e9ced970a80028cfc0c6dd32ac5" # darwin-amd64
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.7-linux-arm64.tar.gz"
      sha256 "3fa74371c5fbd16581bca2ee5a68023900703e142378769874f98f567598fec3" # linux-arm64
    else
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.7-linux-amd64.tar.gz"
      sha256 "0913307930e10420ed077b84f70899b7cfc55b94605c8899003ee80efe84c2da" # linux-amd64
    end
  end

  def install
    bin.install "pavault"
  end

  test do
    assert_match(/^pavault /, shell_output("#{bin}/pavault version"))
  end

  livecheck do
    url "https://mini-1.tail5a7648.ts.net/pavault-releases/version.txt"
    regex(/v?(\d+(?:\.\d+)+)/i)
  end
end
