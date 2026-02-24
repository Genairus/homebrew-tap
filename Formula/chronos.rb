class Chronos < Formula
  desc "Requirements modeling language and compiler for AI-assisted development"
  homepage "https://genairus.github.io/chronos/"
  license "Apache-2.0"
  version "0.2.0"

  on_macos do
    # Single ARM binary for all macOS — Intel Macs run it via Rosetta 2 (macOS 11+).
    url "https://github.com/Genairus/chronos/releases/download/v0.2.0/chronos-macos-aarch64.tar.gz"
    sha256 "ea19a6cb08337adeba3981ea61811af3c6e41a492fcb72ea85e6d2799b786044"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Genairus/chronos/releases/download/v0.2.0/chronos-linux-aarch64.tar.gz"
      sha256 "76c4cfb818a8884a2b0cda1dad9884eeafe7dfc34de1de03392952c99837a0c0"
    else
      url "https://github.com/Genairus/chronos/releases/download/v0.2.0/chronos-linux-x86_64.tar.gz"
      sha256 "859edaf0036964a87a89afc700980b0af625f91dee84abf23d7af95e393df3e0"
    end
  end

  def install
    bin.install "chronos"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/chronos --version")
  end
end
