# Homebrew formula — pafw (Pragma-TIC), sources et releases sur la forge
# Forgejo git.tail5a7648.ts.net/jro/pafw.
#
# Releases servies par le serveur de download indépendant (mini-1, public
# /pafw-releases), découplé du login de la forge.
class Pafw < Formula
  desc "CLI Palo Alto Networks (Pragma-TIC) — inventaire, PAN-OS, GlobalProtect, Panorama"
  homepage "https://mini-1.tail5a7648.ts.net/pafw-releases/"
  version "d1ea7c6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://mini-1.tail5a7648.ts.net/pafw-releases/pafw-d1ea7c6-darwin-arm64.tar.gz"
      sha256 "70cabf1ee6b4690ff38a3ecdd422760d6faa7e13ed06239ea1d9c6717bcb09e6"
    else
      url "https://mini-1.tail5a7648.ts.net/pafw-releases/pafw-d1ea7c6-darwin-amd64.tar.gz"
      sha256 "2ccb4c53f322bd67f4adaa16d46cca08e91dbe5c82b5d44f0d47d797a11da2d1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://mini-1.tail5a7648.ts.net/pafw-releases/pafw-d1ea7c6-linux-arm64.tar.gz"
      sha256 "5a718d89387b838645477b994e6c8fcc52c36fa8efb88089409449f81eece747"
    else
      url "https://mini-1.tail5a7648.ts.net/pafw-releases/pafw-d1ea7c6-linux-amd64.tar.gz"
      sha256 "9235083354201285a5dbf5d403289d791ca453ea82e9e19feeaf93d281e772c3"
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
