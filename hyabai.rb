# hyabai.rb
class Hyabai < Formula
  env :std
  desc "Fork of Yabai for my personal use"
  homepage "https://github.com/H4ckint0sh/yabai"
  head "https://github.com/H4ckint0sh/yabai.git"

  depends_on :macos => :big_sur

  def install
    (var/"log/yabai").mkpath

    system "make", "-j1", "install"
    system "codesign", "--force", "-s", "-", "#{buildpath}/bin/yabai"

    bin.install "#{buildpath}/bin/yabai"
  end

  test do
    echo "Hi\n"
  end
end
