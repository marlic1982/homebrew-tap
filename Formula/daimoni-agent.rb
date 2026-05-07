# Homebrew formula template for daimoni-agent.
#
# Filled in by installers/scripts/release.sh:
#   0.2.0            → e.g. 0.2.0
#   5c49b97cf573bb8a60dd5a4e7f5bdb7488c3265a46477fdce32baa69f96725aa       → checksum for darwin-arm64 zip
#   dd5b73cd14b35ba8fdbef3778ad754f7c2b22445025f2e0d8a9c6563262f5f93       → checksum for darwin-amd64 zip
#   350470767bc4d247db17d595831769e75331a289c71799065a2e6f0d0f64f41e → checksum for linux-amd64 zip
#   e0253194e1ae7c1fa8e6ba4033b6dfc380418176e71275a4dc4887dfbca5e926 → checksum for linux-arm64 zip
#
# Output is committed to https://github.com/marlic1982/homebrew-tap
# as `Formula/daimoni-agent.rb`. End user runs:
#
#   brew install marlic1982/tap/daimoni-agent

class DaimoniAgent < Formula
  desc "Daimoni daemon: pair your computer + sync local folders to a Daimoni project"
  homepage "https://daimoni.com"
  version "0.2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/marlic1982/Daimoni/releases/download/v0.2.0/daimoni-agent-darwin-arm64.zip"
      sha256 "5c49b97cf573bb8a60dd5a4e7f5bdb7488c3265a46477fdce32baa69f96725aa"
    else
      url "https://github.com/marlic1982/Daimoni/releases/download/v0.2.0/daimoni-agent-darwin-amd64.zip"
      sha256 "dd5b73cd14b35ba8fdbef3778ad754f7c2b22445025f2e0d8a9c6563262f5f93"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/marlic1982/Daimoni/releases/download/v0.2.0/daimoni-agent-linux-arm64.zip"
      sha256 "e0253194e1ae7c1fa8e6ba4033b6dfc380418176e71275a4dc4887dfbca5e926"
    else
      url "https://github.com/marlic1982/Daimoni/releases/download/v0.2.0/daimoni-agent-linux-amd64.zip"
      sha256 "350470767bc4d247db17d595831769e75331a289c71799065a2e6f0d0f64f41e"
    end
  end

  def install
    bin.install Dir["daimoni-agent-*"].first => "daimoni-agent"
  end

  service do
    run [opt_bin/"daimoni-agent", "sync"]
    keep_alive true
    log_path var/"log/daimoni-agent.log"
    error_log_path var/"log/daimoni-agent.err.log"
  end

  test do
    assert_match "daimoni-agent version", shell_output("#{bin}/daimoni-agent --version")
  end
end
