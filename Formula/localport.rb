class Localport < Formula
  desc "Put any local service online over secure HTTP, TCP, TLS, and mTLS tunnels"
  homepage "https://localport.io"
  version "0.3.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/localport/agent/releases/download/v#{version}/localport-darwin-arm64"
      sha256 "b0c62f6e78c57347a27e245383e9eefe09f0381b7370fb4cbc807631c4812f3a"
    end
    on_intel do
      url "https://github.com/localport/agent/releases/download/v#{version}/localport-darwin-amd64"
      sha256 "9ccb4730137ef1861af524bf8f000a6d98cca1e02e9d5eb0405394ba6ce8e640"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/localport/agent/releases/download/v#{version}/localport-linux-arm64"
      sha256 "2896a10b90f3433e07843dfc432cc77e378dafe68272c4b2e37fe28d03893832"
    end
    on_intel do
      url "https://github.com/localport/agent/releases/download/v#{version}/localport-linux-amd64"
      sha256 "60f6113c6e91241a8f724639708b2bf6c4dc40c56abaa1a48cda1980685e81d9"
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