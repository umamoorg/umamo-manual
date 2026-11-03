*******************
Parts and Drawables
*******************

A model is made of three kinds of things: **drawables**, which are pieces of art with a mesh, **parts**, which group them, and **deformers**, which move them.  This page is about the first two, and about how they are ordered, shown, and hidden.  Deformers are in :doc:`/rigging/deformers`.

Two Hierarchies
===============

Every drawable belongs to two trees at once, and the two do not have to agree.

The **organization tree** is made of parts and drawables.  A part holds drawables and other parts, in order.  This tree decides how the art is stacked, what is shown or hidden together, and how the model is laid out in the Outliner.  A drawable is in exactly one part, or at the top level.  The top of the list is the front.

The **deformer chain** is made of deformers.  A drawable has one **parent deformer**, or none, and a deformer has a parent deformer, or none.  This tree decides how the art moves: a drawable follows its parent deformer, which follows its own parent, and so on up.  See :doc:`/rigging/deformers`.

So putting a drawable in another part changes its stacking and its visibility, and it moves nothing.  Giving it another parent deformer changes how it moves, and it does not move it in the stack.  The Outliner shows both: the :guilabel:`Armature` has the deformer chain, and the parts show the organization tree.  In the Properties editor the :guilabel:`Parent Part` and :guilabel:`Parent Deformer` fields of the Object tab set them one at a time.  See :doc:`/editors/outliner` and :doc:`/editors/properties/object_tab`.

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: The Outliner and the Object tab of the Properties editor side by side, for a drawable inside a part and under a warp deformer: the Armature with the warp, the part with the drawable, and the Parent Part and Parent Deformer fields filled in.
	:Setup: Open a model whose drawable sits under a warp deformer, and select that drawable.
	:Crop: The Outliner and the Properties editor, in one picture.
	:Save as: ``images/modeling/two_hierarchies.png``
	:Caption: A drawable in the organization tree, and in the deformer chain.

Parts
=====

A part is a folder.  It has a name, an eye, and a pointer, like a drawable, and it has the settings below.  A part is made by the import of artwork, one for each folder in the file, and it is listed in the Outliner.  Its settings are in the Data tab, and they are described there in full.  See :doc:`/editors/properties/data_tab`.

Group Mode
----------

How the contents of a part are stacked with the rest of the model.  There are three.

:guilabel:`Pass Through`
	The part is invisible to stacking.  Each drawable inside stacks on its own, with the drawables around the part.

:guilabel:`Grouped`
	The part and all that is inside it take **one place** in the stack, at the draw order of the part.  Inside, the drawables are stacked among themselves.  Nothing from outside can come between them.

:guilabel:`Isolated`
	Like :guilabel:`Grouped`, and the part is also drawn as one picture, which is then put on the model with the opacity, blend mode, colors, and masks of the part.  This is the offscreen drawing of Cubism 5.3.  See :doc:`/modeling/blending_and_masking`.

A new part imported from a folder is :guilabel:`Pass Through`, unless the folder's blend mode or opacity asks for more.  See :doc:`/artwork/importing`.

Draw Order
----------

Where a part stacks, as a whole number from 0 to 1000.  It starts at 500.  Higher is in front.  A part has a draw order that counts only when its group mode is :guilabel:`Grouped` or :guilabel:`Isolated`, because only then does it take a place of its own.  The number can be keyed, so that a part comes forward at some pose.

Guide Image
-----------

A part marked as a **guide image** is a reference, such as the sketch the character was drawn from.  It shows in Umamo, and a MOC3 export leaves it out, together with everything inside it.  Its row in the Outliner is dimmed.

Delete versus Delete Hierarchy
------------------------------

Both are in the row menu of a part in the Outliner, and both ask nothing.  Undo brings them back.

:guilabel:`Delete`
	Removes the part and keeps its contents.  The drawables and parts that were inside rise into the part's parent.  It is how you take apart a folder.

:guilabel:`Delete Hierarchy`
	Removes the part and everything inside it, drawables included.

Drawables
=========

A drawable is one piece of art with its mesh.  Its settings are in the Data tab of the Properties editor, and the ones that decide how it is stacked, blended, and masked are on this page and the next.  See :doc:`/editors/properties/data_tab` and :doc:`/modeling/blending_and_masking`.

Draw Order
----------

Where the mesh stacks, from 0 to 1000, starting at 500.  Higher is in front.  Unlike the draw order of a part, it can have a fraction, because it is blended between keys, and it can be keyed.

When two drawables have the same draw order, the one **higher in the Outliner** is in front.  So the order in the Outliner is the stack at rest, and the numbers move a drawable out of it.  Inside a part that is :guilabel:`Grouped` or :guilabel:`Isolated`, a drawable stacks only among the contents of that part.

Cull Back Faces
---------------

A deformation can fold part of a mesh over, so that its back faces the viewer.  Normally the folded part is drawn mirrored.  With :guilabel:`Cull Back Faces` on, it is not drawn.  It is off at first, and the mesh is drawn from both sides.

Parent Deformer
---------------

The deformer that moves the drawable.  Set it in the :guilabel:`Parent Deformer` field of the Object tab, by picking in the Outliner or in the viewport, or let :guilabel:`Create Warp Deformer` wrap the selection in a new one.  The Outliner cannot drop a drawable on a deformer.

When the parent changes, the drawable stays where it rests, because the :guilabel:`Keep in Place` strip is on at first.  Clear it, and the drawable keeps its numbers and follows the new parent.  See :doc:`/editors/outliner` and :doc:`/rigging/deformers`.

Visibility and Selectability
============================

Each part and drawable has an **eye**, which shows or hides it, and a **pointer**, which says whether a click in the viewport can select it.  Both are in the Outliner, as two columns.  See :doc:`/editors/outliner`.

Hiding a part hides all that is inside it, whatever the eyes inside say.  Hiding a drawable hides only that one.  The eye is a display setting and nothing else: a hidden drawable is still part of the model, and it keeps moving with its deformers.  Deformers have no eye.

An object that cannot be selected is skipped by clicks and boxes in the viewport, and it can still be selected in the Outliner.

Toggle Visibility
-----------------

.. admonition:: Reference
	:class: refbox

	:Mode: Object Mode
	:Menu: Context menu
	:Shortcut: :kbd:`H`

Hides what is shown and shows what is hidden, for the whole selection at once.  It takes the active object, the one you selected last, and sets the whole selection to the opposite of its state, so a mixed selection ends up the same.  It is one undo step.  If the active object is a deformer, nothing happens, because a deformer has no eye.

The command works in any mode, but the context menu has it only in Object Mode.

Duplicate and Delete
====================

Duplicate, :kbd:`Shift-D`, makes a copy of each selected drawable that has a mesh and each selected warp deformer, in Object Mode.  The copy has the name of the original with a number, ``.001`` and so on, and sits right after it in the same part, under the same deformer.  It shares the art of the original.  Parts are not copied, so to copy the contents of a part, select them with :guilabel:`Select Hierarchy` in the Outliner and duplicate.  The details are in :doc:`/modeling/meshes`.

To delete a drawable, use :guilabel:`Delete` in its row menu in the Outliner.  Deleting a drawable does not take the art from its copies.  See :doc:`/editors/outliner`.

.. seealso::

	* :doc:`/editors/outliner`
	* :doc:`/editors/properties/data_tab`
	* :doc:`/modeling/blending_and_masking`
	* :doc:`/rigging/deformers`
