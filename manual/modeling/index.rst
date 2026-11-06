********
Modeling
********

Modeling is the work of giving a model its shape: deciding which pieces of art there are, how they are grouped and stacked, how finely each one is meshed, and how it is cut, blended, and tinted.  It comes between importing the artwork and rigging it.  The art is there, and it does not move yet.  This chapter is about the tools for that work.  Moving the model is in :doc:`/rigging/index`.

.. toctree::
	:maxdepth: 1

	parts_and_drawables
	modes
	selecting
	transforming
	snapping
	proportional_editing
	meshes
	generate_mesh
	blending_and_masking

Parts, Drawables, and Deformers
===============================

A model is made of three kinds of objects.

:doc:`Drawables </modeling/parts_and_drawables>`
	The pieces of art.  A drawable has a mesh, which is what the art is stretched over, and the settings of how it is stacked, blended, and masked.  There is one for each layer of an artwork file.

:doc:`Parts </modeling/parts_and_drawables>`
	The folders.  A part groups drawables and other parts, to stack them and to show or hide them together, and it can draw its contents as one picture.

:doc:`Deformers </rigging/deformers>`
	The things that move drawables.  A warp deformer bends what is inside it with a lattice, and a rotation deformer turns it about a pivot.  They belong to rigging, and modeling is where you make the meshes they will bend.

The first two are arranged in a tree that sets the stacking order.  The deformers are arranged in another tree that sets how things move.  Every drawable is in both.  See :doc:`/modeling/parts_and_drawables`.

Where Modeling Happens
======================

Most of it is in the **Modelling** workspace, which Umamo opens in.  See :doc:`/interface/workspaces`.

:doc:`The 2D Viewport </editors/viewport_2d/index>`
	Where you select, move, and shape the model.  Its mode decides what the pointer does: whole objects in Object Mode, meshes and lattices in Edit Mode, lattices at a pose in Pose Mode.  See :doc:`/modeling/modes`.

:doc:`The Outliner </editors/outliner>`
	The tree of parts, drawables, and deformers.  It selects, renames, hides, deletes, and moves.

:doc:`The Properties editor </editors/properties/index>`
	The settings of what is selected, such as the draw order, the blend mode, and the masks, and the exact position and size of an object.

:doc:`The UV Editor </editors/uv_editor/index>`
	Where the texture coordinates of a mesh are edited, and where the art is placed on the atlas.  It shares its selection, its select modes, and its snapping with the viewport.

A typical order of work is:

#. **Add the artwork**, and let Umamo make a drawable and a first mesh for each layer.  See :doc:`/artwork/importing`.
#. **Arrange** the parts and the stacking in the Outliner, and set the blend modes and the masks.
#. **Mesh** the drawables that need to bend: generate them again with settings that suit them, and then edit by hand where the mesh falls short.  See :doc:`/modeling/generate_mesh` and :doc:`/modeling/meshes`.
#. **Rig**: wrap the meshes in deformers and key the parameters.  See :doc:`/rigging/index`.

None of these is final.  You can come back to any of them, and regenerating a mesh keeps the rig that is on it.

.. seealso::

	* :doc:`/editors/viewport_2d/index`
	* :doc:`/editors/outliner`
	* :doc:`/rigging/index`
