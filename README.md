# Umamo Manual

The user manual for [Umamo](https://github.com/umamoorg/umamo), built with [Sphinx](https://www.sphinx-doc.org/) and the [Furo](https://pradyunsg.me/furo/) theme.  It is published at [docs.umamo.org](https://docs.umamo.org/).

## Building

You need Python 3.13 or newer.

```bash
make venv       # Once: creates .venv and installs requirements-dev.txt
make html       # Builds the manual into build/html
make livehtml   # Serves it on http://127.0.0.1:8000 and rebuilds whenever a file changes
make check      # Builds with warnings as errors; run this before sending a change
```

The `Makefile` uses `.venv/bin/sphinx-build`.  On Windows, `make.bat` does the same with `.venv\Scripts\sphinx-build.exe`.

## Publishing

The workflow in `.github/workflows/pages.yml` runs `make check` on every pull request.  A push to `master` runs the same build and publishes `build/html` to GitHub Pages, which serves it at [docs.umamo.org](https://docs.umamo.org/).  A build with warnings will not be deployed.  To publish again without a new commit run the workflow on `master` from the repository's Actions tab or run the workflow manually(`gh workflow run pages.yml --ref master`).

## Layout

| Path                          | Contents                                                                                    |
| ----------------------------- | ------------------------------------------------------------------------------------------- |
| `manual/`                     | The Sphinx source: `conf.py`, `index.rst`, and one folder per chapter.                      |
| `manual/_static/`             | Static files for the HTML output (CSS, logo).                                               |
| `locale/`                     | Translation catalogs: `locale/<language>/LC_MESSAGES/*.po`.                                 |
| `requirements.txt`            | What it takes to build the manual.  The Pages workflow and Read the Docs install this file. |
| `requirements-dev.txt`        | The above, plus `sphinx-autobuild` and `sphinx-intl`.                                       |
| `.github/workflows/pages.yml` | The GitHub Pages build and deployment.  See Publishing.                                     |
| `.readthedocs.yaml`           | The Read the Docs build.                                                                    |
| `.editorconfig`               | Editor settings: reStructuredText is indented with tabs.                                    |

Pages are written in reStructuredText.  MyST Markdown (`.md`) is also enabled.  Each chapter is a folder holding an `index.rst` with its table of contents.  A page that is not written yet holds a `.. todo::` that says what it will cover, and the empty headings it will be written under.  The heading, indentation, Reference block, and See also conventions are in the manual's Writing Guide (`manual/about/contribute/writing_guide.rst`).

The version in `manual/conf.py` is written by hand: keep it in step with `VERSION` in Umamo's `ProjectInfo.kt`.

## Translations

Translations use gettext through `sphinx-intl`.

```bash
make gettext                  # Extracts the translatable strings into build/gettext
make update-po LANG_CODE=fr   # Creates or updates locale/fr/LC_MESSAGES/*.po
make html O="-D language=fr"  # Builds the French manual
```

Only the `.po` files are committed.  The `.pot` templates and compiled `.mo` files are generated and ignored.

## License

GPLv3.  See [LICENSE](LICENSE).
