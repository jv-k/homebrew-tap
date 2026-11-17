class Kryso < Formula
  desc "Command of KrysoWorks, which works a backlog while its maintainer is away"
  homepage "https://www.npmjs.com/package/kryso"
  # Placeholder release: the npm package only reserves the name and the kryso command.
  url "https://registry.npmjs.org/kryso/-/kryso-0.0.1.tgz"
  sha256 "a9a91d4dfb38db33feb4c9872d6c975d9b1b590fa85a6751d6687a002b537ab1"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match "kryso #{version} (placeholder)", shell_output("#{bin}/kryso --version")
  end
end
