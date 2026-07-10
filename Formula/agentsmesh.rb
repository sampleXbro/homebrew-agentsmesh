class Agentsmesh < Formula
  desc "One .agentsmesh/ directory for every AI coding tool"
  homepage "https://github.com/sampleXbro/agentsmesh"
  url "https://registry.npmjs.org/agentsmesh/-/agentsmesh-0.30.2.tgz"
  sha256 "d435e4dadc91970b06ed16f8f3dfc50bbcfb322d0455716a9853e36351531af8"
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
