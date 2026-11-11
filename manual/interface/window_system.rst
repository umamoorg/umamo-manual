*************
Window System
*************

Umamo's window is divided into areas.  Each area shows one editor and you can split the window into as many areas as you like, join them again, resize them, and switch any area to any other editor.  This allows you complete freedom to layout your workspaces how you desire.  The areas of a window make a workspac, and the workspaces are the tabs along the top.  See :doc:`/interface/workspaces`.

Anatomy of the Window
=====================

From top to bottom the window has:

#. **The title bar** of your operating system.
#. **The menu bar and the workspace tabs**, in one row.  The menus are on the left, and the tabs fill the rest.  See :doc:`/interface/menus`.
#. **The areas**, which take all the space that is left.
#. **The status bar**, a strip at the bottom with shortcut hints, the selected item, and the size of the model.  See :doc:`/interface/status_bar`.

Dialogs and the command palette open over the window and take the keyboard until you close them.

.. figure:: /images/interface/main_window.png

	The parts of the Umamo Editor window: The title bar, menu bar, workspace, and the status bar.

Window Title and State
======================

The title of the window is ``Umamo``, a dash, and the name of the puppet file: ``Umamo - Untitled`` for an empty puppet file.  A ``*`` after the name means that there are unsaved changes, and ``(read-only)`` means that the file cannot be saved.  See :doc:`/files/uma`.

Umamo remembers the size and place of the window and whether it was maximized or full screen, and opens the same way next time.  On Windows 11 it tints the title bar to the color of the interface, so a light or dark theme does not leave a bright strip at the top.  See :doc:`/getting_started/configuration`.

Areas
=====

Every area has a **header**, a thin bar across its top, and a **body** under it.  The body is the editor.  The header has the editor type on its left, and then the controls of that editor.  When there is not room for all of them, the ones that do not fit are put in a menu at the end of the header, and the editor type never moves.

An area keeps its state for as long as it exists.  If you switch it to another editor and back, the first editor is as you left it.  The view of each area, such as the pan and zoom of a viewport, is saved in the puppet file.  See :doc:`/files/uma`.

The border of the area under the pointer is a little brighter than the others.

The 2D Viewport and the UV Editor are the work surfaces.  They are the only editors that can show the operation strip.  See :doc:`/interface/operation_strip`.

Editor Types
============

The dropdown at the left end of an area's header switches the area to another editor.  The new editor takes the place of the old one, and nothing else in the layout changes.

.. list-table::
	:header-rows: 1

	* - Editor
	  - What it is
	  - Read
	* - 2D Viewport
	  - The model, drawn, where you select, transform, and edit it.
	  - :doc:`/editors/viewport_2d/index`
	* - UV Editor
	  - The texture atlas pages and the source artwork, and the UVs of the meshes.
	  - :doc:`/editors/uv_editor/index`
	* - Sources
	  - The artwork files and layers that the model was made from.
	  - :doc:`/editors/sources`
	* - Outliner
	  - The tree of parts, deformers, and drawables.
	  - :doc:`/editors/outliner`
	* - Parameters
	  - The sliders and pads for every parameter.
	  - :doc:`/editors/parameters`
	* - Keyform Sheet
	  - The keys of each object, in tracks across a parameter's range.
	  - :doc:`/editors/keyform_sheet`
	* - Properties
	  - The puppet, the selected object, and its data, in three tabs.
	  - :doc:`/editors/properties/index`
	* - Tool Settings
	  - Reserved for the settings of the active tool.  It is empty today.
	  - :doc:`/editors/tool_settings`
	* - History
	  - Every undo step, with the current one marked.
	  - :doc:`/editors/history`
	* - Logs
	  - The messages that Umamo writes while it runs.
	  - :doc:`/editors/logs`

You can have the same editor in several areas at once.  The Texture workspace has two UV Editors, for example, each with its own view.  See :doc:`/editors/index`.

Area Context Menu
=================

Right-click an area's header to open its menu.  In the body of an area, many editors open a menu of their own instead, such as the 2D Viewport's context menu.

:guilabel:`Split Left/Right`
	Splits the area into two side by side.  The new area shows the same editor.

:guilabel:`Split Top/Bottom`
	Splits the area into two, one above the other.

:guilabel:`Change Editor Type`
	A submenu with every editor, the same as the dropdown in the header.

:guilabel:`Close Area`
	Closes the area.  The area next to it grows to fill the space.  The last area of a workspace cannot be closed.

.. figure:: /images/interface/area_context_menu.png

	The context menu of an area, opened from its header.

Splitting, Joining, and Docking Areas
=====================================

Each corner of an area is a handle.  Drag from a corner with the left button, and what happens depends on where you drag to.  An outline shows the result before you let go.

**Split.**  Drag inward, into the area you started in.  Once you have moved a short way, the direction that you moved in is chosen, and the new border follows the pointer.  Let go to split the area there.  The new area shows the same editor as the old one.

**Join.**  Drag into the area next to you, when the two areas share a whole edge.  The area that you dragged from grows over the other one, which is closed.

**Dock.**  Drag into an area that does not share a whole edge with yours.  The area that you dragged from moves to an edge of the whole workspace, and takes the full width or height there.  The edge goes with the part of the other area that the pointer is over: its top, bottom, left, or right.  The area that it came out of is closed up behind it.

Press :kbd:`Escape` while you drag to cancel.  The context menu does the same as a split, with no dragging, and :guilabel:`Close Area` does a close.

.. video:: /images/interface/interface.mp4
	:caption: Demonstration of splitting, joining, and docking.
	:width: 100%

Resizing with Splitters
=======================

The thin bar between two areas is a splitter.  The pointer turns into arrows over it.  Drag it to move the border.  Only the two areas that touch the splitter change size, and the others keep theirs.  An area cannot be made smaller than 48 pixels.

Press :kbd:`Escape` during the drag to cancel it.

Which Area Gets the Input
=========================

Keyboard shortcuts go to the area that was last selected.  Move the pointer over the 2D Viewport, and :kbd:`G` grabs in it.  Move it over the Outliner, and the keys of the Outliner apply.  An area does not need a click to be active.

The area stays selected when the pointer moves to the menu bar, the tabs, or the status bar, so a shortcut still works after you glance at them.  It stops being selected when you close the area or switch it to another editor.  The command palette, and the hints in the status bar, follow the same area.  See :doc:`/interface/command_palette`.

A menu command that works on the whole puppet file, such as Save, does not depend on the area.  A few, such as Export Image, use the last 2D Viewport that was selected.

Escape Precedence
=================

:kbd:`Escape` does the nearest thing first.  When several of these are true at the same time, the first one in the list takes priority:

#. A question dialog, such as the unsaved-changes prompt, is cancelled.
#. An alert or a report, such as the export report, is dismissed.
#. An open menu is closed.
#. A shortcut that is being captured in Settings is cancelled.
#. A number field that you are dragging goes back to its value.
#. Settings, Quick Setup, the About and Credits windows, the export options, and the command palette are closed, the topmost first.
#. A workspace tab that you are renaming goes back to its name.
#. A transform in progress, such as a grab, is cancelled.  :kbd:`Enter` confirms it instead.
#. An open pie menu is closed.
#. An armed Box Select or Circle Select tool is put away.
#. An armed marquee in the Keyform Sheet, an armed picker for a relation, an armed Zoom Region, a drag of a row, a drag of a splitter or of a corner, and a drag that selects are each cancelled.
#. In Object Mode, the selection is cleared.

In Edit Mode and Pose Mode, an Escape that finds nothing to cancel does nothing, so that the selection stays.

.. seealso::

	* :doc:`/interface/workspaces`
	* :doc:`/editors/index`
	* :doc:`/interface/keymap`
