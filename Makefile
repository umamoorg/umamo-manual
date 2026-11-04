# Minimal makefile for Sphinx documentation.
#
# Typical use:
#   make venv        # once: create .venv and install the dependencies
#   make html        # build into build/html
#   make livehtml    # build, serve on http://127.0.0.1:8000 and rebuild on every change

VENV         ?= .venv
SPHINXBUILD  ?= $(VENV)/bin/sphinx-build
SPHINXAUTO   ?= $(VENV)/bin/sphinx-autobuild
SPHINXINTL   ?= $(VENV)/bin/sphinx-intl
SPHINXOPTS   ?=
SOURCEDIR    = manual
BUILDDIR     = build
LOCALEDIR    = locale

.PHONY: help venv livehtml check gettext update-po clean Makefile

help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
	@echo
	@echo "Project targets:"
	@echo "  venv          Create $(VENV) and install requirements-dev.txt"
	@echo "  livehtml      Serve the manual and rebuild when a file changes"
	@echo "  check         Build with warnings as errors and nitpicky references"
	@echo "  gettext       Extract translatable strings to $(BUILDDIR)/gettext"
	@echo "  update-po     Create or update the catalogs for one language: make update-po LANG_CODE=fr"
	@echo "  clean         Remove $(BUILDDIR)"

venv:
	python3 -m venv $(VENV)
	$(VENV)/bin/pip install -r requirements-dev.txt

livehtml:
	$(SPHINXAUTO) "$(SOURCEDIR)" "$(BUILDDIR)/html" $(SPHINXOPTS) $(O)

check:
	$(SPHINXBUILD) -b html -W --keep-going -n "$(SOURCEDIR)" "$(BUILDDIR)/html" $(SPHINXOPTS) $(O)

gettext:
	$(SPHINXBUILD) -b gettext "$(SOURCEDIR)" "$(BUILDDIR)/gettext" $(SPHINXOPTS) $(O)

update-po: gettext
ifndef LANG_CODE
	$(error Set a language code: make update-po LANG_CODE=fr)
endif
	$(SPHINXINTL) update -p "$(BUILDDIR)/gettext" -l $(LANG_CODE) -d $(LOCALEDIR)

clean:
	rm -rf "$(BUILDDIR)"

# Catch-all target: route all unknown targets to Sphinx using the new "make mode" option.
# $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
