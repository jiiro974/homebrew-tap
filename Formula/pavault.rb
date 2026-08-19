# Homebrew formula pavault — coffre K/V chiffré age (X25519).
# Binaires pré-buildés servis publiquement par mini-1 (/pavault-releases),
# découplés du login de la forge. Bump auto : `make release` (ou workflow
# autoupdate sur tag v*).
class Pavault < Formula
  desc "Coffre K/V chiffré age (X25519) partagé pafw/oob-bastion"
  homepage "https://mini-1.tail5a7648.ts.net/pavault-releases/"
  version "0.1.16"

  on_macos do
    if Hardware::CPU.arm?
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.16-darwin-arm64.tar.gz"
      sha256 "c77b0455f99a3acc48d91d26689b98367748c16ee5c7da373b9c60cfd6d48539" # darwin-arm64
    else
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.16-darwin-amd64.tar.gz"
      sha256 "caec9ff8be1c9715f8884afc7c51f4afa3a5596149cc36c2eb5f129a94fffaa2" # darwin-amd64
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.16-linux-arm64.tar.gz"
      sha256 "584cc227cf5d1d7764380dcadf0ad8a798902d7c92ebf87fa498129eabdeb468" # linux-arm64
    else
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.16-linux-amd64.tar.gz"
      sha256 "46ead49d7857164dce3571a799fa064f3c675d3f17612533e7ad9d9fbdf500a3" # linux-amd64
    end
  end

  def install
    bin.install "pavault"
    bin.install "vaultfs"
  end

  test do
    assert_match(/^pavault /, shell_output("#{bin}/pavault version"))
    assert_predicate bin/"vaultfs", :exist?
  end

  livecheck do
    url "https://mini-1.tail5a7648.ts.net/pavault-releases/version.txt"
    regex(/v?(\d+(?:\.\d+)+)/i)
  end
end
