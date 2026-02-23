class Chronos < Formula
  desc "Requirements modeling language and compiler for AI-assisted development"
  homepage "https://genairus.github.io/chronos/"
  license "Apache-2.0"
  version "0.1.0"

  on_macos do
    # Single ARM binary for all macOS — Intel Macs run it via Rosetta 2 (macOS 11+).
    url "https://github.com/Genairus/chronos/releases/download/v0.1.0/chronos-macos-aarch64.tar.gz"
    sha256 "ca2107a87dcb225b3be3a41154faf522e3c3420c3e32777917b96ba2a294b62f"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Genairus/chronos/releases/download/v0.1.0/chronos-linux-aarch64.tar.gz"
      sha256 "eee010abefa2a4024fdc90d2e1ee80f26b51f1c26d9f35435bcfa8be7f8b1d35"
    else
      url "https://github.com/Genairus/chronos/releases/download/v0.1.0/chronos-linux-x86_64.tar.gz"
      sha256 "54d14bdeb60be0279d6d3bf8bed63b75e921e91b69deb436a683135c7e3d4f6f"
    end
  end

  def install
    bin.install "chronos"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/chronos --version")
  end
end
