class Chronos < Formula
  desc "Requirements modeling language and compiler for AI-assisted development"
  homepage "https://genairus.github.io/chronos/"
  license "Apache-2.0"
  version "0.2.0"

  on_macos do
    # Single ARM binary for all macOS — Intel Macs run it via Rosetta 2 (macOS 11+).
    url "https://github.com/Genairus/chronos/releases/download/v0.2.0/chronos-macos-aarch64.tar.gz"
    sha256 "b52066007870bb440f3be8c327394d371f1fb1afacdb9bd7090e47aab3f41bfb"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Genairus/chronos/releases/download/v0.2.0/chronos-linux-aarch64.tar.gz"
      sha256 "54ce4250a6ab50d31872d569ae5863c0794eb8524f72252a35e2608c44544588"
    else
      url "https://github.com/Genairus/chronos/releases/download/v0.2.0/chronos-linux-x86_64.tar.gz"
      sha256 "316dff8d9c46200c0b5c20fd83afd55d6296d2383113e5c5c56cf23461d89ed6"
    end
  end

  def install
    bin.install "chronos"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/chronos --version")
  end
end
