# Homebrew formula for Axiom. Lives in the tap repo:
#   github.com/whyparv/homebrew-axiom  ->  Formula/axiom.rb
# Install:  brew install whyparv/axiom/axiom
# Fill in the sha256 values after a release is built (shasum -a 256 <asset>).
class Axiom < Formula
  desc "One CLI for shipping apps and driving software from agents"
  homepage "https://axiom.synquic.cloud"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/whyparv/homebrew-axiom/releases/download/v0.1.2/axiom-darwin-arm64.tar.gz"
      sha256 "f7960de806d5f04b376d12c18bdfb345e6d1299108e71fa2a5d07f775a6f8b78"
    end
    on_intel do
      url "https://github.com/whyparv/homebrew-axiom/releases/download/v0.1.2/axiom-darwin-amd64.tar.gz"
      sha256 "d41da51748c5e2522ec5f14a633fbecc53da667a8d91ef97ba4b4c015feeb086"
    end
  end

  on_linux do
    url "https://github.com/whyparv/homebrew-axiom/releases/download/v0.1.2/axiom-linux-amd64.tar.gz"
    sha256 "2a489445eec6ee41f9761d9011dc376325c1d73c3cc3a22d158f20aef65ab812"
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
    assert_match "0.1.2", shell_output("#{bin}/axiom version")
  end
end
