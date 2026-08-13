# Homebrew formula — pafw (Pragma-TIC), sources et releases sur la forge
# Forgejo git.tail5a7648.ts.net/jro/pafw.
#
# Releases servies par le serveur de download indépendant (mini-1, public
# /pafw-releases), découplé du login de la forge.
class Pafw < Formula
  desc "CLI Palo Alto Networks (Pragma-TIC) — inventaire, PAN-OS, GlobalProtect, Panorama"
  homepage "https://mini-1.tail5a7648.ts.net/pafw-releases/"
  version "11961c3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://mini-1.tail5a7648.ts.net/pafw-releases/pafw-11961c3-darwin-arm64.tar.gz"
      sha256 "194d367be894d7ada80096df273655d249a36f7163a09957d6d99e71a31ab72c"
    else
      url "https://mini-1.tail5a7648.ts.net/pafw-releases/pafw-11961c3-darwin-amd64.tar.gz"
      sha256 "077f592f0c544f9b4845aed535be7df982929728c6b45e0a385faf6848841c32"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://mini-1.tail5a7648.ts.net/pafw-releases/pafw-11961c3-linux-arm64.tar.gz"
      sha256 "2f5c1d111631f6fe5bf8aec5e3e53e6f9f3a09bc71aa92f25fe7bb177fdd7150"
    else
      url "https://mini-1.tail5a7648.ts.net/pafw-releases/pafw-11961c3-linux-amd64.tar.gz"
      sha256 "5a1815d524a4b5505856edcd2830bd32f752dad266166451d4a55442b539233e"
    end
  end

  def install
    bin.install "pafw"
    %w[paping patrace paif paroute paarp pasession pafib pacounter pacap pagp palog
       pavpn paaudit parules papano pacluster].each do |link|
      bin.install_symlink "pafw" => link
    end
  end

  test do
    assert_match "pafw", shell_output("#{bin}/pafw version")
  end
end
