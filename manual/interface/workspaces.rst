**********
Workspaces
**********

A workspace is a named arrangement of areas for one kind of work.  The tabs along the top of the window are the workspaces, and a click on one swaps the whole arrangement.  Umamo comes with three, and you can make as many more as you like.  Workspaces belong to the editor and not to a specific puppet file: they are the same whichever puppet file is open.

Default Workspaces
==================

Modelling
---------

The workspace that Umamo opens in.  It is made for building and keying a rig:

* The **Parameters** editor is on the left, in a narrow column.
* The **2D Viewport** is in the middle, above the **Keyform Sheet**.
* The **Outliner** is on the right, above the **Properties** editor.

Texture
-------

The workspace for the texture atlas and the artwork that feeds it:

* Two **UV Editors**, one above the other, are on the left.  Each one chooses for itself which atlas page or source layer to show.
* The **2D Viewport** is in the middle.
* The **Sources** editor, the **Outliner**, and the **Properties** editor are in a column on the right, from top to bottom.

.. figure:: /images/interface/default_workspace.png

	The Texture workspace.

Physics
-------

A single **2D Viewport**.  It is a placeholder for the physics tools, which do not exist yet.  See :doc:`/rigging/physics`.

The Tab Strip
=============

The tabs are at the top of the window, to the right of the menus.  The tab of the workspace you are in is highlighted.

* Click a tab to go to that workspace.
* Click the :guilabel:`+` at the end to add a new workspace.  It starts as a single 2D Viewport and is named ``Workspace``, or ``Workspace 2`` and so on if that name is taken.
* Double-click a tab to rename it.  :kbd:`Enter` keeps the name and :kbd:`Escape` goes back to the old one.
* Drag a tab to reorder the tabs.  Press the tab and hold it for a moment before you move, so that a click that slips is not taken for a drag.
* Right-click a tab for its menu.

The menu of a tab has :guilabel:`Rename`, :guilabel:`Duplicate`, and :guilabel:`Delete`, and below them :guilabel:`Previous Workspace` and :guilabel:`Next Workspace` with their shortcuts.  :guilabel:`Duplicate` copies the workspace, with all of its areas, into a new tab right after it, named with ``copy``.  :guilabel:`Delete` removes the workspace.  The last workspace cannot be deleted, so the strip is never empty.

The names of the three built-in workspaces follow the language of the interface.  Once you rename one, it remembers the name that you entered.  User renamed workspaces will not automatically change language when switching the interface language.

.. figure:: /images/interface/workspace_tab_strip.png

	The context menu of a workspace tab.

Workspace Menu
==============

The Workspace menu has the commands that work on workspaces.  They are in the command palette as well.

.. list-table::
	:header-rows: 1

	* - Row
	  - Shortcut
	  - Does
	* - :guilabel:`Previous Workspace`
	  - :kbd:`Ctrl-PageUp`
	  - Goes to the tab on the left.  From the first tab it wraps around to the last.
	* - :guilabel:`Next Workspace`
	  - :kbd:`Ctrl-PageDown`
	  - Goes to the tab on the right, and wraps around to the first.
	* - :guilabel:`New Workspace`
	  - —
	  - The same as the ``+`` button.
	* - :guilabel:`Reset Workspace`
	  - —
	  - See `Reset Workspace`_.
	* - :guilabel:`Import Workspace…`
	  - —
	  - See `Exporting and Importing Workspaces`_.
	* - :guilabel:`Export This Workspace…`
	  - —
	  - See `Exporting and Importing Workspaces`_.
	* - :guilabel:`Export All Workspaces…`
	  - —
	  - See `Exporting and Importing Workspaces`_.

The shortcuts are those of the default keymap.  See :doc:`/interface/keymap`.

Reset Workspace
===============

.. admonition:: Reference
	:class: refbox

	:Menu: :menuselection:`Workspace --> Reset Workspace`

Reset Workspace puts the workspace you are in back to its starting layout.  Umamo asks first: ``Reset this workspace to its default layout?``, with :guilabel:`Reset` and :guilabel:`Cancel`.

A built-in workspace goes back to its layout as described above.  A workspace that you made goes back to a single 2D Viewport.  The other workspaces are not touched.

Use it when you have split and joined areas until you cannot find your way, or when you closed an area you need.

Exporting and Importing Workspaces
==================================

A layout can be saved to a file, to share it or to carry it to another computer.  The file is plain text in the JSON format.

:menuselection:`Workspace --> Export This Workspace…`
	Saves the workspace you are in.  The name of the workspace suggests the name of the file.

:menuselection:`Workspace --> Export All Workspaces…`
	Saves every workspace, with the order of the tabs, and the one that is active.  The suggested name is ``workspaces``.

:menuselection:`Workspace --> Import Workspace…`
	Reads one of those files.  Umamo tells which kind it is from the contents of the file:

	* A file with **one workspace** is added as a new tab after the others, and made active.  Its name is kept, and gets a number if you already have one of that name.
	* A file with **all the workspaces** replaces every workspace you have.  Umamo asks first: ``Replace all workspaces with the imported file?``
	* Any other file is refused.  The log says so, and the layout stays as it was.

An export saves the layout as it is on screen, including a change that you made a moment before.

What a Workspace Remembers
==========================

A workspace remembers how its areas are divided: The splits, the size of each area, and which editor each area shows.  It also remembers its name, and the position of its tab.  Umamo saves all of that in your settings as you change it, so the next start has the same tabs.  See :doc:`/getting_started/configuration`.

A workspace does not remember what is in the editors.  The pan and zoom of a viewport, the open branches of the Outliner, the filters, and the other state of each area belong to the puppet file that you have open, and are saved in it.  See :doc:`/files/uma`.

.. seealso::

	* :doc:`/interface/window_system`
	* :doc:`/getting_started/configuration`
	* :doc:`/interface/menus`
