# homebrew-tap

Formulas de Homebrew de [FrederickKnight](https://github.com/FrederickKnight).

```bash
brew install frederickknight/tap/git-park
```

| formula | que es |
|---|---|
| [git-park](https://github.com/FrederickKnight/git-park) | ramas estacionadas, notas por rama y chequeo de merge previo a los PRs |

## Publicar una version nueva de git-park

1. En git-park: `git tag vX.Y.Z && git push origin vX.Y.Z`
2. Saca el sha256 del tarball:
   `curl -fsSL https://github.com/FrederickKnight/git-park/archive/refs/tags/vX.Y.Z.tar.gz | shasum -a 256`
3. Cambia `url` y `sha256` en `Formula/git-park.rb` y haz push.
