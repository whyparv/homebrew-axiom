# Homebrew formula for Axiom. Lives in the tap repo:
#   github.com/whyparv/homebrew-axiom  ->  Formula/axiom.rb
# Install:  brew install whyparv/axiom/axiom
# Fill in the sha256 values after a release is built (shasum -a 256 <asset>).
class Axiom < Formula
  desc "One CLI for shipping apps and driving software from agents"
  homepage "https://axiom.synquic.cloud"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/whyparv/homebrew-axiom/releases/download/v0.1.1/axiom-darwin-arm64.tar.gz"
      sha256 "6302396964d578f253d7cba917c79970505ffdcf6737d289ad26be1d79d71218"
    end
    on_intel do
      url "https://github.com/whyparv/homebrew-axiom/releases/download/v0.1.1/axiom-darwin-amd64.tar.gz"
      sha256 "71628fdf7e5d74b5065e16e23a4c1a077f93b19bab6dc79d083506c29b2d3470"
    end
  end

  on_linux do
    url "https://github.com/whyparv/homebrew-axiom/releases/download/v0.1.1/axiom-linux-amd64.tar.gz"
    sha256 "f6a4cb38849d64a06989da0568f4f5a8ba9f2687e94ca2cff2b220221d65c667"
  end

  # axiom itself is a self-contained binary (no Go or Rust needed at runtime).
  # Python is pulled in for the optional `axiom hub` area.
  depends_on "python@3.12"

  def install
    bin.install "axiom"
  end

  def caveats
    <<~EOS
      Optional components and their dependencies:
        axiom hub            needs Python 3.10+  (pip install axiom-hub)
        axiom phone android  needs adb           (brew install android-platform-tools)
        axiom build / phone  need macOS + Xcode
      axiom (ios, android) works on its own with no extra dependencies.
    EOS
  end

  test do
    assert_match "0.1.1", shell_output("#{bin}/axiom version")
  end
end
