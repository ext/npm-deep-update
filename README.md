# npm-deep-update

Updates NPM transitive dependencies.

- One commit per dependency - simplifies bisecting when something fails to run.
- Caches result if you need to rerun script

Requires `jq` (and `npm` and `git` obviously) to run.
