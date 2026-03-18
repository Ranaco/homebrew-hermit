class Hermit < Formula
  desc "Hermit KMS — Secure secret management CLI"
  homepage "https://github.com/Ranaco/hermit"
  version "0.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Ranaco/hermit/releases/download/v#{version}/hermit-macos-arm64"
      sha256 "988eab9e876936214dd46cda385946e84ca4217bbfdfdd38c7ad838ac736d002"
    else
      url "https://github.com/Ranaco/hermit/releases/download/v#{version}/hermit-macos-x64"
      sha256 "cccaca9741f230afc2c9860bac23a872418987ada8e522780dc2d32eae104011"
    end
  end

  on_linux do
    url "https://github.com/Ranaco/hermit/releases/download/v#{version}/hermit-linux-x64"
    sha256 "58c964dceb4932b0bc457069da1ad707997c01e4bae6f2cba7c3702b67dcc38f"
  end

  def install
    bin.install Dir["hermit*"].first => "hermit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hermit --version")
  end
end
