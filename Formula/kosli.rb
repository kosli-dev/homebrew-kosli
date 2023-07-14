# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Kosli < Formula
  desc "CLI client for reporting compliance events to  https://kosli.com"
  homepage "https://kosli.com/"
  version "2.6.2"
  license "MIT"

  depends_on "go"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/kosli-dev/cli/releases/download/v2.6.2/kosli_2.6.2_darwin_amd64.tar.gz"
      sha256 "9dfb9bd2f2e7a82d331466280a0048f613ba25855b32903a4dd23ec2e34963e9"

      def install
        bin.install "kosli"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/kosli-dev/cli/releases/download/v2.6.2/kosli_2.6.2_darwin_arm64.tar.gz"
      sha256 "0abd52f3f3568c6ab858c23d2e9f9caac3d78e161fe94d3737bbb49e662f51d9"

      def install
        bin.install "kosli"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/kosli-dev/cli/releases/download/v2.6.2/kosli_2.6.2_linux_armv6.tar.gz"
      sha256 "1fea33e129a16805810815ba617769ee0abdf0f038fda5f6021037c3d2ae6d8d"

      def install
        bin.install "kosli"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/kosli-dev/cli/releases/download/v2.6.2/kosli_2.6.2_linux_amd64.tar.gz"
      sha256 "457b7d4b953fac40ce482f986d61af7e1eac497a176d7e60ce20c1c2e2dcff46"

      def install
        bin.install "kosli"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/kosli-dev/cli/releases/download/v2.6.2/kosli_2.6.2_linux_arm64.tar.gz"
      sha256 "7b788eba85dba15b4bf02e7581dfb8ab28ada5aef48dfc1640748ce054d14e73"

      def install
        bin.install "kosli"
      end
    end
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
