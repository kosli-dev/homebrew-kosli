class Kosli < Formula
  desc "A CLI client for reporting compliance events to  https://kosli.com"
  homepage "https://docs.kosli.com"
  url "https://github.com/kosli-dev/cli/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "f0b4a13071987ae3cab898f1c0ae3dddd6009eb837e0180913c6145900849116"
  license "MIT"

  depends_on "go" => :build

  def install
    $ldflags = "-extldflags \"-static\""
    $ldflags += " -X github.com/kosli-dev/cli/internal/version.version=#{version}"
    $ldflags += " -X github.com/kosli-dev/cli/internal/version.gitTreeState=clean"
    $ldflags += " -X github.com/kosli-dev/cli/internal/version.gitCommit=c3df5c469259e321b9de4158999948b7f331b29a"
    system "go", "build", *std_go_args(ldflags: $ldflags), "./cmd/kosli"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test cli`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "#{bin}/kosli", "version"
  end
end
