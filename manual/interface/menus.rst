*****
Menus
*****

The menu bar is at the top left of the window, before the workspace tabs.  It has four menus: File, Edit, Workspace, and Help.  The bar is part of Umamo's window and not of the operating system, so it looks and works the same on every system.  Open a menu with a click.  While one is open, moving the pointer over another label switches to it, so you can sweep along the bar.  :kbd:`Escape` closes the open menu.

A row that cannot be used now is greyed out.  A row with a small arrow opens a submenu.  The shortcut of a row, if it has one, is written at its right end.  The shortcuts shown are those of the keymap preset you use, and this page gives those of the default preset.  See :doc:`/interface/keymap`.

Every row is also a command in the command palette, so any of them can be run without the menu.  See :doc:`/interface/command_palette`.

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: The menu bar with the File menu open, and the Import submenu open from it.
	:Setup: Open a document, open File, and move the pointer over Import.
	:Crop: The top left of the window.
	:Save as: ``images/interface/file_menu.png``
	:Caption: The File menu with the Import submenu.

File
====

.. list-table::
	:header-rows: 1

	* - Row
	  - Shortcut
	  - Does
	* - :guilabel:`New`
	  - :kbd:`Ctrl-N`
	  - Replaces the document with an empty one.
	* - :guilabel:`Open…`
	  - :kbd:`Ctrl-O`
	  - Opens a UMA file.
	* - :guilabel:`Open Recent`
	  - —
	  - A submenu of the last ten documents.  It is greyed out until there is one.
	* - :guilabel:`Save`
	  - :kbd:`Ctrl-S`
	  - Saves the document.  Greyed out for a document that cannot be saved.
	* - :guilabel:`Save As…`
	  - :kbd:`Ctrl-Shift-S`
	  - Saves the document to a file of your choice.
	* - :guilabel:`Import`
	  - —
	  - A submenu.  See below.
	* - :guilabel:`Export`
	  - —
	  - A submenu.  See below.
	* - :guilabel:`Exit`
	  - —
	  - Closes Umamo, after asking about unsaved changes.

The first five rows work on Umamo's own documents.  See :doc:`/files/uma`.  The window's close button and the quit command of your system do what :guilabel:`Exit` does.

Import
------

.. list-table::
	:header-rows: 1

	* - Row
	  - Shortcut
	  - Does
	* - :guilabel:`Artwork…`
	  - :kbd:`Ctrl-Shift-O`
	  - Adds layered artwork or a flat image to the document.  See :doc:`/artwork/importing`.
	* - :guilabel:`CMO3…`
	  - —
	  - Replaces the document with the model in a Cubism Editor project.  See :doc:`/files/cubism_interchange`.
	* - :guilabel:`MOC3…`
	  - —
	  - Replaces the document with the model in a baked MOC3 and its files.

Export
------

.. list-table::
	:header-rows: 1

	* - Row
	  - Shortcut
	  - Does
	* - :guilabel:`CMO3…`
	  - —
	  - Writes a Cubism Editor project.
	* - :guilabel:`MOC3…`
	  - —
	  - Writes a baked model and its files, after a dialog of options.
	* - :guilabel:`Image…`
	  - —
	  - Writes a picture of the posed model.

See :doc:`/files/exporting`.

Edit
====

.. list-table::
	:header-rows: 1

	* - Row
	  - Shortcut
	  - Does
	* - :guilabel:`Undo`
	  - :kbd:`Ctrl-Z`
	  - Takes back the last step.  Greyed out when there is none.
	* - :guilabel:`Redo`
	  - :kbd:`Ctrl-Shift-Z`
	  - Does a step again that you took back.  Greyed out when there is none.
	* - :guilabel:`Settings…`
	  - :kbd:`Ctrl-Comma`
	  - Opens the Settings window.

The History editor lists the steps and can jump to any of them.  See :doc:`/editors/history`.  The settings are described in :doc:`/interface/settings`.

Workspace
=========

.. list-table::
	:header-rows: 1

	* - Row
	  - Shortcut
	  - Does
	* - :guilabel:`Previous Workspace`
	  - :kbd:`Ctrl-PageUp`
	  - Goes to the tab on the left.
	* - :guilabel:`Next Workspace`
	  - :kbd:`Ctrl-PageDown`
	  - Goes to the tab on the right.
	* - :guilabel:`New Workspace`
	  - —
	  - Adds a workspace.
	* - :guilabel:`Reset Workspace`
	  - —
	  - Puts the current workspace back to its starting layout.
	* - :guilabel:`Import Workspace…`
	  - —
	  - Reads a workspace or all workspaces from a file.
	* - :guilabel:`Export This Workspace…`
	  - —
	  - Saves the current workspace to a file.
	* - :guilabel:`Export All Workspaces…`
	  - —
	  - Saves every workspace to a file.

See :doc:`/interface/workspaces`.

Help
====

.. list-table::
	:header-rows: 1

	* - Row
	  - Does
	* - :guilabel:`Source Code…`
	  - Opens the project's source code on GitHub in your browser.
	* - :guilabel:`Web Site…`
	  - Opens ``umamo.org``.
	* - :guilabel:`Documentation…`
	  - Opens this manual, at ``docs.umamo.org``.
	* - :guilabel:`Quick Setup…`
	  - Opens the window of first choices again.  See :doc:`/getting_started/first_launch`.
	* - :guilabel:`Check for Updates…`
	  - Asks whether a newer version is out.  See :doc:`/getting_started/updating`.
	* - :guilabel:`Open Log Folder…`
	  - Opens the folder of log files in your file manager.  See :doc:`/troubleshooting/reporting_bugs`.
	* - :guilabel:`Credits…`
	  - Shows the credits and the licenses of the software that Umamo is built with.
	* - :guilabel:`About Umamo…`
	  - Shows the name, the version, and the license, with links to the project.

:guilabel:`Check for Updates…` and :guilabel:`Open Log Folder…` are only in the builds that can do them, which today are the desktop builds.

.. seealso::

	* :doc:`/interface/workspaces`
	* :doc:`/files/uma`
	* :doc:`/files/exporting`
	* :doc:`/interface/settings`
	* :doc:`/appendices/default_shortcuts`
