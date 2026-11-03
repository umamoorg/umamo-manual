# Configuration file for the Umamo manual.
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------

project = "Umamo Manual"
copyright = "Umamo Project Contributors"
author = "Umamo Project Contributors"

# Keep these in step with VERSION in the Umamo repository's
# module/ui/src/commonMain/kotlin/org/umamo/ui/help/ProjectInfo.kt.
version = "0.5"
release = "0.5.0"

# -- General configuration ---------------------------------------------------

extensions = [
    "myst_parser",
    "sphinx.ext.todo",
    "sphinx.ext.extlinks",
    "sphinx_copybutton",
    "sphinx_design",
]

source_suffix = {
    ".rst": "restructuredtext",
    ".md": "markdown",
}
root_doc = "index"
exclude_patterns = ["_build", "**/.DS_Store"]

# Turn this off for a release build once the manual has real content.
todo_include_todos = True

extlinks = {
    "issue": ("https://github.com/umamoorg/umamo/issues/%s", "#%s"),
}

# -- MyST (Markdown) ---------------------------------------------------------

myst_enable_extensions = [
    "colon_fence",
    "deflist",
]
myst_heading_anchors = 3

# -- Internationalization ----------------------------------------------------

language = "en"
locale_dirs = ["../locale/"]
gettext_compact = False

# -- HTML output -------------------------------------------------------------

html_theme = "furo"
html_title = f"Umamo Manual {version}"
html_static_path = ["_static"]
html_css_files = ["css/custom.css"]

html_theme_options = {
    "source_repository": "https://github.com/umamoorg/umamo-manual/",
    "source_branch": "main",
    "source_directory": "manual/",
}
