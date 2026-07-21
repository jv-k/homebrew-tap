class Deslopper < Formula
  include Language::Python::Virtualenv

  desc "Deterministic prose linter for the tells of machine-generated writing"
  homepage "https://github.com/jv-k/deslopper"
  # url and sha256 are rewritten by deslopper's release workflow on each tag.
  url "https://github.com/jv-k/deslopper/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "36e928122852110af6b7140608433dd608210e718f92b21d5b8f88fa74ef6c83"
  license "MIT"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
    generate_completions_from_executable(bin/"deslopper", "completions")
  end

  test do
    assert_match "deslopper #{version}", shell_output("#{bin}/deslopper --version")

    # A lint run must find the em-dash tell, proving the bundled presets shipped.
    (testpath/"sample.md").write("The fix was simple — restart the server.\n")
    output = shell_output("#{bin}/deslopper lint #{testpath}/sample.md", 1)
    assert_match "em-dash", output
  end
end
