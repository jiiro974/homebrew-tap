# Homebrew formula pavault — coffre K/V chiffré age (X25519).
# Binaires pré-buildés servis publiquement par mini-1 (/pavault-releases),
# découplés du login de la forge. Bump auto : `make release` (ou workflow
# autoupdate sur tag v*).
class Pavault < Formula
  desc "Coffre K/V chiffré age (X25519) partagé pafw/oob-bastion"
  homepage "https://mini-1.tail5a7648.ts.net/pavault-releases/"
  version "0.1.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.5-darwin-arm64.tar.gz"
      sha256 "e6c9516ce9d01c791405de320e0ab0f4793dc21763a83bcbf83d5d94f6b27b09" # darwin-arm64
    else
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.5-darwin-amd64.tar.gz"
      sha256 "a02b9fc890b2b21fa31a6167a77757cee123bd3d51a5de289efba064fc716f7a" # darwin-amd64
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.5-linux-arm64.tar.gz"
      sha256 "a3c6dd979a0c89a2035fe5fd1f670ca0dd99b1eec1cf76370faa2a1ce4cf0f75" # linux-arm64
    else
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.5-linux-amd64.tar.gz"
      sha256 "52c78aaf3e774b87d5a65bd0f3ad2bd40f4f4121aadc8ae85062ed94a6dff50d" # linux-amd64
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
