class Zerostash < Formula
  desc "Safe and speedy backups"
  homepage "https://github.com/symmetree-labs/zerostash"
  version "0.4.1.1"

  license any_of: ["Apache-2.0", "MIT"]

  head do
    url "https://github.com/symmetree-labs/zerostash.git", tag: version
    depends_on "rust" => :build
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/symmetree-labs/zerostash/releases/download/v#{version}/0s-v#{version}-macos-aarch64.tar.gz"
      sha256 "f6fbff8643dd7ad9d62980af7a9d47f5ee55253a367fb591d7bd5b5277294c30"
    end
    if Hardware::CPU.intel?
      url "https://github.com/symmetree-labs/zerostash/releases/download/v#{version}/0s-v#{version}-macos-x86_64.tar.gz"
      sha256 "180f410e7b10e7eab53bd188598e66d61d62c257aae3ce2a1bc77a8391e0b179"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/symmetree-labs/zerostash/releases/download/v#{version}/0s-v#{version}-linux-x86_64.tar.xz"
      sha256 "a7c7761b32942a7814660699a2e6d5dd4dd99cf3bbbd575974b4414a405303a0"
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
