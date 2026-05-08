class Agentsmesh < Formula
  desc "One .agentsmesh/ directory for every AI coding tool"
  homepage "https://github.com/sampleXbro/agentsmesh"
  url "https://registry.npmjs.org/agentsmesh/-/agentsmesh-0.15.0.tgz"
  sha256 "0380af4f2312bb60aace43292554f75a36cb4a63a7d59aafec5247ed00213a7f"
  license "MIT"

  depends_on "node"

  livecheck do
    url "https://registry.npmjs.org/agentsmesh/latest"
    regex(/"version"\s*:\s*"([^"]+)"/i)
  end

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    system bin/"agentsmesh", "init", "--yes"
    assert_path_exists testpath/".agentsmesh/rules/_root.md"
    assert_path_exists testpath/"agentsmesh.yaml"
  end
end
