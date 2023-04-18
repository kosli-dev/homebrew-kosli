# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Kosli < Formula
  desc "CLI client for reporting compliance events to  https://kosli.com"
  homepage "https://kosli.com/"
  version "2.2.0"
  license "MIT"

  depends_on "go"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/kosli-dev/cli/releases/download/v2.2.0/kosli_2.2.0_darwin_amd64.tar.gz"
      sha256 "cc33c74ebf0da94d7b463a1f89d647d22b903c0e7f14924acc69e6ebf0604733"

      def install
        bin.install "kosli"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/kosli-dev/cli/releases/download/v2.2.0/kosli_2.2.0_darwin_arm64.tar.gz"
      sha256 "a13f282587049f074ec5ed8751b36a4410ee2248905e65cc0b5e315e3c76b0c5"

      def install
        bin.install "kosli"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/kosli-dev/cli/releases/download/v2.2.0/kosli_2.2.0_linux_arm64.tar.gz"
      sha256 "a613f58cabe09918eceb03e83a137da9fa5d5f3b48393a29168fd6e1fefa1f70"

      def install
        bin.install "kosli"
      end
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/kosli-dev/cli/releases/download/v2.2.0/kosli_2.2.0_linux_armv6.tar.gz"
      sha256 "4fa4bf22947b9c39e871e545eab5a8ce2ab346210cb24530023c4a887187a50b"

      def install
        bin.install "kosli"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/kosli-dev/cli/releases/download/v2.2.0/kosli_2.2.0_linux_amd64.tar.gz"
      sha256 "3b85bb7a135664862040ff3ae7b3393b7df717274ef860a96295533013063016"

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
