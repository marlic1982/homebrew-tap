# Auto-generated. End user runs: brew install marlic1982/tap/daimoni-agent
class DaimoniAgent < Formula
  desc "Daimoni daemon: pair your computer + sync local folders to a Daimoni project"
  homepage "https://daimoni.com"
  version "0.2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/marlic1982/daimoni-releases/releases/download/v0.2.0/daimoni-agent-darwin-arm64.zip"
      sha256 "c95643bb5c6c88743ae15c58e4a87dbee840cd45c7b8ca6b6a51d9964b8e9be6"
    else
      url "https://github.com/marlic1982/daimoni-releases/releases/download/v0.2.0/daimoni-agent-darwin-amd64.zip"
      sha256 "3a668991e756fbf8aad8600f8913e56da6109ab504a4f6afd3b1701933d41060"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/marlic1982/daimoni-releases/releases/download/v0.2.0/daimoni-agent-linux-arm64.zip"
      sha256 "d3c2b4b0420da716086e8ea3b56875274a8a87301674bd349de44d12b37bd472"
    else
      url "https://github.com/marlic1982/daimoni-releases/releases/download/v0.2.0/daimoni-agent-linux-amd64.zip"
      sha256 "290f0eabbe031483a7f1760e9f1e92141af9eb8b3f2251576ebcc3bea49834d4"
    end
  end

  def install
    bin.install Dir["daimoni-agent-*"].first => "daimoni-agent"
  end

  test do
    assert_match "daimoni-agent version", shell_output("#{bin}/daimoni-agent --version")
  end
end
