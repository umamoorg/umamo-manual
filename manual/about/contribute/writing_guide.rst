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

Page Outlines
=============

Every page starts as an outline: a title, a ``todo`` that says what the page covers, and the empty headings it will be written under.  Fill in the sections under the headings and delete the ``todo`` when the page is done.

Use the name the Umamo window shows for anything on screen, such as a menu row, a button, or a section of the Properties editor.  The strings are in ``module/ui/src/commonMain/composeResources/values/strings.xml`` in the Umamo repository.

Reference Blocks
================

A section about one operator or tool starts with a Reference block that says where to find it:

.. code-block:: rst

	.. admonition:: Reference
		:class: refbox

		:Mode: Edit Mode
		:Menu: :menuselection:`File --> Import --> Artwork…`
		:Shortcut: :kbd:`Ctrl-Shift-O`

``Mode``
	The editor mode the operator is available in.  Leave the line out when it works in any mode.

``Menu``
	The menu path, written with ``menuselection``.  Use ``Context menu`` for the right-click menu, ``Toolbar`` for a Toolbar button, and ``Command palette`` for an operator that is only reachable there.

``Shortcut``
	The shortcut of the Default keymap preset, written with ``kbd``.  Write ``Ctrl`` for the primary modifier, which is ``Cmd`` on macOS.  A shortcut that uses the Control key itself, such as Toggle Pose Mode, stays ``Ctrl`` on macOS, so say so on that page.  Spell out punctuation and numpad keys (``Minus``, ``Period``, ``NumpadPlus``) so that ``kbd`` does not mistake them for separators.

Leave out any line you cannot confirm instead of leaving it empty.

See Also
========

End each page with a ``seealso`` block that links to the related pages.  Link with ``doc`` and an absolute path, so that moving a page does not break the links:

.. code-block:: rst

	.. seealso::

		* :doc:`/editors/outliner`

Pages Not Yet Available
=======================

Some pages describe a feature that Umamo does not have yet.  They start with a ``Not yet available`` admonition and outline Current Status, What Works Today, and Planned.  A page for a feature that works, but not completely, ends with a Current Limitations section instead.

.. todo:: Write the rest of the guide: figures and screenshots, other cross-references, and tone.
