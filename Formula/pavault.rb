# Homebrew formula pavault — coffre K/V chiffré age (X25519).
# Binaires pré-buildés servis publiquement par mini-1 (/pavault-releases),
# découplés du login de la forge. Bump auto : `make release` (ou workflow
# autoupdate sur tag v*).
class Pavault < Formula
  desc "Coffre K/V chiffré age (X25519) partagé pafw/oob-bastion"
  homepage "https://mini-1.tail5a7648.ts.net/pavault-releases/"
  version "0.1.14"

  on_macos do
    if Hardware::CPU.arm?
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.14-darwin-arm64.tar.gz"
      sha256 "1365d66cb92920d4c08e92339c6f65820fa39b8d4e58b2b29bfeaf70d506e1f3" # darwin-arm64
    else
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.14-darwin-amd64.tar.gz"
      sha256 "b97c82e5b1a61b8029090f6f3a454e6e56b8779d1a836b685a12ff8766db5573" # darwin-amd64
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.14-linux-arm64.tar.gz"
      sha256 "3b968a2bb4c0c487b60573bee1af826fdba6ec0abc03911c6a40b0800717dc69" # linux-arm64
    else
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.14-linux-amd64.tar.gz"
      sha256 "6b9dbdb8f928ababd62d3ae6c29d490d9f684e5b0677e6f3de6db2179e2f8c57" # linux-amd64
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
