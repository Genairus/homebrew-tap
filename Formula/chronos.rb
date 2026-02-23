class Chronos < Formula
  desc "Requirements modeling language and compiler for AI-assisted development"
  homepage "https://genairus.github.io/chronos/"
  license "Apache-2.0"
  version "0.1.0"

  on_macos do
    # Single ARM binary for all macOS — Intel Macs run it via Rosetta 2 (macOS 11+).
    url "https://github.com/Genairus/chronos/releases/download/v0.1.0/chronos-macos-aarch64.tar.gz"
    sha256 "5d45a6bad9810a1b91d36d71c0cec57ff2647e5e997b2bc6ea0a5b78a43c3691"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Genairus/chronos/releases/download/v0.1.0/chronos-linux-aarch64.tar.gz"
      sha256 "4c215bea554452a3c7bcd541539bfa4d3b83f0112f404a462fb6b85d6e17f96b"
    else
      url "https://github.com/Genairus/chronos/releases/download/v0.1.0/chronos-linux-x86_64.tar.gz"
      sha256 "515a768685a75291f086426cfbdc40499bdb72647325c63a42836453125954a9"
    end
  end

  def install
    bin.install "chronos"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/chronos --version")
  end
end
