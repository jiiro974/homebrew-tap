# Homebrew formula — pafw (Pragma-TIC), sources et releases sur la forge
# Forgejo git.tail5a7648.ts.net/jro/pafw.
#
# Releases servies par le serveur de download indépendant (mini-1, public
# /pafw-releases), découplé du login de la forge.
class Pafw < Formula
  desc "CLI Palo Alto Networks (Pragma-TIC) — inventaire, PAN-OS, GlobalProtect, Panorama"
  homepage "https://mini-1.tail5a7648.ts.net/pafw-releases/"
  version "91f9890"

  on_macos do
    if Hardware::CPU.arm?
      url "https://mini-1.tail5a7648.ts.net/pafw-releases/pafw-91f9890-darwin-arm64.tar.gz"
      sha256 "0148fcf9a945b7e215cff2b25f7072c6a028835096e5b146676fc1a1dfa1221d"
    else
      url "https://mini-1.tail5a7648.ts.net/pafw-releases/pafw-91f9890-darwin-amd64.tar.gz"
      sha256 "618797b9fa86ed06091992cc2e9f07915dd85a24f9f7b2b1732bfc96c0c97d7a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://mini-1.tail5a7648.ts.net/pafw-releases/pafw-91f9890-linux-arm64.tar.gz"
      sha256 "2384bac76e5136b4a528d9eed8310667edb403cfe5ba4897dbfb494be8e78a16"
    else
      url "https://mini-1.tail5a7648.ts.net/pafw-releases/pafw-91f9890-linux-amd64.tar.gz"
      sha256 "a049a18bfb7544e5a20c5a93f43fa6234578f09a69f20b8497a9976150a121c5"
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
