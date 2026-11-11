***********
2D Viewport
***********

The 2D Viewport shows the model, and it is where you work on it.  You select objects and move them, edit the vertices of a mesh, shape the lattice of a warp deformer, and pose and key the rig.  The model is drawn here by the graphics card, at the pose the parameters give it.  See :doc:`/troubleshooting/platform_notes` if the viewport stays empty.

.. toctree::
	:maxdepth: 1

	navigation
	overlays
	sidebar

Layout
======

The viewport fills its area.  Over the model it has:

* **The header**, a strip across the top, with the mode and the editing controls.  See `Header Controls`_.
* **The toolbar**, a short column of tools floating at the left edge.  See `Toolbar`_.
* **The sidebar**, floating at the right edge, closed at first.  It has a thin pull tab to open it.  See :doc:`/editors/viewport_2d/sidebar`.
* **The HUD**: a chip at the top left that names the active object, a percentage at the bottom left that is the zoom, and a badge at the top center while a transform is in progress.  See `HUD`_.
* **The operation strip**, at the bottom left, after an operation has run.

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: A 2D Viewport with a model in it, with labels or arrows (added in an image editor) for the header, the toolbar, the sidebar pull tab, the active object chip, the zoom readout, the grid, and the axes.
	:Setup: Open a model, select a drawable, and take the picture with the sidebar closed.
	:Crop: The whole 2D Viewport area.
	:Save as: ``images/editors/viewport_layout.png``
	:Caption: The parts of the 2D Viewport.

Header Controls
===============

The header has, from left to right, the controls below.  Where there is no room for all of them, the ones that do not fit are put in a menu at the end of the header.  The mode selector stays.

Editor Mode
-----------

The first control is the mode of the editor.  Its list has :guilabel:`Object Mode`, :guilabel:`Edit Mode`, and :guilabel:`Pose Mode`.  The mode decides what the pointer and the keys do in the viewport.  :kbd:`Tab` toggles Edit Mode, and :kbd:`Ctrl-Tab` toggles Pose Mode.  See :doc:`/modeling/modes`.

The mode belongs to the whole puppet and not to the area: another 2D Viewport, and the UV Editor, change mode with it.

Select Mode
-----------

Three buttons for the kind of element that a click selects in Edit Mode and Pose Mode: vertices, edges, or faces.  The keys are :kbd:`1`, :kbd:`2`, and :kbd:`3`.  They are not shown in Object Mode.  See :doc:`/modeling/selecting`.

Transform Pivot Point
---------------------

A button with the glyph of the pivot that is in use.  It opens a list of the four pivots: :guilabel:`Median Point`, :guilabel:`Individual Origins`, :guilabel:`Active Element`, and :guilabel:`2D Cursor`.  The same choice is the Pivot Point pie on :kbd:`Period`.  See :doc:`/interface/pie_menus`.

Snap
----

A magnet button that opens the snap menu: four entries that move the 2D cursor, and, after a rule, four that move the selection.  They are the choices of the Snap pie on :kbd:`Shift-S`.  See :doc:`/modeling/snapping`.

Proportional Editing
--------------------

Shown in Edit Mode and Pose Mode.  The button is in two halves.  The glyph toggles proportional editing, as :kbd:`O` does.  The arrow opens a panel with :guilabel:`Connected Only`, the list of falloff curves, and :guilabel:`Proportional Size`.  While the tool is off the panel is dimmed but live, so you can set it up first.  See :doc:`/modeling/proportional_editing`.

Viewport Overlays
-----------------

At the end of the header: a button that shows or hides every overlay of the area, and an arrow that opens the list of them.  See :doc:`/editors/viewport_2d/overlays`.

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: The 2D Viewport's header in Edit Mode, with the mode list, the three select mode buttons, the pivot, snap, and proportional buttons, and the overlays buttons.
	:Setup: Open a model and enter Edit Mode.
	:Crop: The header only, at about 700 pixels wide.
	:Save as: ``images/editors/viewport_header.png``
	:Caption: The header of the 2D Viewport in Edit Mode.

Toolbar
=======

The toolbar is the short column at the left edge.  Its five buttons start a tool or a transform, the same as their shortcuts do:

.. list-table::
	:header-rows: 1

	* - Button
	  - Shortcut
	  - Does
	* - :guilabel:`Box Select`
	  - :kbd:`B`
	  - Arms the box tool, so that the next drag selects what it encloses.
	* - :guilabel:`Circle Select`
	  - :kbd:`C`
	  - Arms the circle brush, which selects what you paint over.  :kbd:`NumpadAdd` and :kbd:`NumpadSubtract` change its size.
	* - :guilabel:`Grab Vertices`
	  - :kbd:`G`
	  - Moves the selection.
	* - :guilabel:`Rotate Vertices`
	  - :kbd:`R`
	  - Turns the selection about the pivot point.
	* - :guilabel:`Scale Vertices`
	  - :kbd:`S`
	  - Scales the selection about the pivot point.

The names say vertices, but in Object Mode the same three buttons move, turn, and scale whole objects, and in Pose Mode they work on lattice points.  A button is lit while its tool or transform is in progress.  See :doc:`/modeling/transforming`.

The toolbar is shown at first.  :kbd:`T` hides it and shows it again for the area under the pointer, and :guilabel:`Show Toolbar by Default` in :doc:`/interface/settings` sets what a new area does.

Selecting in Object Mode
========================

In Object Mode a click works on whole objects: the art of a drawable, or the lattice of a warp deformer.

* **Click** an object to select it.  It replaces the selection.
* **Shift-click** (or :kbd:`Ctrl`-click) adds the object, or removes it if it is selected already.
* **Click on empty canvas** clears the selection.  With :kbd:`Shift` held it leaves the selection as it is.
* **Alt-click** picks among objects that overlap at that spot.  When there is more than one, a list opens with the name of each object and its part in brackets.  When there is one, it is selected.
* **Drag** a box to select the objects it encloses.  :kbd:`Shift` adds to the selection.
* **Shift-right-click** places the 2D cursor.

Objects that are hidden or marked as not selectable are skipped by every one of these.  :kbd:`Escape` clears the selection in Object Mode.  :kbd:`A` selects all, and :kbd:`Ctrl-I` inverts the selection.  See :doc:`/modeling/selecting`.

Context Menu
============

A right-click on the viewport, when no gesture is in progress, opens a menu of the common commands of the mode, each with its shortcut.  A menu entry that cannot be used right now is greyed out.  Entries that open a pie show its choices as a submenu.

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: The context menu of the 2D Viewport in Edit Mode, with the Merge Vertices submenu open.
	:Setup: Enter Edit Mode, select two vertices, and right-click.
	:Crop: The menu, with a little of the viewport around it.
	:Save as: ``images/editors/viewport_context_menu.png``
	:Caption: The context menu in Edit Mode.

Object Mode
-----------

:guilabel:`Duplicate`, :guilabel:`Toggle Visibility`, :guilabel:`Snap`, :guilabel:`Generate Mesh from Art`, :guilabel:`Generate Quad Mesh`, :guilabel:`Create Warp Deformer`, and :guilabel:`Frame Selected`.

Edit Mode
---------

:guilabel:`Merge Vertices` (a submenu), :guilabel:`Connect Vertices`, :guilabel:`Duplicate`, :guilabel:`Select All`, :guilabel:`Invert Selection`, :guilabel:`Select Linked`, :guilabel:`Snap`, :guilabel:`Generate Mesh from Art`, :guilabel:`Generate Quad Mesh`, :guilabel:`Subdivide Lattice`, and :guilabel:`Frame Selected`.

Pose Mode
---------

:guilabel:`Insert Keyframe`, :guilabel:`Delete Keyframe`, :guilabel:`Insert Key by Type` (a submenu), :guilabel:`Clear Pose Edits`, :guilabel:`Select All`, :guilabel:`Invert Selection`, :guilabel:`Snap`, and :guilabel:`Frame Selected`.

Rip and Vertex Slide are not in the menu, because they depend on where the pointer is, and from a menu the pointer is on the menu.

Pie Menus
=========

Four pies open over the viewport: Pivot Point on :kbd:`Period`, Snap on :kbd:`Shift-S`, Merge on :kbd:`M` in Edit Mode, and Insert Key on :kbd:`K` in Pose Mode.  They open under the pointer and pick by direction.  See :doc:`/interface/pie_menus`.

HUD
===

The text and chips drawn over the viewport do not take clicks.

* The **active object chip**, at the top left, names the active drawable with its part, as ``Part | Name``, and the deformer that is its parent below it.  For an active warp deformer it names the deformer, its part, and its parent deformer.  The names are shown as they are in the puppet.
* The **zoom readout**, at the bottom left, is the zoom as a percentage.  100% is one pixel of the canvas for each pixel of the screen.
* The **operator badge**, at the top center, shows while a transform is in progress, in the area where it started.  It names the transform, the axis if one is locked with :kbd:`X` or :kbd:`Z`, and the proportional editing in use.

The chip and the readout belong to the General Information overlay.  The badge is feedback, and always shows.

The 2D Cursor
=============

The 2D cursor is a marker on the canvas.  The :guilabel:`2D Cursor` pivot turns about it, and the snap commands move things to it and it to things.  It is not drawn until it is placed, and an unplaced cursor counts as being at the world origin.

You place it with :kbd:`Shift`-right-click, with the cursor entries of the Snap menu or pie, or by typing its position in the :guilabel:`View` tab of the sidebar.  Moving it is not an undo step.  The overlay can hide it without removing it.  See :doc:`/editors/viewport_2d/sidebar`.

Operation Strip
===============

After an operation, such as a grab, a merge, or a mesh generation, its settings appear in a small card at the bottom left of the viewport.  See :doc:`/interface/operation_strip`.

Editor Shortcuts
================

These are the shortcuts of the default keymap that work over the 2D Viewport.  The commands for a mode do nothing in the others.

.. list-table::
	:header-rows: 1

	* - Shortcut
	  - Command
	* - :kbd:`Tab`, :kbd:`Ctrl-Tab`
	  - Toggle Edit Mode, Toggle Pose Mode
	* - :kbd:`G`, :kbd:`R`, :kbd:`S`
	  - Grab, Rotate, and Scale
	* - :kbd:`B`, :kbd:`C`, :kbd:`Shift-B`
	  - Box Select, Circle Select, Zoom Region
	* - :kbd:`A`, :kbd:`Ctrl-I`
	  - Select All, Invert Selection
	* - :kbd:`1`, :kbd:`2`, :kbd:`3`
	  - Vertex, Edge, and Face Select Mode
	* - :kbd:`L`, :kbd:`Ctrl-L`
	  - Select Linked under Cursor, Select Linked
	* - :kbd:`Alt-Q`
	  - Switch Editing Object
	* - :kbd:`H`
	  - Toggle Visibility
	* - :kbd:`Shift-D`
	  - Duplicate
	* - :kbd:`M`, :kbd:`J`, :kbd:`V`, :kbd:`Shift-V`
	  - Merge Vertices, Connect Vertices, Rip, Vertex Slide
	* - :kbd:`Shift-M`
	  - Generate Mesh from Art
	* - :kbd:`O`, :kbd:`Alt-O`
	  - Toggle Proportional Editing, Toggle Proportional Connected Only
	* - :kbd:`Period`, :kbd:`Shift-S`
	  - Pivot Point pie, Snap pie
	* - :kbd:`I`, :kbd:`Alt-I`, :kbd:`K`
	  - Insert Keyframe, Delete Keyframe, Insert Key by Type
	* - :kbd:`T`, :kbd:`N`
	  - Toggle Toolbar, Toggle Sidebar
	* - :kbd:`Shift-Alt-Z`
	  - Toggle Overlays
	* - :kbd:`Ctrl-0`, :kbd:`Home`, :kbd:`NumpadDecimal`, :kbd:`Ctrl-1`
	  - Fit View, Frame All, Frame Selected, Actual Size

The full lists, for all three keymaps, are in :doc:`/appendices/default_shortcuts`.

.. seealso::

	* :doc:`/editors/viewport_2d/navigation`
	* :doc:`/editors/viewport_2d/overlays`
	* :doc:`/modeling/modes`
	* :doc:`/modeling/selecting`
	* :doc:`/interface/pie_menus`
	* :doc:`/interface/operation_strip`
