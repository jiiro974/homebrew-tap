# Homebrew formula pavault — coffre K/V chiffré age (X25519).
# Binaires pré-buildés servis publiquement par mini-1 (/pavault-releases),
# découplés du login de la forge. Bump auto : `make release` (ou workflow
# autoupdate sur tag v*).
class Pavault < Formula
  desc "Coffre K/V chiffré age (X25519) partagé pafw/oob-bastion"
  homepage "https://mini-1.tail5a7648.ts.net/pavault-releases/"
  version "0.1.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.9-darwin-arm64.tar.gz"
      sha256 "57cfa0f6864478a8a2b7b8dcf96465b9c263a8487a39fb7033ed7f5b63746b89" # darwin-arm64
    else
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.9-darwin-amd64.tar.gz"
      sha256 "771cc1c27530bda70fd935e5450c6f555631c0d4dc8f7654bb308575292ded1f" # darwin-amd64
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.9-linux-arm64.tar.gz"
      sha256 "1edb6729d0b825b3a8c9b85892718c4a3a6abe32a33d2ab0580b923d2f2adb7e" # linux-arm64
    else
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.9-linux-amd64.tar.gz"
      sha256 "7340e5aed5095c3ad5833754f54b5101cfa41c0e95fe30df9c369c58a9c54ead" # linux-amd64
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
