---
name: plone-create
description: "Create and wire a Plone add-on with plonecli in this mr.developer buildout, including Classic UI configuration and install/upgrade/uninstall profiles."
version: 1.0.0
author: Sinar
license: MIT
platforms: [linux]
metadata:
  hermes:
    tags: [Plone, Addon, plonecli, buildout, mr.developer]
---

# Plone add-on creation (plonecli + this buildout)

Use this skill to create a new Plone add-on for the Politikus buildout at
`/home/kaeru/src/plone/politikus` and wire it into the buildout as an
mr.developer git source checkout. All commands below are verified against this
machine and this Plone 6.2.0 buildout.

## Ground truth about this buildout (do not guess)

- Plone **6.2.0** (extends `https://dist.plone.org/release/6.2.0/versions.cfg`).
- `buildout.cfg` uses the `mr.developer` extension: `always-checkout = force`,
  `sources = sources`, `auto-checkout = <list>`.
- Every add-on lives under `src/<name>/` as its **own standalone git repo**
  (the outer buildout repo git-ignores `src/`). Add-ons are declared in three
  places in `buildout.cfg`: `[sources]`, `auto-checkout`, and `develop`, and in
  `[instance] eggs` (+ mirrored in `[scripts] eggs` via `${instance:eggs}`).
- `src/` is git-ignored in the buildout repo, so a new add-on's `.git` is its
  own repo — commit there and (once a remote exists) push from there.
- Add-ons are built as **pyproject.toml** packages (`[build-system]`
  setuptools), not old-style `setup.py`. The Python module lives under
  `src/<dotted>/...`. The GenericSetup **profile ID equals the dotted module
  name** (e.g. `politikus.site:default`), NOT the git repo name.

### Classic UI mechanism (Plone 6.2) — important for "Classic UI" add-ons
- In the `Plone` distribution the default frontend is **Volto** (the new
  Angular SPA, needs NodeJS). The **Classic UI** is the backend/server-rendered
  UI.
- `plone.classicui` (2.0.0, already in `eggs/v5`) registers a `classic`
  distribution named **"Plone Site (Classic UI)"**. `plone.volto` (6.0.0)
  registers the `volto` distribution.
- To make an add-on produce a **Classic UI** site: depend on
  **`plone.classicui`** (NOT `plone.volto`). In `profiles/default/metadata.xml`
  set the distribution dependency to `profile-plone.classicui:default` and do
  NOT depend on `plone.volto:default`. Optionally add the env var
  `ALLOWED_DISTRIBUTIONS=classic` to the instance so site-creation only offers
  the Classic distribution.
- The bobtemplates `addon` template **ships `metadata.xml` depending on
  `profile-plone.volto:default` by default** — you MUST change it for a Classic
  UI add-on.

### The existing Politikus add-ons (auto-installed by politikus.site)
Profile IDs = dotted module names (verified from each `profiles.zcml`):

| git repo (src/) | egg / dotted module | install profile |
|---|---|---|
| `politikus.contenttypes` | `politikus.contenttypes` | `politikus.contenttypes:default` |
| `politikus.popolo` | `politikus.popolo` | `politikus.popolo:default` |
| `politikus.ocds` | `politikus.ocds` | `politikus.ocds:default` |
| `politikus.bods` | `politikus.bods` | `politikus.bods:default` |
| `collective.vocabularies.iso` | `collective.vocabularies.iso` | `collective.vocabularies.iso:default` |
| `politikus.extractives` | `politikus.extractives` | `politikus.extractives:default` |
| `politikus.naturalresource` | `politikus.naturalresource` | `politikus.naturalresource:default` |

Declare them as `dependencies` in `pyproject.toml` so that installing
`politikus.site` pulls them in, and list their profiles in the add-on's
`profiles/default/metadata.xml` `<dependencies>` so GenericSetup installs them
together.

## Creating the add-on (non-interactive)

`plonecli` is NOT on PATH. Use uv. The `create` subcommand is interactive
(mr.bob prompts), so drive it non-interactively.

### Preferred: piped answers (verified to complete with exit 0)
```bash
export PATH="$HOME/.local/bin:$HOME/.opencode/bin:$PATH"
cd /home/kaeru/src/plone/politikus/src
# Answers, one per line, in template question ORDER:
#   author.name, author.email, author.github.user, package.description,
#   package.git.init (y/n), plone.version, python.version, vscode_support (y/n)
printf '%s\n' \
  "Khairil Yusof" \
  "khairil.yusof@gmail.com" \
  "Sinar" \
  "<one-line description of the add-on>" \
  "y" \
  "6.2.0" \
  "python3" \
  "n" \
  | uvx plonecli create addon <DOTTED_NAME>
```
- `<DOTTED_NAME>` must be dotted and lowercase, e.g. `politikus.site`.
- This runs `mrbob bobtemplates.plone:addon -O <name>` under the hood and
  completes when you see `Done` and `git: ✓`.
- If it prints `Aborted!`, the answer stream didn't match the prompts — the
  template always asks the 8 questions above in that order.

### Alternative: --bobconfig (works, but still prompts; use piped answers)
```bash
uvx plonecli create --bobconfig /tmp/mrbob.cfg addon <DOTTED_NAME>
# /tmp/mrbob.cfg:
# [profile]
# author.name = Khairil Yusof
# author.email = khairil.yusof@gmail.com
# author.github.user = Sinar
# package.description = <desc>
# package.git.init = y
# plone.version = 6.2.0
# python.version = python3
# vscode_support = n
```
Note: `--bobconfig`/`-b` MUST come AFTER `create` and BEFORE the template/name
positionals (the chained click group consumes a leading `-b`).

## Generated layout (what plonecli produces, verified)
```
<src>/<DOTTED_NAME>/
├── pyproject.toml                 # [project] name, dependencies, entry-points
├── Makefile, README.md, LICENSE.GPL, instance.yaml, bobtemplate.cfg, news/
├── src/<dotted>/                  # e.g. src/politikus/site/
│   ├── __init__.py                # __version__ = "1.0.0a0"
│   ├── configure.zcml             # <include file="profiles.zcml" /> etc.
│   ├── profiles.zcml              # registerProfile default + uninstall + upgrades
│   ├── setuphandlers/__init__.py  # HiddenProfiles: hides :uninstall from quickinstall
│   ├── upgrades/__init__.py + configure.zcml   # upgrade steps live here
│   ├── profiles/default/          # metadata.xml, browserlayer.xml, types, ...
│   └── profiles/uninstall/
```
- `profiles/default/metadata.xml`: `<version>1000</version>` + `<dependencies>`.
  **Change the `<dependency>` from `profile-plone.volto:default` to
  `profile-plone.classicui:default` for a Classic UI add-on** (see mechanism
  above). Add the 7 Politikus profile dependencies here for auto-install.
- Install behavior: `profiles/default/` (runs at install). Uninstall behavior:
  `profiles/uninstall/` (runs at uninstall). Upgrades: `upgrades/` with
  `profile="politikus.site:default"` and `source/destination` version steps
  (see upgrades section below).
- The `HiddenProfiles` handler hides `:uninstall` from site-creation and
  quickinstaller (so only `:default` is offered as an installable profile) —
  this is the template default; keep it.

### Auto-install of the 7 add-ons (the core requirement)
In `pyproject.toml [project] dependencies`, add the 7 dotted modules:
```toml
dependencies = [
    "Products.CMFPlone",
    "plone.api",
    "plone.restapi",
    "plone.classicui",                 # Classic UI distribution (NOT plone.volto)
    "politikus.contenttypes",
    "politikus.popolo",
    "politikus.ocds",
    "politikus.bods",
    "collective.vocabularies.iso",
    "politikus.extractives",
    "politikus.naturalresource",
]
```
And in `profiles/default/metadata.xml`:
```xml
<metadata>
  <version>1000</version>
  <dependencies>
    <dependency>profile-plone.classicui:default</dependency>
    <dependency>profile-politikus.contenttypes:default</dependency>
    <dependency>profile-politikus.popolo:default</dependency>
    <dependency>profile-politikus.ocds:default</dependency>
    <dependency>profile-politikus.bods:default</dependency>
    <dependency>profile-collective.vocabularies.iso:default</dependency>
    <dependency>profile-politikus.extractives:default</dependency>
    <dependency>profile-politikus.naturalresource:default</dependency>
  </dependencies>
</metadata>
```

## Wiring into buildout.cfg (mr.developer git source)
After the add-on is generated at `src/politikus.site/`, add to
`/home/kaeru/src/plone/politikus/buildout.cfg`:
1. `[sources]` (top section):
   ```
   politikus.site = git git@github.com:Sinar/politikus.site.git branch=plone6
   ```
2. `auto-checkout =` list: add `politikus.site` (one per line, indented).
3. `develop =` list: add `src/politikus.site` (one per line, indented).
4. `[instance] eggs =`: add `politikus.site` (one per line, indented).
   (`[scripts]` reuses `${instance:eggs}` so no change needed there.)

Match the existing style exactly: git SSH URL `git@github.com:Sinar/<name>.git`,
`branch=plone6`. The existing 7 entries use this exact form.

### The branch must exist
The new add-on's git repo starts on `main` with no commits. To make buildout's
`branch=plone6` resolve, rename/create the branch:
```bash
git -C /home/kaeru/src/plone/politikus/src/politikus.site checkout -b plone6
```

## Git: commit (and push once a remote exists)
- Commit the generated + edited add-on in its own repo:
  ```bash
  cd /home/kaeru/src/plone/politikus/src/politikus.site
  git add -A
  git commit -m "Add politikus.site Classic UI site add-on"
  ```
- The remote `git@github.com:Sinar/politikus.site.git` does **not** exist yet
  (verified: `git ls-remote` returns "Repository not found"). There is no
  `gh` CLI and no GitHub token on this box. **Do not attempt to push until the
  user has created the empty repo**; then `git push -u origin plone6`.

## Upgrade steps (add later as profiles change)
`profiles.zcml` already does `<include package=".upgrades" />` and
`upgrades/configure.zcml` holds the upgrade-step definitions. To add an upgrade
step when the profile version changes:
```xml
<genericsetup:upgradeSteps
    profile="politikus.site:default"
    source="1000"
    destination="1001"
    handler=".steps.upgrade_to_1001">
  <genericsetup:upgradeDepends
      title="Politikus site v1001"
      import_steps="plone.app.registry" />
</genericsetup:upgradeSteps>
```
Implement `upgrade_to_1001(context)` in `upgrades/steps.py`. Bump the
`<version>` in `profiles/default/metadata.xml` to the new number.

## Verification (always do this after wiring)
```bash
export PATH="$HOME/.local/bin:$HOME/.opencode/bin:$PATH"
cd /home/kaeru/src/plone/politikus
# 1. The add-on package imports cleanly (develop-egg present after buildout):
bin/zopepy -c "import politikus.site; print('import ok', politikus.site.__version__)" 2>&1 | tail -5
# 2. Full buildout resolves the new egg + source checkout:
timeout 590 bin/buildout 2>&1 | grep -iE "politikus.site|error|failed|mr.developer" | tail -20
# 3. Confirm the egg landed in develop-eggs / eggs:
ls develop-eggs 2>/dev/null | grep -i politikus.site
```
A clean buildout run (exit 0, "Finished") with `politikus.site` in the egg
list is the success criterion. If the git remote is missing, buildout's
mr.developer will fail to clone — that is expected until the repo is created;
the develop egg still builds from the local `src/politikus.site`.

## Pitfalls
- `plonecli` interactive prompts: a bare `uvx plonecli create addon <name>`
  without piped answers HANGS waiting on stdin. Always pipe the 8 answers.
- `--bobconfig`/`-b` flag position: it must follow `create`, else
  "No such option '-b'".
- Dotted module vs git repo name: the profile ID / egg / `develop` path use the
  **dotted module** name; the `[sources]` line uses the **git repo** name
  (`git@github.com:Sinar/politikus.site.git`).
- Template ships Volto dependency by default — forget to switch to
  `plone.classicui` and you get the Angular frontend, not Classic UI.
- Don't push before the user creates the empty GitHub repo.
- **Build backend: use setuptools, not hatchling.** The plonecli template
  generates a hatchling `[build-system]`, but zc.buildout's develop step CANNOT
  generate egg-info metadata for a hatchling PEP 517 package — the add-on gets an
  egg-link but no egg-info, and buildout then fails with
  `Error: Couldn't find a distribution for '<name>'` (it falls back to PyPI).
  All existing Sinar add-ons use setuptools. Fix: set
  `[build-system] requires = ["setuptools>=61"]` / `build-backend =
  "setuptools.build_meta"`, add `[tool.setuptools.packages.find] where = ["src"]
  namespaces = true`, and create `src/<ns>/__init__.py` containing
  `__import__('pkg_resources').declare_namespace(__name__)` (old-style namespace,
  matching the other add-ons). Verify with an offline
  `pip wheel --no-deps --no-build-isolation` before running buildout.
