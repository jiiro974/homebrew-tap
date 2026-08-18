# Homebrew formula pavault — coffre K/V chiffré age (X25519).
# Binaires pré-buildés servis publiquement par mini-1 (/pavault-releases),
# découplés du login de la forge. Bump auto : `make release` (ou workflow
# autoupdate sur tag v*).
class Pavault < Formula
  desc "Coffre K/V chiffré age (X25519) partagé pafw/oob-bastion"
  homepage "https://mini-1.tail5a7648.ts.net/pavault-releases/"
  version "0.1.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.3-darwin-arm64.tar.gz"
      sha256 "d611f2879587a2576eab8089cacaa83dbfd2907b5ec3f60c094599390ad0ac63" # darwin-arm64
    else
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.3-darwin-amd64.tar.gz"
      sha256 "477ed78f1b5d2ca3fd6c96b92a719633a32ab2123aa2f736b75940eb9a441681" # darwin-amd64
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.3-linux-arm64.tar.gz"
      sha256 "278d593e618a60d21cee316342bcfb731d839e796387154eee2f420aadc25c88" # linux-arm64
    else
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.3-linux-amd64.tar.gz"
      sha256 "13b923a52968da3b48a22ee7c42ac445d7ed826eb5598bc45fd5eb5204d8a1f4" # linux-amd64
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
