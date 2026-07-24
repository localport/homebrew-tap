class Localport < Formula
  desc "Put any local service online over secure HTTP, TCP, TLS, and mTLS tunnels"
  homepage "https://localport.io"
  version "0.5.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/localport/agent/releases/download/v#{version}/localport-darwin-arm64"
      sha256 "ab993fcd876808e43e9f3ddb1d3bffd22161e6b4f4029c1e89cba1e600a0ae76"
    end
    on_intel do
      url "https://github.com/localport/agent/releases/download/v#{version}/localport-darwin-amd64"
      sha256 "860dc55531a924bfe745ece2f9a5860f4fffc9c87e79c00b75688760a6c86817"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/localport/agent/releases/download/v#{version}/localport-linux-arm64"
      sha256 "6a3808934b870041de13ff24a80bb5e70efb3a8a92d164359572438e07a27d8e"
    end
    on_intel do
      url "https://github.com/localport/agent/releases/download/v#{version}/localport-linux-amd64"
      sha256 "1d462bfc4f8f490aa0b866bf6e07e90fa0139a0831b248cdf9e8269078db04be"
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