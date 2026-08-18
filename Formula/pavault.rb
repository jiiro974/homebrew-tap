# Homebrew formula pavault — coffre K/V chiffré age (X25519).
# Binaires pré-buildés servis publiquement par mini-1 (/pavault-releases),
# découplés du login de la forge. Bump auto : `make release` (ou workflow
# autoupdate sur tag v*).
class Pavault < Formula
  desc "Coffre K/V chiffré age (X25519) partagé pafw/oob-bastion"
  homepage "https://mini-1.tail5a7648.ts.net/pavault-releases/"
  version "0.1.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.8-darwin-arm64.tar.gz"
      sha256 "0f547316ac0896f2741d1d7a48763f4dcae234a6c8152ee4ff120412a2a9f106" # darwin-arm64
    else
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.8-darwin-amd64.tar.gz"
      sha256 "303aa8e6a33b1b6c46c7edc4c93720d706cef202c482236b5b937ba455a04d68" # darwin-amd64
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.8-linux-arm64.tar.gz"
      sha256 "49bde9bad1884b3efbf75805dba51958a0ba6755e4a22bf610fbe815412d5e15" # linux-arm64
    else
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.8-linux-amd64.tar.gz"
      sha256 "2ea8ff16ce6c8421b2d131126dbda4ce261a1bbaac5639ea1ed309eb265eef06" # linux-amd64
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
