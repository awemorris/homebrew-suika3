require 'rbconfig'

class Suika3 < Formula
  desc "2D Game and Visual Novel Engine"
  homepage "https://github.com/awemorris/suika3"

  url "https://github.com/awemorris/suika3.git",
      revision: "543b416e48c2a548a4348523980a8a70eeed3d1b"
  version "26.07.4"

  license "Zlib"

  depends_on "cmake" => :build

  def install
    system "cmake", ".",
           "-DCMAKE_BUILD_TYPE=Release",
           "-DCMAKE_OSX_DEPLOYMENT_TARGET=10.11",
           "-DSUIKA_TARGET_MACOS_CLI=ON",
           "-DSUIKA_ENABLE_DIST_SINGLE=ON",
           "-DSUIKA_ENABLE_INSTALL=ON",
           "-DSUIKA_ENABLE_JIT=ON",
           "-DSUIKA_ENABLE_I18N=ON",
           "-DSUIKA_ENABLE_PACK=ON",
           "-DSUIKA_ENABLE_BCC=ON",
           "-DSUIKA_ENABLE_AOTC=ON",
           "-DSUIKA_ENABLE_CONSOLE=ON",
           "-DSUIKA_ENABLE_UNSAFE=ON",
           *std_cmake_args
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
