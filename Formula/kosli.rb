class Kosli < Formula
  desc "A CLI client for reporting compliance events to  https://kosli.com"
  homepage "https://kosli.com/"
  version "0.1.6"
  license "MIT"
  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kosli-dev/cli/releases/download/v0.1.6/kosli_0.1.6_darwin_arm64.tar.gz"
      sha256 "53e39f9cebbeb8c36aaf33f2e5b2c77219d1346db1f311ca50c370258a64e363"

      def install
        bin.install "kosli"
      end
    end
  end

  depends_on "go"
end
