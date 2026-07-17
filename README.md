# jv-k/homebrew-ver-bump

Homebrew tap for [**ver-bump**](https://github.com/jv-k/ver-bump) — a release
tool for Git projects: SemVer bump, CHANGELOG, tag, push.

## Install

```sh
brew install jv-k/ver-bump/ver-bump
```

or, in two steps:

```sh
brew tap jv-k/ver-bump
brew install ver-bump
```

Runtime dependencies (`bash`, `jq`) are installed automatically.

## Maintenance

- **CI** ([`ci.yml`](.github/workflows/ci.yml)) runs `brew style`,
  `brew audit --strict --online`, `brew install` and `brew test` on macOS and
  Linux for every push and pull request.
- **Auto-bump** ([`bump-formula.yml`](.github/workflows/bump-formula.yml))
  checks [jv-k/ver-bump](https://github.com/jv-k/ver-bump) every 6 hours (and
  on manual dispatch) for a newer stable `vX.Y.Z` tag and updates the formula's
  `url`/`sha256` automatically. Pre-release tags are ignored.

## Issues

Report problems with ver-bump itself on the
[main repo](https://github.com/jv-k/ver-bump/issues); packaging/tap issues
[here](https://github.com/jv-k/homebrew-ver-bump/issues).
