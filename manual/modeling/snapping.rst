**************************
Snapping and the 2D Cursor
**************************

Snapping puts things at exact places: onto the grid, onto the cursor, onto each other.  The 2D cursor is the marker that many of those places are measured from.  This page says what each choice does and where it works.  The pie that offers the choices is in :doc:`/interface/pie_menus`.

What Umamo Snapping Is
======================

Umamo's snapping is made of **commands**.  You choose a snap and it happens once, at that moment: the selection, or the cursor, jumps to the place and stays there.  This is different from the snapping of many programs, where a magnet makes a drag stick to a target as you drag.  Umamo has no such magnet.  If you want a vertex on the grid, you place it near, and then run :guilabel:`Selection to Grid`.

There are eight snaps for the 2D Viewport and seven for the UV Editor.  The Snap pie on :kbd:`Shift-S`, the Snap menu in the header of the area, and the command palette all offer the same choices.

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: The Snap pie open over a model in the 2D Viewport, with the eight choices around it.
	:Setup: Open a model, enter Edit Mode, select a few vertices, and press Shift-S with the pointer over the viewport.
	:Crop: The pie and the model around it.
	:Save as: ``images/modeling/snap_pie.png``
	:Caption: The Snap pie in the 2D Viewport.

2D Viewport Snap
================

The snaps over the 2D Viewport are in two kinds.  Four move the 2D cursor, and four move the selection.

.. list-table::
	:header-rows: 1

	* - Snap
	  - What it does
	* - :guilabel:`Cursor to World Origin`
	  - Puts the cursor on the world origin, where the X and Z axes cross.
	* - :guilabel:`Cursor to Selected`
	  - Puts the cursor in the middle of the selection.
	* - :guilabel:`Cursor to Active`
	  - Puts the cursor on the active element, or on the active object.
	* - :guilabel:`Cursor to Grid`
	  - Moves the cursor to the nearest line of the grid.
	* - :guilabel:`Selection to Grid`
	  - Moves each selected point to the nearest line of the grid.  Each point is rounded on its own, so the shape of a selection changes.
	* - :guilabel:`Selection to Cursor`
	  - Moves the selection onto the cursor.  Everything lands on the one point.
	* - :guilabel:`Selection to Cursor (Keep Offset)`
	  - Moves the selection as a whole, so that its middle lands on the cursor, and the shape is kept.
	* - :guilabel:`Selection to Active`
	  - Moves the selection onto the active element.  With no active element nothing happens.

In **Object Mode** an object is placed by its center, so the selection snaps move each selected object so that its center, or, for the Keep Offset form, the middle of all the centers, goes to the place.  As with any move of an object, they work only at the default pose.  See :doc:`/modeling/transforming`.

In **Edit Mode** and **Pose Mode** the snaps work on the points of the selection: the vertices of the meshes, or the points of the lattice.  Whatever the select mode, an edge or a face counts as the vertices it covers.

A snap of the selection is one undo step, and History names it as a move.  A snap of the cursor is not an undo step, because the cursor is not part of the model.

The snaps act on the 2D Viewport that the pointer is over, and the grid snaps use the grid of that viewport.  Only :guilabel:`Cursor to World Origin` works without one.  Over anything else, the command palette for one, a snap finds no viewport and does nothing.  Use the pie or the Snap menu of the header.

UV Editor Snap
==============

Over the UV Editor the same key opens the **UV Snap** pie, which has seven choices.  The cursor is the **UV cursor**, a marker on the page.

.. list-table::
	:header-rows: 1

	* - Snap
	  - What it does
	* - :guilabel:`Selection to Pixels`
	  - Rounds the selection to whole pixels of the texture.
	* - :guilabel:`Selection to Grid`
	  - Rounds the selection to the nearest line of the grid, in texels.
	* - :guilabel:`Selection to Cursor`, :guilabel:`Selection to Cursor (Keep Offset)`
	  - As in the viewport, to the UV cursor.
	* - :guilabel:`Cursor to Pixels`, :guilabel:`Cursor to Selected`, :guilabel:`Cursor to Grid`
	  - Move the UV cursor.

In Edit Mode the snaps move **texture coordinates**, the UV positions of the vertices.  In Object Mode they move **placed art**, the pieces of art on an atlas page.  In Pose Mode the UV Editor only shows, and there is no UV Snap pie.  See :doc:`/editors/uv_editor/editing` and :doc:`/editors/uv_editor/placement`.

The Grid
========

The grid is the one that the area draws.  A grid has a **scale**, the distance between its major lines, and **subdivisions**, the number of cells each major cell is split into.  The snaps round to the **minor** lines, which are the scale divided by the subdivisions apart, and they are anchored on the world origin, so a snapped point lands on a line that you can see.

The 2D Viewport starts with a scale of 100 world units and 10 subdivisions, which makes the snap step 10 units.  The UV Editor starts with 256 texels and 8, and the step is 32 texels.  Both are set in the :guilabel:`Viewport` category of the Settings window, and they can be changed for one area in its Viewport Overlays.  See :doc:`/editors/viewport_2d/overlays` and :doc:`/interface/settings`.

Turning the grid overlay off hides the lines and does not change the snap.

The 2D Cursor
=============

The 2D cursor is a point on the canvas that is measured from the world axes.  It is used in two ways: the :guilabel:`2D Cursor` pivot turns and scales about it, and the snaps move things to it and move it to things.

* **Shift-right-click** in the viewport puts the cursor under the pointer.
* The four snaps whose names start with Cursor to put it on a place that you can name.
* The :guilabel:`View` tab of the sidebar shows its X and Z position, and takes a typed value.  See :doc:`/editors/viewport_2d/sidebar`.

The cursor is not drawn until it has been placed, and until then it counts as being at the world origin.  The :guilabel:`2D Cursor` row of the overlays hides the marker, and it does not stop the pivot and the snaps from using the cursor.  Moving the cursor is not an undo step.

The UV Editor has a cursor of its own, in pixels on the page, which is placed in the same way and shown in the UV Editor's sidebar.

Current Limitations
===================

* There is no snapping to follow a drag.  Move first, and then snap.  There is also no snap to the vertices or the edges of other objects: the places are the grid, the cursor, the active element, and the middle of the selection.
* The snaps need the pointer over the viewport they are to act in, and in Object Mode they need the pose at its default.
* The Cubism keymap preset does not bind :kbd:`Shift-S` or :kbd:`Period`.  Use the Snap and Transform Pivot Point menus in the header.  See :doc:`/interface/keymap`.

.. seealso::

	* :doc:`/interface/pie_menus`
	* :doc:`/modeling/transforming`
	* :doc:`/editors/viewport_2d/overlays`
	* :doc:`/editors/uv_editor/editing`
