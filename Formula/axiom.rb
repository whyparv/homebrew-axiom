# Homebrew formula for Axiom. Lives in the tap repo:
#   github.com/whyparv/homebrew-axiom  ->  Formula/axiom.rb
# Install:  brew install whyparv/axiom/axiom
# Fill in the sha256 values after a release is built (shasum -a 256 <asset>).
class Axiom < Formula
  desc "One CLI for shipping apps and driving software from agents"
  homepage "https://axiom.synquic.cloud"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/whyparv/homebrew-axiom/releases/download/v0.1.3/axiom-darwin-arm64.tar.gz"
      sha256 "44ae978f7675ee01d5e3974d329bd87872de2626131449ca2fc6ab96811fee63"
    end
    on_intel do
      url "https://github.com/whyparv/homebrew-axiom/releases/download/v0.1.3/axiom-darwin-amd64.tar.gz"
      sha256 "5a5ec4c556938958b035d3b539a28aeb051a2518eec87cd28fb6783317e01d7d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/whyparv/homebrew-axiom/releases/download/v0.1.3/axiom-linux-arm64.tar.gz"
      sha256 "7025f7ccd12c81908eef87e3d54c9eda31ddd5e131111715de86f70e44756e3d"
    end
    on_intel do
      url "https://github.com/whyparv/homebrew-axiom/releases/download/v0.1.3/axiom-linux-amd64.tar.gz"
      sha256 "b9e7f83aae04bd8cbf3b8e2b986e07ce301eb837b4e7d7d32a840975118fa840"
    end
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
        axiom hub            needs Python 3.10+:
                             pip install https://github.com/whyparv/homebrew-axiom/releases/latest/download/axiom_hub-0.4.1-py3-none-any.whl
        axiom phone android  needs adb           (brew install android-platform-tools)
        axiom build / phone  need macOS + Xcode
      axiom (ios, android) works on its own with no extra dependencies.
    EOS
  end

  test do
    assert_match "0.1.3", shell_output("#{bin}/axiom version")
  end
end
