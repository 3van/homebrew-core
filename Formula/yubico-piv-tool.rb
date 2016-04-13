class YubicoPivTool < Formula
  desc "Command-line tool for the YubiKey NEO PIV applet"
  homepage "https://developers.yubico.com/yubico-piv-tool/"
  url "https://developers.yubico.com/yubico-piv-tool/Releases/yubico-piv-tool-1.3.0.tar.gz"
  sha256 "101f7ce0ac84073da538db398aa4f2b4ae004e0baf44017cf1470811f99f3451"

  bottle do
    cellar :any
    sha256 "440da7550575c40b5e59703e0539a9cd45632686a584a99b7df08000f74885dc" => :el_capitan
    sha256 "066724c6f08fe0f13d9b0f97b4301954b7b7a55af57996ed91a8927efe483791" => :yosemite
    sha256 "7f678017351776aa56b7fec6485a54cb2ea94c9d3096115e8481a47d8dfbf0c9" => :mavericks
  end

  depends_on "pkg-config" => :build
  depends_on "openssl"

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    assert_match "yubico-piv-tool 1.3.0", shell_output("#{bin}/yubico-piv-tool --version")
  end
end
