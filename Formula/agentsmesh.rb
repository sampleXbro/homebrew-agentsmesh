class Agentsmesh < Formula
  desc "One .agentsmesh/ directory for every AI coding tool"
  homepage "https://github.com/sampleXbro/agentsmesh"
  url "https://registry.npmjs.org/agentsmesh/-/agentsmesh-0.25.0.tgz"
  sha256 "9bc6ccc54e26d823d10041ccf34c8abcbf82920df099625fab3ef1c73a9058d8"
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
