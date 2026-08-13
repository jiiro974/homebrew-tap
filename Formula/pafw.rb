# Homebrew formula — pafw (Pragma-TIC), sources et releases sur la forge
# Forgejo git.tail5a7648.ts.net/jro/pafw.
#
# Releases servies par le serveur de download indépendant (mini-1, public
# /pafw-releases), découplé du login de la forge.
class Pafw < Formula
  desc "CLI Palo Alto Networks (Pragma-TIC) — inventaire, PAN-OS, GlobalProtect, Panorama"
  homepage "https://mini-1.tail5a7648.ts.net/pafw-releases/"
  version "dcb3813"

  on_macos do
    if Hardware::CPU.arm?
      url "https://mini-1.tail5a7648.ts.net/pafw-releases/pafw-dcb3813-darwin-arm64.tar.gz"
      sha256 "f3238801eda1db72c09752232f20d6536c80c66f86b69223a4ed806c0819d63f"
    else
      url "https://mini-1.tail5a7648.ts.net/pafw-releases/pafw-dcb3813-darwin-amd64.tar.gz"
      sha256 "5bb7d3614ac751b6146e798d10ab255b5fcaf3e347e05f7bd2e94116bcbccc54"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://mini-1.tail5a7648.ts.net/pafw-releases/pafw-dcb3813-linux-arm64.tar.gz"
      sha256 "c723c3728d28a453f52da00ae562d16a49d3e196815418929bec50af5f38bfc3"
    else
      url "https://mini-1.tail5a7648.ts.net/pafw-releases/pafw-dcb3813-linux-amd64.tar.gz"
      sha256 "1d7ad8f609a96fe800a80259e9dd16e022aa5d5ddf39f5cf9bd2b6bdbc27b44f"
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
