class Suika3 < Formula
  desc "2D Game and Visual Novel Engine"
  homepage "https://github.com/awemorris/suika3"
  url "https://github.com/awemorris/suika3/archive/refs/tags/26.04.2-openbeta.zip"
  sha256 "b05bf23449e733d986335511bc7cee2de27a7f711dc70929696b877e90285179"
  license "Zlib"

  depends_on "cmake" => :build

  depends_on "libpng"
  depends_on "jpeg-turbo"
  depends_on "libwebp"
  depends_on "libogg"
  depends_on "libvorbis"
  depends_on "brotli"
  depends_on "freetype"
  
  def install
    system "cmake", "--preset", "macos-cli", *std_cmake_args
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
