*********
Deformers
*********

A deformer is what makes art move.  Drawables do not move on their own: each one follows a chain of deformers, and the parameters move the deformers.  This page is about the warp deformer, which Umamo can make and shape, and about the rotation deformer, which it can only carry.  The art they move is in :doc:`/modeling/index`.

Warp and Rotation Deformers
===========================

Cubism has two kinds of deformer, and so has Umamo.

A **warp deformer** is a lattice: a grid of **control points** laid over the art.  Moving a control point bends the art that is inside the lattice, smoothly, as if it were printed on rubber.  A lattice has a number of **rows** and **columns** of cells, and so (rows + 1) × (columns + 1) points.  A warp is how a cheek puffs, a strand of hair sways, or a head turns.

A **rotation deformer** is a pivot.  It turns, scales, and can mirror everything it holds about a point.  A rotation is how a forearm swings on the elbow.

Deformers **nest**.  A deformer has a parent deformer, and a drawable has a parent deformer too.  Art follows its parent, which follows its own parent, so a hand can be in a warp that is in a rotation that is in a warp for the body.  This is the deformer chain, and it is separate from the parts that stack the art.  See :doc:`/modeling/parts_and_drawables`.

A deformer's own motion comes from its **keys**.  A warp with no keys holds one shape and does not change with the parameters.  A warp has no lattice of its own besides its keys: the shape it has at rest is the shape of its keyform at the default pose, and the shapes at the other keys are what bend it.  See :doc:`/rigging/keyforms`.

Both kinds also have an opacity, a multiply color, and a screen color, which scale and tint everything they hold.  A rotation can mirror what it holds, with :guilabel:`Flip X` and :guilabel:`Flip Y`.  See :doc:`/editors/properties/data_tab`.

What Umamo can do with each kind is not the same:

.. list-table::
	:header-rows: 1

	* - Task
	  - Warp
	  - Rotation
	* - Make a new one
	  - Yes, with Create Warp Deformer
	  - No
	* - Select it, rename it, delete it, and bind it to a parent
	  - Yes
	  - Yes
	* - Shape it in Edit Mode, and pose it in Pose Mode
	  - Yes
	  - No
	* - Move, turn, and scale it as an object
	  - Yes
	  - No
	* - Key its opacity and its colors
	  - Yes
	  - Yes
	* - Edit its base angle
	  - Not applicable
	  - Yes, in the Properties editor
	* - Key its shape (the lattice, or the pivot) by hand
	  - Yes, in Pose Mode
	  - No
	* - Key its flips
	  - Not applicable
	  - Yes, in the Properties editor

A model that came from a CMO3 or a MOC3 keeps its rotation deformers and plays them, and a CMO3 or MOC3 export writes them back.

Creating a Warp
===============

A warp is made around art that is already there.  Select what it should hold, and run :guilabel:`Create Warp Deformer`.

Create Warp Deformer
--------------------

.. admonition:: Reference
	:class: refbox

	:Mode: Object Mode
	:Menu: Context menu, Outliner row menu

It has no shortcut.  It is also in the command palette.  It is greyed when the selection has nothing that a warp can hold.

The command wraps the **selection** in a new warp:

* Selected drawables that have a mesh, and selected deformers, are wrapped.  A selected part stands for every drawable with a mesh inside it, sub-parts included.
* If a selected deformer holds a selected drawable, only the deformer is wrapped, because it carries the drawable with it.
* The warp is put under the nearest deformer that holds everything selected, or at the root if there is none.  The wrapped items are moved under the new warp, and **they stay where they rest**, with their keyed motion.
* The new warp joins the part of the active item, and is named ``Warp``, then ``Warp.001``, and so on.

Nothing moves on the screen.  The new warp is at first a lattice drawn around the art, with a margin, and no keys of its own.

The operation strip then has the settings of the new warp, and changing one makes it again:

:guilabel:`Rows` and :guilabel:`Columns`
	The size of the lattice, in cells.  They are a pair with a lock for their proportion.  A new warp is 5 by 5.  Under a warp that is keyed, it starts at the cell size of that warp instead, from 5 up to 100, so that it carries the motion of its parent to the art.

:guilabel:`Margin`
	How far the lattice reaches past the selection, as a percentage of the larger side of the selection.  It starts at 10.

Bilinear
	A checkbox that is only there when the runtime target has the bilinear method of Cubism 3.3.  See `Changing Resolution`_ and :doc:`/files/runtime_targets`.

The whole creation is one undo step, ``Create Warp Deformer``.  See :doc:`/interface/operation_strip`.

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: A new warp over a few drawables in the 2D Viewport: the lattice drawn around them with its control points, the Outliner showing the warp ``Warp`` with the drawables under it, and the operation strip open with Rows, Columns, and Margin.
	:Setup: Open a model, select three drawables that sit together, right-click the viewport, choose Create Warp Deformer, and open the strip with F9.
	:Crop: The 2D Viewport, the Outliner, and the strip, in one window picture.
	:Save as: ``images/rigging/create_warp.png``
	:Caption: A warp made around three drawables.

Selecting and Showing Lattices
==============================

The lattice of a selected warp is drawn over the art in Object Mode, as a grid of lines with a dot at every control point, and in Pose Mode as the cage that you shape.  The active warp has its own color, and so have the other selected ones.  A lattice follows its art as you move the parameters.

* :guilabel:`Deformers` in the Viewport Overlays draws the lattice of **every** warp, not only the selected ones.  Those that are not selected, which are idle, are drawn slim: only their outer edges and four corner dots, so that the art inside them can still be clicked.
* A **click on a control point or a grid line** selects the warp.  A point picks within 10 pixels of its dot, and a line within 4 pixels, at any zoom.  A click anywhere else reaches the art.
* **Alt-click** lists the lattice and the art under the pointer.  The lattices come first.
* A **box** or a **circle** selects a warp whose lattice has its center inside.
* The Outliner selects warps too, and so does :guilabel:`Select All`.

A lattice is shown only when the warp and its parents, and the parts it is in, are shown.  A warp marked as not selectable, in the Outliner, does not take clicks.  Edit Mode draws the lattices that it edits as an editing cage instead, and no others.  The colors are set in :guilabel:`Colors` in the Settings, under :guilabel:`Lattice`.  See :doc:`/editors/viewport_2d/overlays` and :doc:`/interface/settings`.

Editing a Lattice
=================

Edit Mode shapes the lattice at **rest**.  Select the warp, press :kbd:`Tab`, and the control points become something that you select and move like the vertices of a mesh.  The select modes :kbd:`1`, :kbd:`2`, and :kbd:`3` choose points, grid lines, or cells, and the status bar counts the ones you have.  Box select, circle select, :guilabel:`Select Linked`, grab, rotate, scale, :guilabel:`Vertex Slide` along a grid line, pivots, proportional editing, and snaps all work as they do on a mesh.  See :doc:`/modeling/modes`, :doc:`/modeling/selecting`, and :doc:`/modeling/transforming`.

The lattice is a grid of quads and is never drawn as triangles.  Even a warp that uses the older method of two triangles for a cell shows quads.

Two rules make Edit Mode different from posing:

* **The art stays where it is.**  The children of the warp are put again in the reshaped lattice, so that they rest where they did.  Only the shape of the cage changes.  If the new shape folds over or collapses on a child, that child cannot be kept, and a notice says how many moved.  The reshape stands, and Undo puts it back.
* **The keyed motion is kept.**  The keyforms of the warp are reshaped with it, and the motion of the children is mapped to the new shape.  On a lattice that is curved this is close and not exact.

Merge, connect, rip, and duplicate do not work on a lattice, because its grid is fixed.  See :doc:`/modeling/meshes`.

A warp that has no lattice, or that the default pose does not draw, cannot be edited, and the notice says why.  See :doc:`/modeling/modes`.

To shape a lattice at some other pose, so that the shape is a key, use Pose Mode.  See :doc:`/rigging/posing_warps`.

Moving a Whole Warp
===================

In Object Mode, grab, rotate, and scale work on a warp as a whole.  Every key of its lattice is moved with it, so the motion of the warp is the same as before, only elsewhere, and the art follows.  The Position and Size rows of the Properties editor and the sidebar do the same by number.  It works only at the default pose, and a descendant that is selected with its ancestor moves once.  Duplicate copies a warp too, and the copy keeps the keyforms of the original.  See :doc:`/modeling/transforming` and :doc:`/modeling/meshes`.

Changing Resolution
===================

The resolution of a lattice is its number of rows and columns.  More cells give more control over the bend and cost more points to key.  Changing it does not move the art: Umamo **resamples** the keyforms by evaluating the old lattice at the new control points, so that the lattice has the same shape in a different number of pieces.

* When the new lattice is a whole-number refinement of the old one, in bilinear mode (for example 4 rows to 8), the result is exact.
* Any other size is allowed, and then the result is close and not exact.  The notice ``The lattice was resampled approximately.  Motion may differ slightly and require adjustment.`` says so, and tells how many children it could not keep in place.  Scrub the parameter afterwards and look at the motion.

The :guilabel:`Bilinear (Quad)` checkbox of the Data tab turns the bilinear mapping of Cubism 3.3 on and off.  It keeps the art in place at rest too, and the warp then bends by the other mapping.  It is only offered when the runtime target has it.  See :doc:`/files/runtime_targets`.

Rows, Columns, and the bilinear checkbox work in Object Mode and Edit Mode, and they are dimmed in Pose Mode.  In Edit Mode a change renumbers the points, so the selected points of that lattice are cleared.

Rows and Columns
----------------

The Data tab of a warp has :guilabel:`Rows` and :guilabel:`Columns`, each from 1 to 100, with a lock that keeps their proportion.  A change is one undo step, ``Lattice Resolution``, and the operation strip then has the same two fields, so you can try other sizes.  See :doc:`/editors/properties/data_tab`.

Subdivide Lattice
-----------------

.. admonition:: Reference
	:class: refbox

	:Mode: Edit Mode
	:Menu: Context menu

It has no shortcut and is in the command palette too.  :guilabel:`Subdivide Lattice` doubles the rows and the columns of the lattices that are being edited.  It is one undo step, and the strip has :guilabel:`Row Splits` and :guilabel:`Column Splits`, which say into how many each cell is divided, up to 10.  With more than one warp in the edit, all of them are subdivided.

Parents and Keep in Place
=========================

A deformer, and a drawable, can be put under another deformer in the **Parent Deformer** field of the Object tab, or for a deformer by dragging it onto another in the Outliner.  See :doc:`/editors/properties/object_tab` and :doc:`/editors/outliner`.

Moving something to a new parent changes the chain that moves it, and so it would jump.  By default it does not.  The operation strip has :guilabel:`Keep in Place`, on at first, and with it the item keeps the place where it rests under its new parent, with its keyed motion.  Switch it off and the item keeps its numbers and follows the new parent.

Keep in Place keeps the **rest** and the **shape of the motion**.  It does not keep the motion of the old parent: art that moves into a new parent follows the animation of the new one.

If the new chain cannot map an item, Umamo moves it without keeping its place, and says so in a notice: ``Name was bound without keeping its place: Its new deformer chain could not map it.`` or, for several, ``3 object(s) re-homed without keeping their place: The deformer chain could not map them.``  See :doc:`/troubleshooting/common_messages`.

Dragging a deformer among its siblings only changes their order and has no strip.

Deleting a Deformer
===================

:guilabel:`Delete` in the Outliner removes a deformer and asks nothing.  What it held moves up: the warps, rotations, and drawables inside it are re-homed to its parent, and they stay where they rest.  What goes with the deleted warp is its own motion: the art that was inside it no longer follows the parameters that the warp was keyed on.  A notice names anything that could not be kept in place.  Undo brings it all back.  See :doc:`/editors/outliner`.

Current Limitations
===================

* A rotation deformer cannot be made, shaped in Edit Mode, or posed.  Moving, turning, or scaling it as an object is refused with the notice ``Only drawables and warp deformers can be transformed.  Parts and rotation deformers are not yet supported.``  Its base angle, its opacity and colors, and its flips can be edited in the Properties editor.
* A warp is made around art and not drawn empty: :guilabel:`Create Warp Deformer` needs something to wrap.
* A deformer has no eye.  The editor cannot hide one, and a hidden deformer in an imported file hides what it holds.
* Moving a deformer in the chain keeps the rest of what it holds and not the motion of its old parent.
* The pivot of a rotation deformer cannot be keyed by hand, and neither can the vertices of a drawable.  Their keys come with an imported model.

.. seealso::

	* :doc:`/modeling/modes`
	* :doc:`/modeling/transforming`
	* :doc:`/rigging/posing_warps`
	* :doc:`/editors/properties/data_tab`
	* :doc:`/editors/outliner`
