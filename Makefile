
VENV         ?= .venv
SOURCEDIR    = manual
BUILDDIR     = build
LOCALEDIR    = locale
SPHINXOPTS   ?=

# -----------------------------------------------------------------------------
# OS Detection & Environment Setup
# -----------------------------------------------------------------------------
ifeq ($(OS),Windows_NT)
    PYTHON = python
    EXE = .exe
    VENV_PYTHON = $(VENV)/Scripts/python.exe
    BIN_PREFIX = $(VENV)/Scripts/
    RM_RF = if exist "$(BUILDDIR)" rmdir /s /q "$(BUILDDIR)"
else
    PYTHON = python3
    EXE =
    VENV_PYTHON = $(VENV)/bin/python
    BIN_PREFIX = $(VENV)/bin/
    RM_RF = rm -rf "$(BUILDDIR)"
endif

# Automatically detect whether the virtual environment exists.
ifeq ($(wildcard $(VENV_PYTHON)),)
    BIN_PREFIX =
    ACTIVE_ENV = global
else
    ACTIVE_ENV = venv
endif

SPHINXBUILD ?= $(BIN_PREFIX)sphinx-build$(EXE)
SPHINXAUTO  ?= $(BIN_PREFIX)sphinx-autobuild$(EXE)
SPHINXINTL  ?= $(BIN_PREFIX)sphinx-intl$(EXE)

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
	@echo "  Environment:  $(ACTIVE_ENV)"

venv:
	$(PYTHON) -m venv "$(VENV)"
	$(VENV_PYTHON) -m pip install -r requirements-dev.txt

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
	$(SPHINXINTL) update -p "$(BUILDDIR)/gettext" -l $(LANG_CODE) -d "$(LOCALEDIR)"

clean:
	$(RM_RF)

# Catch-all target.
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
