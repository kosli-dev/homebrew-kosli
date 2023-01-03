# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Kosli < Formula
  desc "CLI client for reporting compliance events to  https://kosli.com"
  homepage "https://kosli.com/"
  version "0.1.30"
  license "MIT"

  depends_on "go"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/kosli-dev/cli/releases/download/v0.1.30/kosli_0.1.30_darwin_amd64.tar.gz"
      sha256 "e0c3650907cd1ca99e8433e67314fb8d15a4cb4662f458acb514b14fdf8b70ea"

      def install
        bin.install "kosli"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/kosli-dev/cli/releases/download/v0.1.30/kosli_0.1.30_darwin_arm64.tar.gz"
      sha256 "87284f995806d24148675ec38577ef1c52c2878ce3ce3aca0fb34ae7bc64ba16"

      def install
        bin.install "kosli"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/kosli-dev/cli/releases/download/v0.1.30/kosli_0.1.30_linux_arm64.tar.gz"
      sha256 "c2ce9841db461c08714fad7c43dbcbf8b699b3d508c51703af2089238627d272"

      def install
        bin.install "kosli"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/kosli-dev/cli/releases/download/v0.1.30/kosli_0.1.30_linux_amd64.tar.gz"
      sha256 "119716afce5844c5f2df67fa9f835bdad0a2ff3810a7d73f3229965a8dbb2d85"

      def install
        bin.install "kosli"
      end
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/kosli-dev/cli/releases/download/v0.1.30/kosli_0.1.30_linux_armv6.tar.gz"
      sha256 "7942fb3feff4c94b928ae9dbe9e76a3c307e11f377bebf5cf709818683952dec"

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
