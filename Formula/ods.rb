class Ods < Formula
  desc "Fetch, query, cite and reproduce NHS ODS data as verifiable Parquet"
  homepage "https://ods.fyi"
  url "https://github.com/olizilla/ods/archive/refs/tags/v0.2.3.tar.gz"
  sha256 "0bcf0834ecbc564918d64e3551f03212a710a2d2c147971a71d31a72ddf7dd25"
  license "MIT"
  head "https://github.com/olizilla/ods.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/olizilla/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1f898c3d65d9b46899d1f3c0990de51bbcfe9075d848673a93583d15d78028ad"
    sha256 cellar: :any,                 x86_64_linux:  "b1fbe298a2ff3e40eb0e55be06f99879ed46af7befc246d5d597e0b97311b92b"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ods --version")
  end
end
