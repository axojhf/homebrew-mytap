# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class ZigLatest < Formula
  desc "A general-purpose programming language and toolchain for maintaining robust, optimal, and reusable software."
  homepage "https://ziglang.org/"
  version "0.12.0-dev.1245+a07f288eb"
  url "https://ziglang.org/builds/zig-linux-x86_64-0.12.0-dev.1245+a07f288eb.tar.xz"
  sha256 "4525F2FF8EF4D6ED27943DF9DB42E7524BCF8DEAE8DA31EE7DE54DE35EEE19F7"
  license "MIT"

  depends_on arch: :x86_64
  # depends_on "cmake" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    # 获取当前目录下的文件夹名称给dir_name
    # dir_name = Dir.entries(".").select { |f| File.directory? f }.reject { |d| d.start_with? "." }.first
    libexec.install Dir["*"]
    bin.install_symlink libexec/"zig"
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test zig_latest`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
