class Zerostash < Formula
  desc "Safe and speedy backups"
  homepage "https://github.com/symmetree-labs/zerostash"
  url "https://github.com/symmetree-labs/zerostash/archive/refs/tags/v0.3.tar.gz"
  sha256 "4ba955486d89341131d398ac0255a92920a0b48df71c4c04c0991046d867b224"
  license any_of: ["Apache-2.0", "MIT"]
  head "https://github.com/symmetree-labs/zerostash.git", branch: "master"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "zerostash", "--bin", "0s"
  end

  test do
    output = shell_output("0s -V")
    assert_match "zerostash 0.3.0", output
  end
end
