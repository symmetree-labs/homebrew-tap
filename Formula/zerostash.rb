class Zerostash < Formula
  desc "Safe and speedy backups"
  homepage "https://github.com/symmetree-labs/zerostash"
  version "0.5.0"

  license any_of: ["Apache-2.0", "MIT"]

  head do
    url "https://github.com/symmetree-labs/zerostash.git", tag: version
    depends_on "rust" => :build
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/symmetree-labs/zerostash/releases/download/v0.5.0/0s-v0.5.0-macos-aarch64.tar.gz"
      sha256 "11a898d32c0d8fa537a1221b49a3e36613dd57b1fb217df82e5c651bef219ca6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/symmetree-labs/zerostash/releases/download/v0.5.0/0s-v0.5.0-macos-x86_64.tar.gz"
      sha256 "7151e47c838ff4be812dd7b514531d2a64f5fbed9271ef693595cf986b86ae76"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/symmetree-labs/zerostash/releases/download/v0.5.0/0s-v0.5.0-linux-x86_64.tar.xz"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
    end
  end

  def install
    if build.head?
      system "cargo", "install", "--locked", "--root", prefix, "--path", "zerostash", "--bin", "0s"
    else
      bin.install "0s"
    end
  end

  test do
    output = shell_output("0s -V")
    assert_match "zerostash 0.4.1", output
  end
end
