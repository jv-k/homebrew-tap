class VerBump < Formula
  desc "Release tool for Git projects: SemVer bump, CHANGELOG, tag, push"
  homepage "https://github.com/jv-k/ver-bump"
  url "https://github.com/jv-k/ver-bump/archive/refs/tags/v2.0.1.tar.gz"
  sha256 "4a12bf8b620ab2225fdadb46bc3fb577cb3c118a0ba5be1da89f8e92d6da53f8"
  license "MIT"

  depends_on "bash"
  depends_on "jq"

  def install
    inreplace "ver-bump.sh", %r{\A#!/bin/bash}, "#!#{Formula["bash"].opt_bin}/bash"
    # ver-bump.sh resolves its real path (realpath), then sources lib/*.sh and
    # reads package.json from that directory — keep all three together.
    libexec.install "ver-bump.sh", "lib", "package.json"
    bin.install_symlink libexec/"ver-bump.sh" => "ver-bump"
  end

  test do
    assert_match "ver-bump #{version}", shell_output("#{bin}/ver-bump --version")
    system bin/"ver-bump", "--help"
  end
end
