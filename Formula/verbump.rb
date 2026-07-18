class Verbump < Formula
  desc "Release tool for Git projects: SemVer bump, CHANGELOG, tag, push"
  homepage "https://github.com/jv-k/VerBump"
  url "https://github.com/jv-k/VerBump/archive/refs/tags/v4.0.0.tar.gz"
  sha256 "5876d22ff89e1b3241c14c2bdcf54b0256b515e106b5ac5e021cab5dd5fe4e94"
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
