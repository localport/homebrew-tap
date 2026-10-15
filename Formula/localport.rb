class Localport < Formula
  desc "Secure tunnels and identity-based remote access to devices"
  homepage "https://localport.io"
  version "0.9.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/localport/agent/releases/download/v#{version}/localport-darwin-arm64"
      sha256 "ecdaccaf02807aafd838414fce5caa9cca5999f9d82e43e62dad52cd5ce1ab28"
    end
    on_intel do
      url "https://github.com/localport/agent/releases/download/v#{version}/localport-darwin-amd64"
      sha256 "795d48474ad4e7120f3bbf496373ad721a6b3bb0c55ba48d8fede8826339dc0f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/localport/agent/releases/download/v#{version}/localport-linux-arm64"
      sha256 "d2370ec90e7fb0ba6afe72e0546d9f60a75f7649b6eb729c84b38edcab2a8594"
    end
    on_intel do
      url "https://github.com/localport/agent/releases/download/v#{version}/localport-linux-amd64"
      sha256 "08de413a85816abbe192238db9274bd98b51ea69d202963d4f5a6923992d20af"
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
