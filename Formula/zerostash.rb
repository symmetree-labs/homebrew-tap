class Zerostash < Formula
  desc "Safe and speedy backups"
  homepage "https://github.com/symmetree-labs/zerostash"
  url "https://github.com/symmetree-labs/zerostash/archive/refs/tags/v0.4.1.tar.gz"
  sha256 "e8e6801ef611b4812c7cc7b7c70cd1991b9cce799f5584e4af8fca17c77b2e27"
  license any_of: ["Apache-2.0", "MIT"]
  head "https://github.com/symmetree-labs/zerostash.git", branch: "master"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "zerostash", "--bin", "0s"
  end

  test do
    output = shell_output("0s -V")
    assert_match "zerostash 0.4.1", output
  end
end
