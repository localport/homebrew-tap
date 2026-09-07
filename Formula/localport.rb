class Localport < Formula
  desc "Put any local service online over secure HTTP, TCP, TLS, and mTLS tunnels"
  homepage "https://localport.io"
  version "0.6.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/localport/agent/releases/download/v#{version}/localport-darwin-arm64"
      sha256 "bdd9d6887306ff7322453e4d04833182688489dac922326eb2d3e24e6d7d2289"
    end
    on_intel do
      url "https://github.com/localport/agent/releases/download/v#{version}/localport-darwin-amd64"
      sha256 "3d398585912d6a4a854c4a59399c620cdccb00519922c56db18f5155d74824e0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/localport/agent/releases/download/v#{version}/localport-linux-arm64"
      sha256 "89f8e846dee5112085f921b6402c83376fdb04310b0bfc9fddb09b5085d80968"
    end
    on_intel do
      url "https://github.com/localport/agent/releases/download/v#{version}/localport-linux-amd64"
      sha256 "cf04fa7f973c06a706adcbfe8b477ab5b7abcad8019e66e0879eb4592112764f"
    end
  end

  def install
    # Homebrew downloads the single binary named after the URL; rename to `localport`.
    bin.install Dir["localport-*"].first => "localport"
  end

  livecheck do
    url :stable
    strategy :github_latest
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/localport --version")
  end
end