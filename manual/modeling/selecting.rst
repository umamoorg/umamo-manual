*********
Selecting
*********

Nearly everything in Umamo works on the selection: a move, a merge, a duplicate, a key.  What a selection is made of depends on the mode.  In Object Mode it is a set of objects, and in Edit Mode and Pose Mode it is a set of vertices, edges, faces, or lattice points.  This page is about the tools that make it.  See :doc:`/modeling/modes`.

Selecting in Object Mode
========================

In Object Mode a click works on whole objects: the art of a drawable, or the lattice of a warp deformer.

* **Click** an object to select it.  It replaces the selection, and the object becomes the **active** one.  The active object is the one that the Properties editor shows, that the chip in the corner of the viewport names, and that actions like Toggle Visibility compare against.
* **Shift-click**, or :kbd:`Ctrl`-click, adds the object to the selection, or takes it out if it is in already.
* **Click on empty canvas** clears the selection.  With :kbd:`Shift` held the selection is left as it is.
* **Alt-click** picks among objects that overlap at that spot.  See `Overlapping Objects`_.
* **Drag** a box to select the objects it encloses.  :kbd:`Shift` adds to the selection.

Objects that are hidden or marked as not selectable are skipped by all of these, and so is anything below a hidden part.  The Outliner selects the same objects, and the two always agree: a click in either is a click in both.  Parts can be selected in the Outliner only.  See :doc:`/editors/outliner`.

Every change of the selection is an undo step, and :kbd:`Escape` clears the selection in Object Mode.

Box Select
==========

.. admonition:: Reference
	:class: refbox

	:Menu: Toolbar
	:Shortcut: :kbd:`B`

Arms the box tool, so that the next drag selects what it encloses.  The box works in every mode, in the 2D Viewport, and in the UV Editor in Edit Mode.

* In Object Mode, it selects the objects it encloses.
* In Edit Mode and Pose Mode, it selects the elements it encloses, of the kind the select mode names.

The tool is **one-shot**.  It disarms once you release the button, and when you press the right button.  A new selection replaces the old one, and holding :kbd:`Shift` as you let go adds to it.  You do not need to arm the tool to draw a box from empty canvas: a drag that starts there draws the same box.

Circle Select
=============

.. admonition:: Reference
	:class: refbox

	:Menu: Toolbar
	:Shortcut: :kbd:`C`

Arms the circle brush.  A circle follows the pointer, and whatever you paint over is selected.

* **Drag** with the primary button to add.
* **Drag** with the middle button, or with :kbd:`Shift` held on the primary button, to take away.
* :kbd:`NumpadAdd` and :kbd:`NumpadSubtract` make the circle larger and smaller.  The commands are :guilabel:`Grow Circle Radius` and :guilabel:`Shrink Circle Radius`.
* The right button, :kbd:`Escape`, or :kbd:`Enter` puts the brush away.

Unlike the box, the brush stays armed after a stroke, so you can go on painting.  A stroke is one undo step, which is complete when you let go.  The brush works in every mode in the 2D Viewport, and only in Edit Mode in the UV Editor.

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: A mesh in Edit Mode with the circle brush over it, part of the mesh's vertices selected and the circle's outline visible.
	:Setup: Open a model, enter Edit Mode on a drawable with a mesh, press C, and paint over part of the mesh.
	:Crop: The viewport.
	:Save as: ``images/modeling/circle_select.png``
	:Caption: Painting a selection with the circle brush.

Select All, Invert, and Clear
=============================

These three act on the whole of what the mode can select: every selectable object in Object Mode, and every element of the objects being edited in Edit Mode and Pose Mode.

Select All
----------

.. admonition:: Reference
	:class: refbox

	:Menu: Context menu
	:Shortcut: :kbd:`A`

Selects everything.

Invert Selection
----------------

.. admonition:: Reference
	:class: refbox

	:Menu: Context menu
	:Shortcut: :kbd:`Ctrl-I`

Selects what is not selected and deselects what is.

Clear Selection
---------------

.. admonition:: Reference
	:class: refbox

	:Menu: Command palette

Deselects everything.  There is no shortcut for it: in Object Mode :kbd:`Escape` clears the selection, and a click on empty canvas does it in every mode.

Mesh Select Modes
=================

In Edit Mode and Pose Mode the select mode chooses which kind of element a click, a box, or a brush picks.  There are three.

.. list-table::
	:header-rows: 1

	* - Select mode
	  - Key
	  - A click selects
	* - Vertex
	  - :kbd:`1`
	  - A single vertex.
	* - Edge
	  - :kbd:`2`
	  - An edge, which is a line between two vertices.
	* - Face
	  - :kbd:`3`
	  - A face.  Umamo meshes are made of triangles only, so a face is a triangle.

The three buttons are in the 2D Viewport's header and in the UV Editor's.  The select mode belongs to the session: changing it in one area changes it in the others, and it is the same select mode in the UV Editor.

Changing the select mode converts the selection.  Going down to vertices keeps every vertex that the selection covered.  Going up to edges or faces keeps only the edges or faces whose vertices are all selected.  The active element is dropped by a change.

The click and the box work as they do in Object Mode.  A click replaces the selection, :kbd:`Shift`, :kbd:`Ctrl`, or :kbd:`Cmd` toggles the element, and a click on empty canvas clears.  The last element you clicked is the **active** element.  Where a command asks for it, like Vertex Slide, or a pivot of :guilabel:`Active Element`, this is the one it means.

Some commands care about the mode.  Merge Vertices and Connect Vertices work on vertices only, and Rip is not available in face select mode.  See :doc:`/modeling/meshes`.

Select Linked
=============

A mesh is often several pieces: the island of a sleeve, the island of a hand.  A piece is a set of vertices joined by edges.  The Select Linked commands select whole pieces.  Both add to the selection, in the current select mode, so repeating them grows it piece by piece.

Select Linked under Cursor
--------------------------

.. admonition:: Reference
	:class: refbox

	:Mode: Edit Mode, Pose Mode
	:Menu: Command palette
	:Shortcut: :kbd:`L`

Selects the whole piece of mesh that is under the pointer.  Point at an element, and press :kbd:`L`.  The pointer has to be over the viewport, or the UV Editor, and over an element of the mesh.

Select Linked
-------------

.. admonition:: Reference
	:class: refbox

	:Mode: Edit Mode, Pose Mode
	:Menu: Context menu
	:Shortcut: :kbd:`Ctrl-L`

Extends what is selected to the whole piece that each selected element belongs to.  Select one vertex of a sleeve and press :kbd:`Ctrl-L` to have the sleeve.

In the UV Editor a piece is a UV island, which is the same idea.  See :doc:`/editors/uv_editor/editing`.

Overlapping Objects
===================

Art is stacked, so there are often several objects under one spot.  In Object Mode, :kbd:`Alt`-click opens a list of everything at that spot, each with its part in brackets, and you pick one.  If there is only one, it is selected.

In Edit Mode and Pose Mode a plain click works on the elements of the object you are editing, and the others under it cannot be reached.  The next command is how you move to another object without leaving the mode.

Switch Editing Object
---------------------

.. admonition:: Reference
	:class: refbox

	:Mode: Edit Mode, Pose Mode
	:Menu: Command palette
	:Shortcut: :kbd:`Alt-Q`

Makes the object under the pointer the one that is edited.  In Edit Mode it is a drawable, and in Pose Mode a warp deformer.  When several drawables are stacked at that spot, a list opens to pick from.

It acts on whatever is under the pointer, so press the shortcut with the pointer over the object.

Current Limitations
===================

* The Cubism keymap preset assigns none of the selection keys: not :kbd:`A`, :kbd:`B`, :kbd:`C`, :kbd:`Ctrl-I`, :kbd:`L`, :kbd:`Ctrl-L`, :kbd:`Alt-Q`, nor the select modes.  The Default and Blender presets have them.  In the Cubism preset use the toolbar, the header, and the context menu, or assign keys.  See :doc:`/interface/keymap`.
* Parts cannot be picked in the viewport.  Select a part in the Outliner.
* A rotation deformer cannot be edited in Edit Mode.
* A new selection ends the operation strip of the last operation, because selecting is a step of its own.  Adjust the settings of an operation before you select something else.  See :doc:`/interface/operation_strip`.

.. seealso::

	* :doc:`/modeling/modes`
	* :doc:`/editors/outliner`
	* :doc:`/editors/viewport_2d/overlays`
	* :doc:`/editors/uv_editor/editing`
