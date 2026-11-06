*******
Rigging
*******

Rigging is making a model move.  The art is there, cut into drawables with meshes, and it holds still.  Rigging gives it dials, the parameters; the things the dials move, the deformers; and the stored looks that say what moves where, the keyforms.  This chapter is about that work, and about the parts of a rig that Umamo can carry but not yet make.  The art itself is in :doc:`/modeling/index`.

.. toctree::
	:maxdepth: 1

	deformers
	parameters
	keyforms
	posing_warps
	blend_shapes
	glue
	physics

The Rigging Workflow
====================

The work goes in rounds, and you can return to any step.

#. **Add the dials.**  The first artwork that you add brings the Humanoid set of 39 standard parameters, unless the :guilabel:`Parameter Template` setting says :guilabel:`None`.  Add, name, and range the rest in the Parameters editor.  See :doc:`/rigging/parameters`.
#. **Wrap the art in warps.**  Select the drawables that move together, and run :guilabel:`Create Warp Deformer`.  Nest warps in each other, so that a small warp for an eye is carried by a larger one for the face.  Fit each lattice to its art in Edit Mode.  See :doc:`/rigging/deformers`.
#. **Pose, shape, and key.**  Target a parameter, move it to the value that you want to key, shape the lattice in Pose Mode, and press :kbd:`I`.  Do it again at the other values.  See :doc:`/rigging/posing_warps` and :doc:`/rigging/keyforms`.
#. **Key the other properties.**  Opacity, colors, and draw order are keyed from the Properties editor in the same way.  See :doc:`/rigging/keyforms`.
#. **Look at it.**  Scrub the parameters, and read the keys in the Keyform Sheet.  Move or remove a key that is in the wrong place.  See :doc:`/editors/keyform_sheet`.
#. **Export.**  Write the model as a CMO3 or a MOC3.  See :doc:`/files/exporting`.

The mesh of a drawable can be regenerated at any time and the rig stays, so a change to the art or to the mesh does not undo this work.  See :doc:`/modeling/generate_mesh`.

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: The Modelling workspace in the middle of rigging a head: the Parameters editor on the left with the Angle X slider on a key, the 2D Viewport in Pose Mode with the lattice of a head warp, the Keyform Sheet under it with the Geometry track, and the Outliner and Properties editor on the right.
	:Setup: Open a model with a keyed head warp, target Angle X in the Parameters editor, put it on a key, select the head warp, and press Ctrl-Tab.
	:Crop: The whole window.
	:Save as: ``images/rigging/workflow.png``
	:Caption: The Modelling workspace while rigging.

What You Can Author Today
=========================

Umamo can open a rig that was made in the Cubism Editor and play all of it, and it can make most of the kinds of work that are listed here.  Some parts of a rig it carries without being able to make them yet.

.. list-table::
	:header-rows: 1

	* - Part of a rig
	  - Made in Umamo
	  - Carried from an import
	* - Parameters and their groups
	  - Yes: add, rename, range, link, group, reorder, and delete.
	  - Yes
	* - Warp deformers
	  - Yes: create, shape, resize, move, nest, duplicate, and delete.
	  - Yes
	* - Rotation deformers
	  - No.  Base angle, opacity, colors, and flips can be edited.
	  - Yes
	* - Keys of a warp's lattice
	  - Yes, in Pose Mode.
	  - Yes
	* - Keys of opacity, colors, and draw order
	  - Yes.
	  - Yes
	* - Keys of a drawable's mesh and a rotation's pivot
	  - No.  They can be moved and removed on the Keyform Sheet.
	  - Yes
	* - Blend shapes
	  - The parameter only.
	  - Yes
	* - Glue
	  - No.  Its intensity keys can be edited on the Keyform Sheet.
	  - Yes
	* - Physics, motions, and expressions
	  - No.
	  - Kept and written back.

"Carried" means that Umamo keeps it while the document is open and writes it back on export, unless the runtime target is older than the feature.  All of it but the physics, motions, and expressions is also played in the viewport.  See :doc:`/files/runtime_targets` and :doc:`/files/cubism_interchange`.

.. seealso::

	* :doc:`/rigging/deformers`
	* :doc:`/rigging/parameters`
	* :doc:`/rigging/keyforms`
	* :doc:`/getting_started/coming_from_cubism`
