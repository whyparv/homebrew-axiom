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
      url "https://github.com/whyparv/homebrew-axiom/releases/download/v0.1.0/axiom-darwin-arm64.tar.gz"
      sha256 "20503443759a8422dc5f95fd42e2ade4aa02a27db43e66ed8478871f58ed8e98"
    end
    on_intel do
      url "https://github.com/whyparv/homebrew-axiom/releases/download/v0.1.0/axiom-darwin-amd64.tar.gz"
      sha256 "d6f006715ddefed21aa5f0105ac37ba3d1c4ade24d131e846907dad4faff9ff1"
    end
  end

  on_linux do
    url "https://github.com/whyparv/homebrew-axiom/releases/download/v0.1.0/axiom-linux-amd64.tar.gz"
    sha256 "0a6bb93767df66941bdc3602e97b9a08d9bda72480b4220918683b6d8e067963"
  end

  def install
    bin.install "axiom"
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/axiom version")
  end
end
