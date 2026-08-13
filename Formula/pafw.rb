# Homebrew formula — pafw (Pragma-TIC), sources et releases sur la forge
# Forgejo git.tail5a7648.ts.net/jro/pafw.
#
# Releases servies par le serveur de download indépendant (mini-1, public
# /pafw-releases), découplé du login de la forge.
class Pafw < Formula
  desc "CLI Palo Alto Networks (Pragma-TIC) — inventaire, PAN-OS, GlobalProtect, Panorama"
  homepage "https://mini-1.tail5a7648.ts.net/pafw-releases/"
  version "0.6.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://mini-1.tail5a7648.ts.net/pafw-releases/pafw-darwin-arm64.tar.gz"
      sha256 "2364d82a425f59287185d3a195455580406494ed61f417459940448445eaaa6f"
    else
      url "https://mini-1.tail5a7648.ts.net/pafw-releases/pafw-darwin-amd64.tar.gz"
      sha256 "b0528a731930e391aac685807c918d9c322b81520a7239a839a0cc8d65bfc966"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://mini-1.tail5a7648.ts.net/pafw-releases/pafw-linux-arm64.tar.gz"
      sha256 "644c25049439f9bb2a00453be303951a3409671647f28bcf568ff91b9e06606a"
    else
      url "https://mini-1.tail5a7648.ts.net/pafw-releases/pafw-linux-amd64.tar.gz"
      sha256 "f41e91686069b2f60d455f17ad2b1014e47c0f3346d799a490c43173578d2034"
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
