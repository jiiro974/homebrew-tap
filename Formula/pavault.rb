# Homebrew formula pavault — coffre K/V chiffré age (X25519).
# Binaires pré-buildés servis publiquement par mini-1 (/pavault-releases),
# découplés du login de la forge. Bump auto : `make release` (ou workflow
# autoupdate sur tag v*).
class Pavault < Formula
  desc "Coffre K/V chiffré age (X25519) partagé pafw/oob-bastion"
  homepage "https://mini-1.tail5a7648.ts.net/pavault-releases/"
  version "0.1.12"

  on_macos do
    if Hardware::CPU.arm?
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.12-darwin-arm64.tar.gz"
      sha256 "17d551aef1c5e1502722e390cb77efca996092c7f6219f3b92d6aee1b0b8b1ce" # darwin-arm64
    else
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.12-darwin-amd64.tar.gz"
      sha256 "443ab996096f2c9228ec782653ac31c05e5326b13ff9166923595652aa7ef6f6" # darwin-amd64
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.12-linux-arm64.tar.gz"
      sha256 "36487ffa9d50d3f40322d9adbc12aaabe7ceb74b7998d353a4f58068e01a6d54" # linux-arm64
    else
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.12-linux-amd64.tar.gz"
      sha256 "0373837c188a9f8c85a39e734369e32b97ec427dcd646449ef59e6f5326e5a7e" # linux-amd64
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
