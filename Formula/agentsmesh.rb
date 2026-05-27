class Agentsmesh < Formula
  desc "One .agentsmesh/ directory for every AI coding tool"
  homepage "https://github.com/sampleXbro/agentsmesh"
  url "https://registry.npmjs.org/agentsmesh/-/agentsmesh-0.20.0.tgz"
  sha256 "1a399de87f80b102a0bfbd2aa4d80f84dd72881b1f34b1be4bf630841d9f9685"
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
