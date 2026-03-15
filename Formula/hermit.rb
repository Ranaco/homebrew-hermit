class Hermit < Formula
  desc "Hermit KMS — Secure secret management CLI"
  homepage "https://github.com/Ranaco/hermit"
  version "0.2.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Ranaco/hermit/releases/download/v#{version}/hermit-macos-arm64"
      sha256 "c115fd0741ee2126e32b742a69a0b5514952b19973acf88774d9f4e2fd05fb72"
    else
      url "https://github.com/Ranaco/hermit/releases/download/v#{version}/hermit-macos-x64"
      sha256 "448dca6edc9c2a3e6ea67a919f234656db962c4e414d9303397999620920ead4"
    end
  end

  on_linux do
    url "https://github.com/Ranaco/hermit/releases/download/v#{version}/hermit-linux-x64"
    sha256 "652b88dcf1d1307d08e3f9262b87834f2e6f2c6a1edf044f813abcf7146e25ec"
  end

  def install
    bin.install Dir["hermit*"].first => "hermit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hermit --version")
  end
end
