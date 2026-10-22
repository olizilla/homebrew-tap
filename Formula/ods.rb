class Ods < Formula
  desc "Fetch, query, cite and reproduce NHS ODS data as verifiable Parquet"
  homepage "https://ods.fyi"
  url "https://github.com/olizilla/ods/archive/refs/tags/v0.2.4.tar.gz"
  sha256 "a38f6ade03c7de2080cc6d682d1ecc00124734ec1afcf63b40e0bd454ad68d89"
  license "MIT"
  head "https://github.com/olizilla/ods.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/olizilla/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "b732a135ee43cd0e60d786ff5c6bc93c83074144fb89dd8f7fbf1399e308470f"
    sha256 cellar: :any,                 x86_64_linux:  "c982609978f28d9b91e84793600d9f72d8dafcdd3085caac1bf829ec0cafba2c"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ods --version")
  end
end
