class Localport < Formula
  desc "Put any local service online over secure HTTP, TCP, TLS, and mTLS tunnels"
  homepage "https://localport.io"
  version "0.7.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/localport/agent/releases/download/v#{version}/localport-darwin-arm64"
      sha256 "b9b5fd7b89b5ad63e91353b9b496ec079c6534a2619aaffd6d72d7c024bca5de"
    end
    on_intel do
      url "https://github.com/localport/agent/releases/download/v#{version}/localport-darwin-amd64"
      sha256 "02ba2ac79668175d9ca93a938b211cd9f9d1295e4fa5c4b1b435dc77c3a8ca73"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/localport/agent/releases/download/v#{version}/localport-linux-arm64"
      sha256 "6f78b5da907db80e4f8eaeef8ff3a1d91f71d78097f258dbec31817c7c731fdb"
    end
    on_intel do
      url "https://github.com/localport/agent/releases/download/v#{version}/localport-linux-amd64"
      sha256 "005a538e49ce4a97116a46751ecc5adfbd35e622e1c0b831705a49a65bbc79a6"
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