class Hermit < Formula
  desc "Hermit KMS — Secure secret management CLI"
  homepage "https://github.com/Ranaco/hermit"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Ranaco/hermit/releases/download/v#{version}/hermit-macos-arm64"
      sha256 "a0be3f7ad4bf738eb528dc82bf38bbe7483ff65fd052091bb07661c449d507f2"
    else
      url "https://github.com/Ranaco/hermit/releases/download/v#{version}/hermit-macos-x64"
      sha256 "73603faf90ff95679aeff8eb662ed94c22e2787e633bfe679b4741d65725a06d"
    end
  end

  on_linux do
    url "https://github.com/Ranaco/hermit/releases/download/v#{version}/hermit-linux-x64"
    sha256 "3a7a0bad70d8301c74bf83ebef4701f500aff0bf507f8411a72247a169b7b58f"
  end

  def install
    bin.install Dir["hermit*"].first => "hermit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hermit --version")
  end
end
