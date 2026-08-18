# Homebrew formula pavault — coffre K/V chiffré age (X25519).
# Binaires pré-buildés servis publiquement par mini-1 (/pavault-releases),
# découplés du login de la forge. Bump auto : `make release` (ou workflow
# autoupdate sur tag v*).
class Pavault < Formula
  desc "Coffre K/V chiffré age (X25519) partagé pafw/oob-bastion"
  homepage "https://mini-1.tail5a7648.ts.net/pavault-releases/"
  version "0.1.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.6-darwin-arm64.tar.gz"
      sha256 "70de11200a4b30ae32de1d8c09257e1fc14a5c8c9831ac3cf4c26d451e92ec35" # darwin-arm64
    else
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.6-darwin-amd64.tar.gz"
      sha256 "97c411dc630131b916c77fd87a5184093e568f9861e5d4d77abe243435d662cc" # darwin-amd64
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.6-linux-arm64.tar.gz"
      sha256 "3dd258107a25e463c0921df5d5a1643d4748084c0754d3e579de48b4bf211a75" # linux-arm64
    else
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.6-linux-amd64.tar.gz"
      sha256 "b27d71a70276d02faf68f4f7aaf4b8ed673faca5ee5544ec63f379684a474cdd" # linux-amd64
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
