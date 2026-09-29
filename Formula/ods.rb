class Ods < Formula
  desc "Fetch, query, cite and reproduce NHS ODS data as verifiable Parquet"
  homepage "https://ods.fyi"
  url "https://github.com/olizilla/ods/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "5829e164c378083c7bf45d7b0b5bf5b644b80dc97752b59c348dd3466ba60fae"
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
