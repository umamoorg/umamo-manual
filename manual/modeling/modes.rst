*****
Modes
*****

A mode decides what the pointer and the keys do to the model, and what a selection means.  Umamo has three: Object Mode, Edit Mode, and Pose Mode.  The mode belongs to the whole document, so every 2D Viewport, and the UV Editor, change mode together.

Object, Edit, and Pose Mode
===========================

.. list-table::
	:header-rows: 1

	* - Mode
	  - You work on
	  - The model is drawn
	  - Keys
	* - :guilabel:`Object Mode`
	  - Whole objects: drawables and warp deformers
	  - At the pose the parameters give it
	  - Can be keyed and edited
	* - :guilabel:`Edit Mode`
	  - The inside of one object: the vertices of meshes, or the points of one warp's lattice
	  - At the default pose, whatever the parameters say
	  - Cannot be changed
	* - :guilabel:`Pose Mode`
	  - The lattice points of warp deformers
	  - At the pose the parameters give it
	  - Can be keyed

The :guilabel:`Select Mode` buttons, with the keys :kbd:`1`, :kbd:`2`, and :kbd:`3`, belong to Edit Mode and Pose Mode only.  See :doc:`/modeling/selecting`.

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: The mode list of the 2D Viewport's header open, with its three entries, and the Select Mode buttons beside it.
	:Setup: Open a model, enter Edit Mode, and open the list.
	:Crop: The header of the viewport, with the list.
	:Save as: ``images/modeling/mode_list.png``
	:Caption: The mode list in the header of the 2D Viewport.

Object Mode
-----------

Object Mode is the mode for the whole model.  A click selects an object, a box selects the objects it encloses, and :kbd:`G`, :kbd:`R`, and :kbd:`S` move, turn, and scale whole objects.

The model is drawn at the pose of the parameters.  Because an object is placed at rest, moving, turning, or scaling one is only allowed while every parameter is at its default.  See :doc:`/modeling/transforming`.

Edit Mode
---------

Edit Mode works on the inside of an object, at rest.  It edits one of two kinds of thing:

* The **mesh** of a drawable.  Select vertices, edges, or faces, move them, merge them, connect them, tear them apart.  Several drawables can be edited at once, and what is selected is kept apart for each of them.  See :doc:`/modeling/meshes`.
* The **lattice** of a warp deformer.  Its grid points are moved the same way as vertices, and the keyed motion of the warp is resampled to follow.  See :doc:`/rigging/deformers`.

What Edit Mode opens on depends on what is selected:

#. If the active object is a warp deformer, it opens on the lattices of the selected warp deformers.
#. Otherwise it opens on the meshes of the selected drawables.
#. If none of the selection has a mesh to edit, it opens on the drawable you edited last, or on the first drawable that can be edited, and selects it.

While you are in Edit Mode the pose is held still.  The viewport draws the model at its default pose, and the Parameters editor shows every slider at its default and locks it.  The values you had are not lost.  They come back when you leave Edit Mode.  Keys cannot change in Edit Mode either: a key mark can be selected in the Keyform Sheet, and not dragged.  See :doc:`/editors/parameters`.

Pose Mode
---------

Pose Mode shapes the lattice of a warp deformer at the pose the parameters are at now, so that the shape can be keyed.  It is how a warp is made to move.  The model is not held still here.  You choose the pose by moving the parameters, and you shape the lattice at that pose.

You drag the lattice points as you would in Edit Mode, and the shape is an edit that is **not keyed** yet.  The key, :kbd:`I`, or Insert Key by Type, :kbd:`K`, stores it.  Pose Mode is dealt with in full in :doc:`/rigging/posing_warps`.

Pose Mode opens on the selected warp deformers that the pose draws.  If there is none, it still opens with nothing to shape, and you can still move the parameters and key.

Switching Modes
===============

There are three ways to change the mode:

* The mode list at the start of the 2D Viewport's header.
* :kbd:`Tab` and :kbd:`Ctrl-Tab`, the two toggles below.
* The command palette, which has :guilabel:`Object Mode`, :guilabel:`Edit Mode`, and :guilabel:`Pose Mode` as commands that set the mode directly.

Each change of mode is one undo step.

Selecting changes what the next mode shows, so select first.  Going from Edit Mode back to Object Mode keeps the vertex selection of each object that you edited, and it is brought back the next time you enter Edit Mode.

A document that was saved in Edit Mode or Pose Mode reopens in it, but only if the mode could be entered now.  Otherwise it opens in Object Mode.

Toggle Edit Mode
----------------

.. admonition:: Reference
	:class: refbox

	:Menu: Command palette
	:Shortcut: :kbd:`Tab`

Enters Edit Mode from Object Mode or Pose Mode.  In Edit Mode it goes back to the mode that Edit Mode was entered from.  If that was Pose Mode and the model can no longer be posed, because its deformers are gone, it goes to Object Mode.

:kbd:`Tab` is not bound in the Cubism keymap preset.  The mode list and the command palette work with every preset.  See :doc:`/interface/keymap`.

Toggle Pose Mode
----------------

.. admonition:: Reference
	:class: refbox

	:Menu: Command palette
	:Shortcut: :kbd:`Ctrl-Tab`

Enters Pose Mode, and in Pose Mode goes back to the mode it was entered from.  :kbd:`Ctrl-Tab` is the same in all three presets.

When a Mode Refuses to Open
===========================

A mode that cannot open leaves you where you are.  Most of the refusals say why in a notice by the pointer; see :doc:`/troubleshooting/common_messages`.

.. list-table::
	:header-rows: 1

	* - Mode
	  - Cause
	  - What to do
	* - Edit
	  - The active object is a rotation deformer.  ``Rotation deformer editing is not yet built.``
	  - Select a warp deformer or a drawable.
	* - Edit
	  - The warp deformer has no lattice.  ``This warp deformer has no lattice to edit.``
	  - There is nothing to edit in it.
	* - Edit
	  - The warp deformer is hidden at the default pose, because a part or a deformer above it is.  ``This warp deformer is not drawn at the default pose, so its lattice cannot be edited.``
	  - Show what is above it.  See :doc:`/editors/outliner`.
	* - Edit
	  - Every selected drawable is hidden by a part or a deformer above it.  ``Nothing to edit, every selected drawable is hidden by a parent.``
	  - Show the parent, or select something else.
	* - Edit
	  - Nothing selected can be edited, and the document has no drawable with a mesh.
	  - No notice appears.  Generate a mesh for a drawable first.  See :doc:`/modeling/generate_mesh`.
	* - Pose
	  - The document has no deformers.  ``Pose mode needs a deformer to pose.``
	  - Create a warp deformer.  See :doc:`/rigging/deformers`.

.. seealso::

	* :doc:`/modeling/selecting`
	* :doc:`/modeling/transforming`
	* :doc:`/rigging/posing_warps`
	* :doc:`/editors/viewport_2d/index`
