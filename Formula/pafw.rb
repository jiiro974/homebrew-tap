class Pafw < Formula
  desc "CLI tools for Palo Alto Networks firewalls"
  homepage "https://github.com/jiiro974/pafw-releases"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v0.1.0/pafw-darwin-arm64.tar.gz"
      sha256 "a33500ff83cbb47f6bad6e0f31a291fd5a720e82064a519b128fc3ee57b8bba5"

      def install
        bin.install Dir["pafw-darwin-arm64/*"]
      end
    end

    on_intel do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v0.1.0/pafw-darwin-amd64.tar.gz"
      sha256 "1662b8d83cb2a003ef2746882f578c0cb3e9fd0fd21bde7a7f346798017263d6"

      def install
        bin.install Dir["pafw-darwin-amd64/*"]
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v0.1.0/pafw-linux-arm64.tar.gz"
      sha256 "597df04ce3bc90be64e1cc47f87803301e75619dd2f39ebc063a7c32d23d934a"

      def install
        bin.install Dir["pafw-linux-arm64/*"]
      end
    end

    on_intel do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v0.1.0/pafw-linux-amd64.tar.gz"
      sha256 "1b6c20cf64e62cbbb17f7f096aea637c2180b178030dca24f718007e1a3a3bcf"

      def install
        bin.install Dir["pafw-linux-amd64/*"]
      end
    end
  end

  test do
    assert_match "pafw", shell_output("#{bin}/pafw --version")
  end
end
