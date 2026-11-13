*******
Sidebar
*******

The sidebar is a set of panels that float over the right edge of a 2D Viewport or a UV Editor.  It has the exact values of what you have selected, the settings of the active tool, and the view.  Use it to type a number where the pointer would only come close.

Opening and Resizing
====================

The sidebar is closed at first.  A small pull tab shows at the top of the right edge of the area.

* Click the **pull tab**, or press :kbd:`N`, to open the sidebar.  :kbd:`N` opens it and closes it again for the area under the pointer.
* Drag the **inner edge** of the panels to change their width.  It can be from 160 to 480 pixels wide, and it starts at 200.  Drag it narrower than the minimum and the sidebar closes.
* In an area too narrow for the narrowest sidebar, only the pull tab shows, and the sidebar opens when the area grows.

Whether the sidebar is open, how wide it is, which tab it shows, and which panels are folded belong to the area, and are saved in the puppet file.  :guilabel:`Show Sidebar by Default` in Settings decides what an area that you have not touched does.  See :doc:`/interface/settings`.

The sidebar floats over the viewport and does not take any room from it, and the pointer does not reach the viewport through its panels.

.. figure:: /images/editors/viewport_sidebar.png

	The sidebar of the 2D Viewport.

Tabs and Panels
===============

A column of tabs stands beside the panels.  There are three, in this order: :guilabel:`Item`, :guilabel:`Tool`, and :guilabel:`View`.  The tab you chose last is shown, and the first one when you have not chosen.  A tab is on the rail only if it has a panel for this editor.

Item Tab
--------

The :guilabel:`Item` tab has the :guilabel:`Transform` panel, for what you have selected.

In **Object Mode** it shows the same transform rows as the Properties editor does, for the item that is active: its position and its size.  They are the same values, written the same way, so an edit in one shows in the other.  With nothing selected it says ``Nothing selected.``  See :doc:`/editors/properties/object_tab`.

In **Edit Mode** and **Pose Mode** it shows the position of the selected vertices or lattice points: the position of the one, or the median of several, as :guilabel:`Vertex` or :guilabel:`Median` with an X and a Z field.  Positions are measured from the world axes, in pixels, and a Z field measures up.  Typing a value moves the selection.

In a **UV Editor** the panel shows the selected texture coordinates in Edit Mode, and in Object Mode the place of the art on its page.  See `UV Editor Panels`_.

Tool Tab
--------

The :guilabel:`Tool` tab has the :guilabel:`Active Tool` panel.  It names the tool or the transform in progress in this area, such as ``Grab`` or ``Box Select``, and the rest of the time it says ``Tool settings will appear here.``  The settings of an operation are in the operation strip.  See :doc:`/editors/tool_settings` and :doc:`/interface/operation_strip`.

View Tab
--------

The :guilabel:`View` tab has the :guilabel:`2D Cursor` panel: the :guilabel:`X` and :guilabel:`Z` position of the cursor, measured from the world axes.  An unplaced cursor reads as the world origin, and typing or scrubbing a value places it.  Moving the cursor is not an undo step, and :kbd:`Escape` in the middle of a scrub puts it back where it was.

Folding Panels and Switching Tabs
=================================

* Click the **heading of a panel** to fold it away or to open it.  The panel remembers the choice for this area.
* Click a **tab** to show it.
* Turn the wheel with :kbd:`Ctrl` held, over the rail of tabs, to step through them.
* :guilabel:`Next Sidebar Tab` and :guilabel:`Previous Sidebar Tab` do the same from the command palette.  They have no shortcut, and you can give them one in :guilabel:`Keybindings`.  See :doc:`/interface/keymap`.

UV Editor Panels
================

The sidebar of the UV Editor has the same three tabs, with panels for texture space.

:guilabel:`Item`, in Edit Mode
	The selected texture coordinates, their median when there are several, as an X and a Y in pixels from the left and top edges of the shown page or artwork.

:guilabel:`Item`, in Object Mode
	The placement of the shown drawable's art on its page: its :guilabel:`X` and :guilabel:`Y` in pixels from the top left of the page, its :guilabel:`Angle`, and its :guilabel:`Scale X` and :guilabel:`Scale Y`.  A negative scale mirrors the art.  Each typed value is an undo step, and the fields are dimmed when the art cannot be moved, such as when its tile is pinned.  Art with no place says ``Not placed on a page.``  See :doc:`/editors/uv_editor/placement`.

:guilabel:`View`
	The UV cursor, with an X and a Y in pixels.

:guilabel:`Tool`
	The same :guilabel:`Active Tool` panel.

.. seealso::

	* :doc:`/editors/properties/object_tab`
	* :doc:`/editors/uv_editor/placement`
	* :doc:`/interface/settings`
