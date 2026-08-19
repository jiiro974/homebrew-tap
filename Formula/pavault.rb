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
      sha256 "2b3e39c38e912f443ef5d82ed21f22a0dc8fbe2bddd49bd61e5ab5a277033d60" # darwin-arm64
    else
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.12-darwin-amd64.tar.gz"
      sha256 "46face99b6ea4265a118a9a3afd05a23939efd95201d10c12ae2030e53dc92f7" # darwin-amd64
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.12-linux-arm64.tar.gz"
      sha256 "621201577c8265168b4bba32c35d0faff331119b4b62599775384f18e647dab7" # linux-arm64
    else
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.12-linux-amd64.tar.gz"
      sha256 "d51b36c32cf3937b3a62c1b412a669296f6d138633c95016c216787c332664d0" # linux-amd64
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
