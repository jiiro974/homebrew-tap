# Homebrew formula pavault — coffre K/V chiffré age (X25519).
# Binaires pré-buildés servis publiquement par mini-1 (/pavault-releases),
# découplés du login de la forge. Bump auto : `make release` (ou workflow
# autoupdate sur tag v*).
class Pavault < Formula
  desc "Coffre K/V chiffré age (X25519) partagé pafw/oob-bastion"
  homepage "https://mini-1.tail5a7648.ts.net/pavault-releases/"
  version "0.1.13"

  on_macos do
    if Hardware::CPU.arm?
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.13-darwin-arm64.tar.gz"
      sha256 "f942cb0624b07ad94849f4df24e28862ad78d75939dab9205b7a5175cd55304d" # darwin-arm64
    else
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.13-darwin-amd64.tar.gz"
      sha256 "baad50428a6f866d6298effa4d7f5db61dbd38f88bb4f11fc6e739dc6e91a723" # darwin-amd64
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.13-linux-arm64.tar.gz"
      sha256 "072309cc96dce4f1d8588f5e9924fd2c69e6bdfa58e73eaad42b63e574a29fae" # linux-arm64
    else
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.13-linux-amd64.tar.gz"
      sha256 "f26208a153248d463dbb9f0a157ecd998567b4d1cd2f2592ef007a490a8af611" # linux-amd64
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
