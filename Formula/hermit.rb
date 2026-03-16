class Hermit < Formula
  desc "Hermit KMS — Secure secret management CLI"
  homepage "https://github.com/Ranaco/hermit"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Ranaco/hermit/releases/download/v#{version}/hermit-macos-arm64"
      sha256 "af109e2c56a2959c03fc7f44e280b546b9823d275ac5981452ba6654aa346357"
    else
      url "https://github.com/Ranaco/hermit/releases/download/v#{version}/hermit-macos-x64"
      sha256 "77c6ea07ed0891d1eb9a9378ada281f395b0d88ff2b3edc0d0c6816730d233e1"
    end
  end

  on_linux do
    url "https://github.com/Ranaco/hermit/releases/download/v#{version}/hermit-linux-x64"
    sha256 "1272d0c4fd28b030b5c55b0e41a5cad39a79cd6c6c69d8a222e9e7fdee1f4219"
  end

  def install
    bin.install Dir["hermit*"].first => "hermit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hermit --version")
  end
end
