class Localport < Formula
  desc "Secure tunnels and identity-based remote access to devices"
  homepage "https://localport.io"
  version "0.8.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/localport/agent/releases/download/v#{version}/localport-darwin-arm64"
      sha256 "5ab022d37cddd03c1ea725be2aa9b9015dc82234770afe7a09ef0139d210fa09"
    end
    on_intel do
      url "https://github.com/localport/agent/releases/download/v#{version}/localport-darwin-amd64"
      sha256 "d11035a457c758a6c3f48d160a3203700b4acbce3e0cbd4cc05be4c3d6d8ff09"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/localport/agent/releases/download/v#{version}/localport-linux-arm64"
      sha256 "92b793d384121ab90270365297112c8641d1affd95332716a4500ff562b0d675"
    end
    on_intel do
      url "https://github.com/localport/agent/releases/download/v#{version}/localport-linux-amd64"
      sha256 "c52f421bf976b6eb774a772f7c658c755321eac1816d9cedda0659c3d4894f04"
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
