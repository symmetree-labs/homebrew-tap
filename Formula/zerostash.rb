class Zerostash < Formula
  desc "Safe and speedy backups"
  homepage "https://github.com/symmetree-labs/zerostash"
  url "https://github.com/symmetree-labs/zerostash/archive/refs/tags/v0.2.tar.gz"
  sha256 "d73e378b3b0684fcaf11c4aa19f3584b548b49fc9f2c4c7cee437eca90309689"
  license any_of: ["Apache-2.0", "MIT"]
  head "https://github.com/symmetree-labs/zerostash.git", branch: "master"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "zerostash", "--bin", "0s"
  end

  test do
    output = shell_output("0s -V")
    assert_match "zerostash 0.1.0", output
  end
end
