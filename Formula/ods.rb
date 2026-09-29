class Ods < Formula
  desc "Fetch, query, cite and reproduce NHS ODS data as verifiable Parquet"
  homepage "https://ods.fyi"
  url "https://github.com/olizilla/ods/archive/refs/tags/v0.2.3.tar.gz"
  sha256 "0bcf0834ecbc564918d64e3551f03212a710a2d2c147971a71d31a72ddf7dd25"
  license "MIT"
  head "https://github.com/olizilla/ods.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ods --version")
  end
end
