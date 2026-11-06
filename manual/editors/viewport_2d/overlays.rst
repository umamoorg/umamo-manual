********
Overlays
********

Overlays are the things the viewport draws over the model to help you work: the grid, the axes, the cursor, the wireframe, the tint on what is selected, the lattices of the warp deformers, and the text in the corners.  Each overlay can be turned on and off.  The overlays belong to the area, so one viewport can show a grid and a wireframe while another is clean, and they are saved in the document.

Show Overlays and Viewport Overlays
===================================

At the end of the header of a 2D Viewport, and of a UV Editor, is one button in two halves.

* The glyph half is :guilabel:`Show Overlays`.  It shows or hides every overlay of the area at once.  Each overlay keeps its own setting, so they come back as they were.  :kbd:`Shift-Alt-Z` does the same, for the area under the pointer.
* The arrow half is :guilabel:`Viewport Overlays`.  It opens a list of the overlays, in sections, each with a checkbox.  The list works while :guilabel:`Show Overlays` is off, so you can choose what you want before switching it on.

Hold the pointer over a section, a row, or a field of the list for a description.

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: The Viewport Overlays list open, with the Guides, Text, Objects, and Geometry sections, the Grid row with its Scale and Subdivisions fields, and the two Opacity fields.
	:Setup: Open a model, click the arrow at the end of the 2D Viewport's header.
	:Crop: The list and the end of the header.
	:Save as: ``images/editors/viewport_overlays.png``
	:Caption: The Viewport Overlays list.

Guides
======

Visual helpers for placement and alignment.

Grid
----

The divided grid behind the model, used for snapping and for judging distances.  The :guilabel:`Grid` row has two fields under it:

:guilabel:`Scale`
	The distance between the major lines, in world units.  In the UV Editor it is in texels.

:guilabel:`Subdivisions`
	How many minor lines divide each major cell.

The fields show the grid that the area draws.  Until you change one, the area follows the application's grid, which is set in :guilabel:`Viewport` in Settings.  Changing a field gives the area a grid of its own, and a small reset button beside :guilabel:`Scale` appears.  It makes the area follow the application again.

X/Z Axis
--------

The two lines through the world origin, one for each axis.  The horizontal one is X and the vertical one is Z.  Only the 2D Viewport has them.

2D Cursor
---------

The marker of the 2D cursor.  Hiding it leaves the cursor where it is, and the pivot and the snaps keep using it.  The UV Editor has a cursor of its own, which the same row hides.  See :doc:`/editors/viewport_2d/index`.

Text
====

:guilabel:`General Information` shows the chips in the corners of the area: the name of the active object and the zoom.  Turning it off leaves the badge of a transform in progress, because it is feedback.

Objects
=======

Visual helpers for the selected and active drawables, and for the deformers that move them.  Only the 2D Viewport has them.

Selection Tint
--------------

Tints the selected and active drawables so that they stand out in the art.  The active one is tinted differently from the rest.  Turn it off to see the art as it is, without a color on it.  The colors are in :guilabel:`Colors` in Settings.

Deformers
---------

Shows the lattice of every warp deformer, not only the selected ones, and makes each one clickable, so that any of them can be selected in the viewport.  The lattices of the selected deformers show whatever the setting.  It is off at first.  :guilabel:`Opacity`, under the row, scales how strongly the lattices are drawn, from 0 to 100 percent.  At 0 none is drawn and none can be picked.

Geometry
========

Visual helpers for displaying the drawables.

Wireframe
---------

Draws the mesh of the drawables that are not selected for editing.  It is off at first.  The mesh that you are editing in Edit Mode is always drawn.  :guilabel:`Opacity`, under the rows, scales how strongly it is drawn.

Cull Hidden
-----------

Leaves out the parts of the wireframe that are covered by drawables in front of them.  That shows which parts of a posed model are covered.  It is on at first.  The mesh that you are editing is never culled.

Toggle Commands
===============

Each overlay is also a command, which flips the setting of the area under the pointer.  The commands are in the command palette:

.. list-table::
	:header-rows: 1

	* - Command
	  - Shortcut
	* - :guilabel:`Toggle Overlays`
	  - :kbd:`Shift-Alt-Z`
	* - :guilabel:`Toggle Grid Overlay`
	  - —
	* - :guilabel:`Toggle X/Z Axis Overlay`
	  - —
	* - :guilabel:`Toggle 2D Cursor Overlay`
	  - —
	* - :guilabel:`Toggle General Information Overlay`
	  - —
	* - :guilabel:`Toggle Selection Tint Overlay`
	  - —
	* - :guilabel:`Toggle Deformers Overlay`
	  - —
	* - :guilabel:`Toggle Wireframe Overlay`
	  - —
	* - :guilabel:`Toggle Wireframe Cull Hidden`
	  - —

The commands for the axes, the tint, the deformers, and the wireframe work in a 2D Viewport and do nothing over a UV Editor, which has no such overlay.  Any of them can be given a shortcut in :guilabel:`Keybindings`.  See :doc:`/interface/keymap`.

Application Defaults and Colors
===============================

An area starts with every overlay on except the wireframe and the deformers, with the application's grid, and with both opacities at 100 percent.  The application's grid, 100 world units with 10 subdivisions in the 2D Viewport and 256 texels with 8 in the UV Editor, is set under :guilabel:`Viewport` in :menuselection:`Edit --> Settings…`.

The colors of the overlays are your colors, and are set under :guilabel:`Colors`: the tint of the selection, the colors of the elements of a mesh in Edit Mode, and the colors of the lattices.  See :doc:`/interface/settings`.

UV Editor Differences
=====================

The UV Editor has the same control and the same list, with fewer rows.  It has no :guilabel:`X/Z Axis`, :guilabel:`Selection Tint`, :guilabel:`Deformers`, :guilabel:`Wireframe`, or :guilabel:`Cull Hidden`, because it draws a texture and not the posed model.  Its grid is in texels, and its :guilabel:`Opacity` field under :guilabel:`Geometry` scales the outlines of the islands.  See :doc:`/editors/uv_editor/index`.

.. seealso::

	* :doc:`/editors/viewport_2d/navigation`
	* :doc:`/editors/uv_editor/index`
	* :doc:`/interface/settings`
	* :doc:`/modeling/snapping`
