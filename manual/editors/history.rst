*******
History
*******

The History editor lists the undo steps of the open puppet.  Every change that you make is a step, and the list shows them in order, with the step you are at highlighted.  You can click any step to go straight back, or forward, to it.

The history belongs to the session.  It is not saved with the puppet file, and a puppet file that you open starts with a history of one step.  See :doc:`/files/uma`.

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: The History editor with about ten steps, the current step highlighted in the middle of the list, the steps after it dimmed, and the dot that marks the saved step on one of the rows.
	:Setup: Open a model, make a few edits, save, make a few more, and then undo twice.
	:Crop: The History area only.
	:Save as: ``images/editors/history.png``
	:Caption: The History editor.

Reading the List
================

The oldest step is at the top.  The first one, ``Open``, is the puppet as it was when you opened it.  Each row after it has the name of what you did, such as ``Move Vertices`` or ``Insert Keyframe``.  See `Step Label Reference`_.

* The **current step** is the row with the colored band.  It is what you see in the other editors.
* The steps **below** it are dimmed.  They are steps you took back, and can do again.
* A **dot** at the right end of a row marks the step that was saved last.  The title of the window shows a ``*`` when you are at any other step.

Doing something new while you are at an earlier step throws the dimmed steps away, so the history is a straight line with no branches.

A long list scrolls so that the current step stays in view when you undo or redo from the keyboard.

Jumping to a Step
=================

Click a row to go to that step.  Umamo undoes or redoes as many steps as it takes, in one move.  The puppet, the selection, and the mode are as they were then.  Click a dimmed row to go forward again.

A jump ends the operation strip, because it belongs to the newest step only.  See :doc:`/interface/operation_strip`.

Undo and Redo
=============

Undo
----

.. admonition:: Reference
	:class: refbox

	:Menu: :menuselection:`Edit --> Undo`
	:Shortcut: :kbd:`Ctrl-Z`

Goes back one step.  The menu entry is greyed out when there is nothing to go back to.

Redo
----

.. admonition:: Reference
	:class: refbox

	:Menu: :menuselection:`Edit --> Redo`
	:Shortcut: :kbd:`Ctrl-Shift-Z`

Goes forward one step, to a step that you took back.  The Cubism keymap also binds :kbd:`Ctrl-Y`.  Greyed out when there is nothing to do again.

Undoing a step does not mean that the puppet file is unchanged.  The ``*`` in the title goes away only when you are back at the step that was saved.

History Steps Setting
=====================

The number of steps that Umamo keeps is a setting, :guilabel:`History Steps` in the :guilabel:`Interface` category of :menuselection:`Edit --> Settings…`.  It is 200 by default and can be from 1 to 1000.  When the list is longer, the oldest steps are dropped as new ones are made.

Lowering the number trims the history of the open puppet at once.  It never removes the current step or the steps that you can redo.  Steps use memory, so a low number helps a very large puppet.  See :doc:`/interface/settings` and :doc:`/troubleshooting/performance_and_memory`.

Step Label Reference
====================

The label of a step is the name of the operation, and it is the same name that the operation strip uses as its title.

.. list-table::
	:header-rows: 1

	* - Group
	  - Labels
	* - Opening, selecting, and modes
	  - Open, Select, Change Mode, Select Elements, Change Select Mode, Select Parameter, Select Keyframe
	* - Parts
	  - Toggle Part Visibility, Rename Part, Toggle Part Selectability, Move Part, Delete Part, Toggle Guide Image, Set Part Draw Order, Set Group Mode, Set Composite
	* - Drawables
	  - Toggle Mesh Visibility, Rename Mesh, Toggle Mesh Selectability, Move Mesh, Delete Mesh, Duplicate Drawable, Set Blend Mode, Set Alpha Mode, Toggle Back-Face Culling, Toggle Invert Mask, Set Parent Deformer, Set Masks, Set Multiply Color, Set Screen Color, Set Opacity, Set Draw Order
	* - Deformers
	  - Rename Deformer, Toggle Deformer Selectability, Move Deformer, Delete Deformer, Create Warp Deformer, Set Deformer Opacity, Set Deformer Multiply Color, Set Deformer Screen Color, Set Flip X, Set Flip Y, Set Part, Set Base Angle, Toggle Bilinear Warp
	* - Parameters
	  - Adjust Parameter, Edit Parameter Range, Link Parameters, Unlink Parameters, Move Parameter, Add Parameter, Rename Parameter, Delete Parameter, Create Group, Rename Group, Delete Group
	* - Keys
	  - Insert Keyframe, Move Keyframe, Remove Keyframe
	* - Mesh editing
	  - Move Vertices, Scale Vertices, Rotate Vertices, Slide Vertex, Duplicate, Merge Vertices, Rip, Connect Vertices, Generate Mesh from Art, Generate Quad Mesh
	* - Lattices
	  - Move Lattice Points, Scale Lattice Points, Rotate Lattice Points, Slide Lattice Point, Lattice Resolution, Subdivide Lattice
	* - Pose Mode
	  - Pose: Move Lattice Points, Pose: Scale Lattice Points, Pose: Rotate Lattice Points, Pose: Slide Lattice Point, Clear Pose Edits
	* - Objects
	  - Move Objects, Scale Objects, Rotate Objects, Duplicate Objects
	* - UVs
	  - Move UVs, Scale UVs, Rotate UVs, Mirror UVs
	* - The puppet
	  - Set Canvas Size, Set World Origin, Change Texture Display, Set Runtime Target
	* - The atlas
	  - Move Art On Atlas, Rotate Art On Atlas, Scale Art On Atlas, Pin Art On Atlas, Unpin Art On Atlas, Repack Atlas
	* - Artwork
	  - Import Artwork, Reload Artwork, Relink Art, Match Artwork, Replace Artwork, Unbind Art, Delete Art, ``Delete Art, Ignore Layer``, Ignore Layer, Stop Ignoring Layer

A step with a name that is not in this list is shown as ``Edit``.

.. seealso::

	* :doc:`/interface/menus`
	* :doc:`/interface/settings`
	* :doc:`/interface/operation_strip`
