class Agentsmesh < Formula
  desc "One .agentsmesh/ directory for every AI coding tool"
  homepage "https://github.com/sampleXbro/agentsmesh"
  url "https://registry.npmjs.org/agentsmesh/-/agentsmesh-0.30.1.tgz"
  sha256 "c5b5dcc3a9e4be679dcc6a9c3fea3dd43e0f3c59890e050be0725153c9a2c47d"
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
