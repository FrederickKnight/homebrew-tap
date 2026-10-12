class GitPark < Formula
  desc "Ramas estacionadas, notas por rama y chequeo de merge previo a los PRs"
  homepage "https://github.com/FrederickKnight/git-park"
  url "https://github.com/FrederickKnight/git-park/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "8d8ecb9316c93a1592f60458b806e26a0de8aad23448cbc565b9c182fe901b94"
  license "MIT"
  head "https://github.com/FrederickKnight/git-park.git", branch: "main"

  # git park y git twin usan merge-tree --write-tree (git 2.38 o mayor)
  uses_from_macos "git"

  def install
    bin.install "bin/git-park", "bin/git-memo", "bin/git-up", "bin/git-twin", "bin/git-kit"
  end

  def caveats
    <<~EOS
      Los comandos ya funcionan como git park, git memo, git up, git twin y git kit.
      Para los alias cortos (park, memo, kit), agrega esto a tu ~/.zshrc o ~/.bashrc:

        alias park='git park' memo='git memo' kit='git kit'
    EOS
  end

  test do
    system "git", "init", "-q"
    system "git", "config", "user.email", "t@t.t"
    system "git", "config", "user.name", "t"
    system "git", "commit", "-q", "--allow-empty", "-m", "base"
    assert_match "anotada: 0", shell_output("#{bin}/git-memo probar formula")
    assert_match "probar formula", shell_output("#{bin}/git-park memo")
  end
end
