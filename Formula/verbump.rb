class Verbump < Formula
  desc "Release tool for Git projects: SemVer bump, CHANGELOG, tag, push"
  homepage "https://github.com/jv-k/VerBump"
  url "https://github.com/jv-k/VerBump/archive/refs/tags/v4.0.2.tar.gz"
  sha256 "82ce197645147bf2f920afda82cee9a53c9822ec093807f9d6bc6cdb082ab0de"
  license "MIT"

  depends_on "bash"
  depends_on "jq"

  def install
    inreplace "VerBump.sh", %r{\A#!/bin/bash}, "#!#{formula_opt_bin("bash")}/bash"
    # VerBump.sh resolves its real path (realpath), then sources lib/*.sh and
    # reads package.json from that directory — keep all three together.
    libexec.install "VerBump.sh", "lib", "package.json"
    bin.install_symlink libexec/"VerBump.sh" => "VerBump"
  end

  test do
    assert_match "VerBump #{version}", shell_output("#{bin}/VerBump --version")
    system bin/"VerBump", "--help"
  end
end
