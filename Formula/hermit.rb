class Hermit < Formula
  desc "Hermit KMS — Secure secret management CLI"
  homepage "https://github.com/Ranaco/hermit"
  version "0.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Ranaco/hermit/releases/download/v#{version}/hermit-macos-arm64"
      sha256 "5b95d0babb710c250af534bbeb81863776d16cc781ea7ddeaf5a526d2f05bf9d"
    else
      url "https://github.com/Ranaco/hermit/releases/download/v#{version}/hermit-macos-x64"
      sha256 "54f048211663cb7a9d781084fc9bace0480772d0ddc5d053708d743053cd8c1a"
    end
  end

  on_linux do
    url "https://github.com/Ranaco/hermit/releases/download/v#{version}/hermit-linux-x64"
    sha256 "797e5d31934ac6066c39f09bfd2acb45b8a1b50897368913e7ba1031e2dda36d"
  end

  def install
    bin.install Dir["hermit*"].first => "hermit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hermit --version")
  end
end
