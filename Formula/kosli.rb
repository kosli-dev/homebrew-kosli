# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Kosli < Formula
  desc "CLI client for reporting compliance events to  https://kosli.com"
  homepage "https://kosli.com/"
  version "2.3.0"
  license "MIT"

  depends_on "go"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kosli-dev/cli/releases/download/v2.3.0/kosli_2.3.0_darwin_arm64.tar.gz"
      sha256 "540640095f326e6a6ba64a8b999931a2c16ca0f6263ef696514e83096cfd6435"

      def install
        bin.install "kosli"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/kosli-dev/cli/releases/download/v2.3.0/kosli_2.3.0_darwin_amd64.tar.gz"
      sha256 "383d743a4bb0f82798a78def0a2ec94da4596dd05922cf1221c42ee3e06a178e"

      def install
        bin.install "kosli"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/kosli-dev/cli/releases/download/v2.3.0/kosli_2.3.0_linux_arm64.tar.gz"
      sha256 "ad9c59c0fc6e6a7c6bdc91c186b001336ab3a4f5d65f34e31fbfacf8bd6f970c"

      def install
        bin.install "kosli"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/kosli-dev/cli/releases/download/v2.3.0/kosli_2.3.0_linux_amd64.tar.gz"
      sha256 "b30911cd70a1dddfec1141f845151985422a71282da5013406a375e215691903"

      def install
        bin.install "kosli"
      end
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/kosli-dev/cli/releases/download/v2.3.0/kosli_2.3.0_linux_armv6.tar.gz"
      sha256 "6e5de6b172917a3b03ffa09019a8b171f3466d76c2d35669d86d6a236049ce24"

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
