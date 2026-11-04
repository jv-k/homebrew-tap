class Deslopper < Formula
  include Language::Python::Virtualenv

  desc "Deterministic prose linter for the tells of machine-generated writing"
  homepage "https://github.com/jv-k/deslopper"
  # url and sha256 are rewritten by deslopper's release workflow on each tag.
  url "https://github.com/jv-k/deslopper/releases/download/v2.2.2/deslopper-2.2.2.tar.gz"
  sha256 "bab080714a39372d0e263cc4ca1035a7e1d1da6689ebb21d472941982607493c"
  license "MIT"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
    generate_completions_from_executable(bin/"deslopper", "completions")
  end

  test do
    # Bare version string: v1.0.0 prints "deslopper 1.0.0", later releases
    # render the help banner's pill, "deslopper v1.0.1".
    assert_match version.to_s, shell_output("#{bin}/deslopper --version")

    # A lint run must find the em-dash tell, proving the bundled presets shipped.
    (testpath/"sample.md").write("The fix was simple — restart the server.\n")
    output = shell_output("#{bin}/deslopper lint #{testpath}/sample.md", 1)
    assert_match "em-dash", output
  end
end
