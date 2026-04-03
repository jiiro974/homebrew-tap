class Pafw < Formula
  desc "CLI tools for Palo Alto Networks firewalls"
  homepage "https://github.com/jiiro974/pafw-releases"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v0.1.0/pafw-darwin-arm64.tar.gz"
      sha256 "1390ed0684d88ee0203761a0b90d0e724d2212cc4bc72b27433f41dd498bb202"
    end

    on_intel do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v0.1.0/pafw-darwin-amd64.tar.gz"
      sha256 "df18528e509bc912a23a73e8405de2f4e26fdacae365486dce7a391165f4cffb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v0.1.0/pafw-linux-arm64.tar.gz"
      sha256 "d91f7a11a2c46f93d05e5f1c667d53695495adc833e02be7f2276c9cbe1fd32e"
    end

    on_intel do
      url "https://github.com/jiiro974/pafw-releases/releases/download/v0.1.0/pafw-linux-amd64.tar.gz"
      sha256 "a3b1c04fc582223bbeee3e1d071924e7579b5f0f34e3123cbdca9e14641a2c9a"
    end
  end

  def install
    bin.install Dir["pa*"]
  end

  test do
    assert_match "pafw", shell_output("#{bin}/pafw --version")
  end
end
