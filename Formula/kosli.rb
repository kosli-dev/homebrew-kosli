class Kosli < Formula
  desc "A CLI client for reporting compliance events to  https://kosli.com"
  homepage "https://docs.kosli.com"
  url "https://github.com/kosli-dev/cli.git",
    tag: "v0.1.6",
    revision: "c3df5c469259e321b9de4158999948b7f331b29a" 
  head "https://github.com/kosli-dev/cli.git", branch: "main"
  license "MIT"

  depends_on "go" => :build

  def install
    # Don't dirty the git tree
    rm_rf ".brew_home"
    system "make", "build"
    bin.install "kosli"
  end

  test do
    system "#{bin}/kosli", "version"
    version_output = shell_output(bin/"kosli version 2>&1")
    assert_match "GitTreeState:\"clean\"", version_output

    if build.stable?
      revision = stable.specs[:revision]
      assert_match "GitCommit:\"#{revision}\"", version_output
      assert_match "Version:\"v#{version}\"", version_output
    end
  end
end
