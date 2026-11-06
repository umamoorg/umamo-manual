************
Transforming
************

To transform is to move, turn, or scale the selection.  Umamo has three transforms, Grab, Rotate, and Scale, and two more moves that need a particular setup: Vertex Slide and Duplicate.  Everything here works with the pointer, in the 2D Viewport.  A transform can also be given exactly by number; see `Exact Values`_.

Grab, Rotate, and Scale
=======================

The three transforms are **modal**.  You press the key or the toolbar button, and the selection follows the pointer until you confirm or cancel.  Nothing is stored until you confirm.

* :kbd:`Enter`, or the primary button, **confirms**.
* :kbd:`Escape`, or the right button, **cancels**, and the selection goes back to where it was.
* The pointer wraps around when it reaches the edge of the area, so a long drag does not run out of room.
* With proportional editing on, the mouse wheel changes its radius while the transform runs.  See :doc:`/modeling/proportional_editing`.
* A badge at the top of the viewport names the transform, the axis that is locked, and the proportional editing in use.

One confirmed transform is one undo step.  The operation strip then offers the transform by number.

What a transform moves depends on the mode, and on the area that the pointer is over:

.. list-table::
	:header-rows: 1

	* - Where
	  - The transform works on
	* - The 2D Viewport, Object Mode
	  - The selected drawables and warp deformers, as whole objects
	* - The 2D Viewport, Edit Mode
	  - The selected vertices, edges, or faces, or the points of the lattice
	* - The 2D Viewport, Pose Mode
	  - The selected lattice points of a warp deformer, at the pose
	* - The UV Editor
	  - The texture coordinates in Edit Mode, or the placed art in Object Mode.  See :doc:`/editors/uv_editor/editing` and :doc:`/editors/uv_editor/placement`.

The commands are named for vertices, as :guilabel:`Grab Vertices`, because that is the common case.  The names are the same in all of the places above.

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: A mesh in Edit Mode in the middle of a grab: a few vertices moved from their old places, the Move badge at the top of the viewport, and the proportional falloff on.
	:Setup: Open a model, enter Edit Mode, select a vertex, turn proportional editing on, press G, and move the pointer without confirming.
	:Crop: The viewport.
	:Save as: ``images/modeling/grab.png``
	:Caption: A grab in progress.

Grab
----

.. admonition:: Reference
	:class: refbox

	:Menu: Toolbar
	:Shortcut: :kbd:`G`

Moves the selection by the distance the pointer moves.

Rotate
------

.. admonition:: Reference
	:class: refbox

	:Menu: Toolbar
	:Shortcut: :kbd:`R`

Turns the selection about the `Pivot Point`_ as you move the pointer around it.

Scale
-----

.. admonition:: Reference
	:class: refbox

	:Menu: Toolbar
	:Shortcut: :kbd:`S`

Scales the selection about the `Pivot Point`_ as you move the pointer toward it or away from it.

Axis Constraints
================

While a Grab or a Scale is running, :kbd:`X` locks it to the horizontal axis and :kbd:`Z` locks it to the vertical one.  Press the key again to release the lock.  The badge says ``Along X`` or ``Along Z``.  In the viewport the vertical axis is called Z.  In the UV Editor, where it runs down the page, it is called Y.

Rotate has no axis lock.  A 2D rotation turns about one axis only.

Pivot Point
===========

The pivot is the point that a rotation turns about and a scale grows from.  A grab does not use it.  There are four.

.. list-table::
	:header-rows: 1

	* - Pivot
	  - The point is
	* - :guilabel:`Median Point`
	  - The middle of the selection.
	* - :guilabel:`Individual Origins`
	  - The center of each selected item on its own.
	* - :guilabel:`Active Element`
	  - The active element: the one you selected last.
	* - :guilabel:`2D Cursor`
	  - The 2D cursor.  See :doc:`/modeling/snapping`.

Choose the pivot in the Transform Pivot Point list of the 2D Viewport's header, in the Pivot Point pie on :kbd:`Period`, or with the commands of the same names in the command palette.  The pivot belongs to the session: the viewport and the UV Editor use the same one.  See :doc:`/interface/pie_menus`.

Vertex Slide
============

.. admonition:: Reference
	:class: refbox

	:Mode: Edit Mode, Pose Mode
	:Menu: Command palette
	:Shortcut: :kbd:`Shift-V`

Slides the **active** vertex along one of the edges that meet at it, without leaving the edge.  Click a vertex so that it is the active one, point at the viewport, and press :kbd:`Shift-V`.  As you move the pointer, the vertex follows the edge that suits the pointer best, and it hops from one edge to another when the pointer does.  Confirm and cancel work as for the other transforms.

Afterwards the operation strip has one row, :guilabel:`Factor`: 0 is where the vertex started, and 1 is the vertex at the other end of the edge.  See :doc:`/interface/operation_strip`.

The command needs a pointer in the viewport, so it is not in the context menu, and it ignores proportional editing.  If the active element is not a vertex, or the vertex has no neighbor, the slide does not start.

Duplicate
=========

.. admonition:: Reference
	:class: refbox

	:Mode: Object Mode, Edit Mode
	:Menu: Context menu
	:Shortcut: :kbd:`Shift-D`

Copies the selection and then starts a Grab on the copy: move the pointer to place the copy, and confirm.  If you cancel the grab, the copy stays where it was made, on top of the original.  The copy is one undo step, and the grab another.  The Grab starts only when the pointer is over a viewport.

In Object Mode it copies objects, and in Edit Mode it copies mesh elements.  Pose Mode has no duplicate.  What is copied, and what is not, is in :doc:`/modeling/meshes` and in :doc:`/modeling/parts_and_drawables`.

Exact Values
============

A transform by hand comes close.  There are three places to make it exact.

Operation Strip
---------------

Right after a transform is confirmed, the operation strip shows what the pointer did as numbers: :guilabel:`Move X` and :guilabel:`Move Z` for a grab, :guilabel:`Angle` for a rotate, and :guilabel:`Scale X` and :guilabel:`Scale Z` for a scale.  Change a value and the transform is run again from the same start.  Press :kbd:`F9` to open the strip.  The strip also has the proportional editing rows.  See :doc:`/interface/operation_strip`.

Typing in the Properties editor or the sidebar (below) shows its change in the strip too, as a grab or a scale.

Properties Transform Rows
-------------------------

In Object Mode, the Object tab of the Properties editor has :guilabel:`Position X`, :guilabel:`Position Z`, :guilabel:`Size X`, and :guilabel:`Size Z` for a drawable or a warp deformer.  The position is the center of the box around the item, and the size is the width and the height of that box.  They are measured in the viewport, with the pose applied, in pixels.  The rows can be edited only in Object Mode, and only while every parameter is at its default.  See :doc:`/editors/properties/object_tab`.

Sidebar Fields
--------------

The :guilabel:`Item` tab of the sidebar has the same rows in Object Mode.  In Edit Mode and Pose Mode it has :guilabel:`Vertex`, for the one selected point, or :guilabel:`Median`, for several, with an X and a Z field.  Type a number to put the point, or the middle of the points, there.  See :doc:`/editors/viewport_2d/sidebar`.

Transforming Warps
==================

A warp deformer can be transformed in all three modes, and in each it means something different.

**Object Mode** moves, turns, or scales the whole warp.  Every form of its lattice, for every key, is carried with it, so the motion of the warp is the same and has just moved.  What the warp moves, the art and the warps nested in it, follows.  Something that is both selected and under a moving warp is moved once, with the warp.

**Edit Mode** shapes the lattice at rest.  The children of the warp are kept in place, so the art stays where it is on screen, and the keyed forms of the lattice are resampled to follow the new shape.  Two notices can come of it: ``The reshaped lattice folds over N of its children.  Drawables may have moved.`` when the new shape folds over or collapses at art that sits in it, which then does move, and ``The lattice was resampled approximately.  Motion may differ slightly and require adjustment.`` when a keyed lattice had to be resampled.  Look at the motion afterwards.  See :doc:`/rigging/deformers`.

**Pose Mode** shapes the lattice at the pose that the parameters are at now.  The shape is an edit that is **not keyed** until you key it with :kbd:`I`.  If you move the parameters first, the edits that were not keyed are lost, with the notice ``Moving the pose discarded N unkeyed lattice edit(s).  Undo to bring them back.``  See :doc:`/rigging/posing_warps`.

Current Limitations
===================

* Only drawables with a mesh and warp deformers can be transformed as objects.  Parts, rotation deformers, and drawables with no mesh are skipped, and if nothing eligible is left, the notice ``Only drawables and warp deformers can be transformed.  Parts and rotation deformers are not yet supported.`` appears.
* In Object Mode a transform is allowed only while every parameter is at its default, otherwise ``Can't transform while mesh is deformed.  Reset all parameters first.`` appears.  Reset them in the Parameters editor first.
* A transform does not snap to anything while it runs, and it has no key for fine control.  To land on the grid, the 2D cursor, or another point, run a snap command afterwards, or type the value.  See :doc:`/modeling/snapping`.
* The Cubism keymap preset has no keys for :kbd:`G`, :kbd:`R`, :kbd:`S`, or the others on this page.  Use the toolbar and the context menu, or assign keys.  See :doc:`/interface/keymap`.

.. seealso::

	* :doc:`/interface/pie_menus`
	* :doc:`/interface/operation_strip`
	* :doc:`/modeling/proportional_editing`
	* :doc:`/modeling/snapping`
	* :doc:`/rigging/deformers`
