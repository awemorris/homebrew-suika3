class Suika3 < Formula
  desc "2D Game and Visual Novel Engine"
  homepage "https://github.com/awemorris/suika3"
  url "https://github.com/awemorris/suika3/archive/refs/tags/26.04.11.zip"
  sha256 "340a15deca3a78259b96c3d4bf227057caee12c2a8fcaae4e90aacc5cd7da0bd"
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
    system "cmake", ".", "-DCMAKE_BUILD_TYPE=Release", "-DCMAKE_OSX_DEPLOYMENT_TARGET=10.11", "-DSUIKA_TARGET_MACOS_CLI=ON", "-DSUIKA_ENABLE_INSTALL=ON", "-DSUIKA_ENABLE_JIT=ON", "-DSUIKA_ENABLE_I18N=ON", "-DSUIKA_ENABLE_PACK=ON", "-DSUIKA_ENABLE_BYTECOMP=ON", "-DSUIKA_ENABLE_AOTCOMP=ON" "-DSUIKA_ENABLE_DIST=ON", *std_cmake_args
    system "cmake", "--build", "."

    bin.install "suika3"
    bin.install "suika3-pack"
    bin.install "suika3-aotc"
    bin.install "suika3-bcc"

    man1.install "resources/manpage/suika3.1"
    man1.install "resources/manpage/suika3-pack.1"
    man1.install "resources/manpage/suika3-aotc.1"
    man1.install "resources/manpage/suika3-bcc.1"
  end

  test do
    system "#{bin}/suika3-aotc --help || true"
  end
end
