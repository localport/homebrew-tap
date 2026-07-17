class Localport < Formula
  desc "Put any local service online over secure HTTP, TCP, TLS, and mTLS tunnels"
  homepage "https://localport.io"
  version "0.4.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/localport/agent/releases/download/v#{version}/localport-darwin-arm64"
      sha256 "fbd38a3baf9c6f952eb73da18904ae67f13aff312c3e9e01d9e9a1612784a54b"
    end
    on_intel do
      url "https://github.com/localport/agent/releases/download/v#{version}/localport-darwin-amd64"
      sha256 "ba423a0a23639bd35afdcc62e964590bd7ae93033c6bb153344fc19cabd3f0db"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/localport/agent/releases/download/v#{version}/localport-linux-arm64"
      sha256 "a57b884baf22726086a87398bda6a1cad96c535b23656442e2325f57d2b8a84c"
    end
    on_intel do
      url "https://github.com/localport/agent/releases/download/v#{version}/localport-linux-amd64"
      sha256 "6683af9c79179056a70b3dd712a3aaa0a83c1216f98a6c1d0942eda0862e4d13"
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