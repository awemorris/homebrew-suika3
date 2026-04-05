class Suika3 < Formula
  desc "2D Game and Visual Novel Engine"
  homepage "https://github.com/awemorris/suika3"
  url "https://github.com/awemorris/suika3/archive/refs/tags/CI-20260405-2049-f20f911.zip"
  sha256 "5a8de0de489be67377457a95b778d6bc96e584880ea637cb3ea372dfc57ffdc3"
  license "Zlib"

  depends_on "cmake" => :build

  depends_on "libpng"
  depends_on "jpeg-turbo"
  depends_on "webp"
  depends_on "libogg"
  depends_on "libvorbis"
  depends_on "brotli"
  depends_on "freetype"
  
  def install
    system "cmake", "--preset", "macos-cli", "-DSUIKA_ENABLE_DIST=ON", *std_cmake_args
    system "cmake", "--build", "--preset", "macos-cli"

    bin.install "build-macos-cli/suika3"
    bin.install "build-macos-cli/suika3-pack"
    bin.install "build-macos-cli/suika3-aotc"
    bin.install "build-macos-cli/suika3-bcc"

    man1.install "resources/manpage/suika3.1"
    man1.install "resources/manpage/suika3-pack.1"
    man1.install "resources/manpage/suika3-aotc.1"
    man1.install "resources/manpage/suika3-bcc.1"
  end

  test do
    system "#{bin}/suika3-aotc --help || true"
  end
end
