# Homebrew formula pavault — coffre K/V chiffré age (X25519).
# Binaires pré-buildés servis publiquement par mini-1 (/pavault-releases),
# découplés du login de la forge. Bump auto : `make release` (ou workflow
# autoupdate sur tag v*).
class Pavault < Formula
  desc "Coffre K/V chiffré age (X25519) partagé pafw/oob-bastion"
  homepage "https://mini-1.tail5a7648.ts.net/pavault-releases/"
  version "0.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.1-darwin-arm64.tar.gz"
      sha256 "a7083d540e03289440d62f1c8b65ae1322af1d2856d56b6d920eae148697af1d" # darwin-arm64
    else
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.1-darwin-amd64.tar.gz"
      sha256 "99dc67aaab1065b284f34ebc0686f548c36bccf0adad12f6370bffdd21dd2593" # darwin-amd64
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.1-linux-arm64.tar.gz"
      sha256 "d02f6423a0ca604cc422bb7ca2ac6beb808c90948efd4e64376e725ef165b81e" # linux-arm64
    else
      url "https://mini-1.tail5a7648.ts.net/pavault-releases/pavault-v0.1.1-linux-amd64.tar.gz"
      sha256 "4e3037e0b0ba13549ba060632b291a506b15f0d97dbb57460e4f5f165baf4946" # linux-amd64
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
