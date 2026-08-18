# Homebrew formula pavault — coffre K/V chiffré age (X25519).
# Binaires pré-buildés servis publiquement par mini-1 (/pavault-releases),
# découplés du login de la forge. Bump auto : `make release` (ou workflow
# autoupdate sur tag v*).
class Pavault < Formula
  desc "Coffre K/V chiffré age (X25519) partagé pafw/oob-bastion"
  homepage "https://mini-1.tail5a7648.ts.net/pavault-releases/"
  version "0.1.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.4-darwin-arm64.tar.gz"
      sha256 "5e2bb0e0a8749b6bbe7811ce3043647468dde0a908906501528a5429e776ebc8" # darwin-arm64
    else
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.4-darwin-amd64.tar.gz"
      sha256 "1212347e49d06bfd9464580b62534363a323f260d53478df1969dbdce2dbc171" # darwin-amd64
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.4-linux-arm64.tar.gz"
      sha256 "f3be496873f9c03d8fba8dc929b0154a5169e93763e65abad7101ed8390bba92" # linux-arm64
    else
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.4-linux-amd64.tar.gz"
      sha256 "1cf8c1b7d7211cd28e80e946ba0292b2b8cb8cc049fd3a0ad7c4a18e3954dcf6" # linux-amd64
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
