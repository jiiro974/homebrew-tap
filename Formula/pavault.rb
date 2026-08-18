# Homebrew formula pavault — coffre K/V chiffré age (X25519).
# Binaires pré-buildés servis publiquement par mini-1 (/pavault-releases),
# découplés du login de la forge. Bump auto : `make release` (ou workflow
# autoupdate sur tag v*).
class Pavault < Formula
  desc "Coffre K/V chiffré age (X25519) partagé pafw/oob-bastion"
  homepage "https://mini-1.tail5a7648.ts.net/pavault-releases/"
  version "0.1.10"

  on_macos do
    if Hardware::CPU.arm?
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.10-darwin-arm64.tar.gz"
      sha256 "e7ce1c8f24940a46e471a58ec7967c64fcc20f8954c6b60231d94846b14e082c" # darwin-arm64
    else
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.10-darwin-amd64.tar.gz"
      sha256 "3cc33d8b69dc7b9c1e0c05d604580b0ae03b96104eff95ce8e522ecf91d4dc8c" # darwin-amd64
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.10-linux-arm64.tar.gz"
      sha256 "dc4b01af3824b6707d1b433a977530c2bf094390d871ba46e86b1a75d69ef41f" # linux-arm64
    else
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.10-linux-amd64.tar.gz"
      sha256 "a0506d62096f143e4ff7d02ec07c25d292551c84ddf05ee08b0ba91f06291c03" # linux-amd64
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
