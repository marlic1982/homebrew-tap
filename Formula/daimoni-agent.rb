# Auto-generated. End user runs: brew install marlic1982/tap/daimoni-agent
class DaimoniAgent < Formula
  desc "Daimoni daemon: pair your computer + sync local folders to a Daimoni project"
  homepage "https://daimoni.com"
  version "0.2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/marlic1982/daimoni-releases/releases/download/v0.2.0/daimoni-agent-darwin-arm64.zip"
      sha256 "5c49b97cf573bb8a60dd5a4e7f5bdb7488c3265a46477fdce32baa69f96725aa"
    else
      url "https://github.com/marlic1982/daimoni-releases/releases/download/v0.2.0/daimoni-agent-darwin-amd64.zip"
      sha256 "7cba4cbfc8f7451c4e2d6b6fa68b2bacf1cab5e362f826edf6aebe6f5bba455d"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/marlic1982/daimoni-releases/releases/download/v0.2.0/daimoni-agent-linux-arm64.zip"
      sha256 "66112af808ebb0683b09152b68585b310000ed0afa427c06c2b91896a113c650"
    else
      url "https://github.com/marlic1982/daimoni-releases/releases/download/v0.2.0/daimoni-agent-linux-amd64.zip"
      sha256 "7a1ca63a013646f899f63142c1ca188a68a379f0bb3f78550bda2397160efbdb"
    end
  end

  def install
    bin.install Dir["daimoni-agent-*"].first => "daimoni-agent"
  end

  test do
    assert_match "daimoni-agent version", shell_output("#{bin}/daimoni-agent --version")
  end
end
