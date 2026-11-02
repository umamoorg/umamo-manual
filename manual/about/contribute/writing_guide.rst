***************
Writing Guide
***************

Headings
========

Use the same heading characters on every page so that the page tree nests correctly.

.. list-table::
	:header-rows: 1

	* - Level
	  - Characters
	* - Page title
	  - ``*`` above and below the title
	* - Section
	  - ``=`` below
	* - Subsection
	  - ``-`` below
	* - Sub-subsection
	  - ``^`` below

Indentation
===========

Indent with one tab for each level, not with spaces.  This covers directive options and content, such as the entries of a ``toctree`` and the rows of a ``list-table``.

When a line continues a list item, such as the ``- Characters`` cell in the table above, put two spaces after the tab so that it lines up with the text of the item.

Markup
======

Pages are written in reStructuredText.  MyST Markdown (``.md``) is also enabled.

.. todo:: Write the rest of the guide: roles for keys and menus, figures and screenshots, cross-references, and tone.
