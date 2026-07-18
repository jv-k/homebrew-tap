class Verbump < Formula
  desc "Release tool for Git projects: SemVer bump, CHANGELOG, tag, push"
  homepage "https://github.com/jv-k/VerBump"
  url "https://github.com/jv-k/VerBump/archive/refs/tags/v3.0.0.tar.gz"
  sha256 "e200ef2aa7bb604ab55ee9165e4c697edb50a4dbd07ef4755e9a798a7f1514b9"
  license "MIT"

  depends_on "bash"
  depends_on "jq"

  def install
    inreplace "ver-bump.sh", %r{\A#!/bin/bash}, "#!#{formula_opt_bin("bash")}/bash"
    # ver-bump.sh resolves its real path (realpath), then sources lib/*.sh and
    # reads package.json from that directory — keep all three together.
    libexec.install "ver-bump.sh", "lib", "package.json"
    # The 3.0 rebrand names the command VerBump (the npm bin entry does the
    # same); the npm package and main script keep the historical ver-bump name.
    bin.install_symlink libexec/"ver-bump.sh" => "VerBump"
  end

  test do
    assert_match "VerBump #{version}", shell_output("#{bin}/VerBump --version")
    system bin/"VerBump", "--help"
  end
end
