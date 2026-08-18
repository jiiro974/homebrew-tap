# Homebrew formula pavault — coffre K/V chiffré age (X25519).
# Binaires pré-buildés servis publiquement par mini-1 (/pavault-releases),
# découplés du login de la forge. Bump auto : `make release` (ou workflow
# autoupdate sur tag v*).
class Pavault < Formula
  desc "Coffre K/V chiffré age (X25519) partagé pafw/oob-bastion"
  homepage "https://mini-1.tail5a7648.ts.net/pavault-releases/"
  version "0.1.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.2-darwin-arm64.tar.gz"
      sha256 "238df4236f8204c9198dafc158a9110a22e5100052579553fd61dc058473504d" # darwin-arm64
    else
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.2-darwin-amd64.tar.gz"
      sha256 "bb7c0cacaa1ba793d108a528e09a73c60b0e8ea19603327d32e3da40e9562a86" # darwin-amd64
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.2-linux-arm64.tar.gz"
      sha256 "e9fc99436f5a3fbcd1f54fb00195a551ee82c4db358b539b313df087c2a7c3f3" # linux-arm64
    else
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.2-linux-amd64.tar.gz"
      sha256 "edb9f5fa3c4e4a17b653b6fc9a2f28fec6689f9c2755ee89b83d7364d783938c" # linux-amd64
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
