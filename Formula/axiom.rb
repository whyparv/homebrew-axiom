# Homebrew formula for Axiom. Lives in the tap repo:
#   github.com/whyparv/homebrew-axiom  ->  Formula/axiom.rb
# Install:  brew install whyparv/axiom/axiom
# Fill in the sha256 values after a release is built (shasum -a 256 <asset>).
class Axiom < Formula
  desc "One CLI for shipping apps and driving software from agents"
  homepage "https://axiom.synquic.cloud"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://axiom.synquic.cloud/download/v0.1.0/axiom-darwin-arm64.tar.gz"
      sha256 "REPLACE_WITH_DARWIN_ARM64_SHA256"
    end
    on_intel do
      url "https://axiom.synquic.cloud/download/v0.1.0/axiom-darwin-amd64.tar.gz"
      sha256 "REPLACE_WITH_DARWIN_AMD64_SHA256"
    end
  end

  on_linux do
    url "https://axiom.synquic.cloud/download/v0.1.0/axiom-linux-amd64.tar.gz"
    sha256 "REPLACE_WITH_LINUX_AMD64_SHA256"
  end

  def install
    bin.install "axiom"
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/axiom version")
  end
end
