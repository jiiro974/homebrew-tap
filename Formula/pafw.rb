class Pafw < Formula
  desc "CLI tools for Palo Alto Networks firewalls"
  homepage "https://github.com/jiiro974/pafw-releases"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v0.3.1/pafw-darwin-arm64.tar.gz"
      sha256 "34cd467300784d0d3da7d455a1fa8209c21f624b657f7fb7c8ed28c97e3d4d36"
    end
    on_intel do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v0.3.1/pafw-darwin-amd64.tar.gz"
      sha256 "aa9c24f103a20d31c0c46f76d793ead912285762896a2d9d6a6fe85e9cfdbba7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v0.3.1/pafw-linux-arm64.tar.gz"
      sha256 "50596fedb7e7206ff5658f1674f86cca3b0ec244b542e6213be1f21064c77265"
    end
    on_intel do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v0.3.1/pafw-linux-amd64.tar.gz"
      sha256 "05d2166989c6f741cd19ca8f00ab5451a72fc17a974067f3e683e784f1184139"
    end
  end

  def install
    bin.install "pafw"
    %w[paping patrace paif paroute paarp pasession pafib pacounter pacap pagp].each do |cmd|
      bin.install_symlink "pafw" => cmd
    end
    zsh_completion.install_script("pafw", "--completion", "zsh") rescue nil
  end

  def post_install
    # Generate completion if possible
    system "#{bin}/pafw", "completion", "zsh" rescue nil
  end

  test do
    assert_match "v0.3.1", shell_output("#{bin}/pafw --version")
    assert_match "v0.3.1", shell_output("#{bin}/paping --version")
  end
end
