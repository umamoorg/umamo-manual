************
Blend Shapes
************

A blend shape is a change that is **added** to an object when a parameter has a value.  Where a keyform says "at this value the object looks like this", a blend shape says "at this value, add this much of that change on top of whatever the object looks like already".  A smile that adds to any face, and a blush that adds to any skin, are the usual uses.  Blend shapes are a feature of Cubism 4.2 and later.

What They Are
=============

A blend shape is bound to one object and driven by one parameter.  It has a few keys along the parameter, and at each key a **shape**: for a drawable, how far each vertex moves; for a warp deformer, a lattice; for a rotation deformer, a pivot.  The key at the value 0 of the parameter is always there, it is the neutral key, and it adds nothing.  Between the keys the shape is blended, and the result is added to what the keyform grid of the object gives at that pose.

Two things set them apart from keyforms:

* **They add, and they do not replace.**  Several blend shapes on one object, driven by different parameters, are summed.  Neither knows about the other.
* **They do not multiply the grid.**  A keyform on a new parameter adds a whole row of cells to the grid of an object.  A blend shape does not touch the grid, so it is the way to give an object a change without giving it the product of its keys.

A blend shape can also carry **weight limits**, which Cubism calls blend shape limits.  A limit is a curve over another parameter that caps the weight of the shape, and when there are several, the smallest cap wins.  Umamo keeps the limits that a model comes with and applies them.  It does not show or edit them.

Creating the Parameter
======================

A blend shape is driven by a parameter of the **blend shape** kind.  Make one with :guilabel:`Add Blend Shape Parameter`, in the :guilabel:`Add Parameter` menu of the Parameters editor or in its context menu.  It is called ``New Parameter``, goes from -1 to 1, and has a square thumb.  The entry is only in the menus when the runtime target has blend shape parameters, which is Cubism 4.2.  See :doc:`/rigging/parameters`.

The parameter is the dial.  Umamo does not yet have a tool to make the shape on an object that the dial drives, so a parameter that you make this way drives nothing until a model brings shapes for it.  See `Current Limitations`_.

Viewing Blend Shapes
====================

Move the dial and the shapes play, in every viewport.  To see what a model has:

* The Data tab of the Properties editor has a **Blend Shapes** section for a drawable or a deformer that has any.  It lists one line for each binding: the name of the parameter that drives it and the number of keys, such as ``Smile: 3 keys``.  It is read only, and an object with none shows no section.  See :doc:`/editors/properties/data_tab`.
* The Parameters editor draws the keys of blend shapes on the tracks of their parameters as **squares**, next to the circles of keyforms.  They are the keys of the whole model.  See :doc:`/editors/parameters`.
* The Keyform Sheet shows a :guilabel:`Blend Shape` track under each object that has one for the targeted parameter, with square marks.  The :guilabel:`Blend Shape Tracks` filter hides them.  The marks are for reading and cannot be selected, moved, or removed.  See :doc:`/editors/keyform_sheet`.

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: A drawable that has a blend shape: the Blend Shapes section at the end of its Data tab with a line such as ``Smile: 3 keys``, and the track of the Smile parameter in the Parameters editor with its square key marks.
	:Setup: Import a model that has blend shapes, such as a Cubism 4.2 or later model, select a drawable that has one, and open the Data tab.
	:Crop: The Properties editor and the Parameters editor, in one window picture.
	:Save as: ``images/rigging/blend_shapes.png``
	:Caption: The Blend Shapes section and the square key marks.

Interaction with Other Edits
============================

A blend shape is stored in the same space as the object it is on, so the edits that change that space take it along.

* **Reshaping a lattice** in Edit Mode, **moving a whole warp** in Object Mode, and **changing its resolution** move or resample the blend shapes of the warp together with its keyforms, so that the blend shapes do not pull the lattice back.  See :doc:`/rigging/deformers`.
* **Merge, Connect, Rip, and Duplicate** on a mesh carry the blend shape of each vertex along with its keyforms, and so does **Generate Mesh from Art**, which blends the blend shapes of the old mesh into the new one.  See :doc:`/modeling/meshes` and :doc:`/modeling/generate_mesh`.
* **Posing a lattice** keys the shape that you see **minus** the blend shapes of the warp at that pose, so the key holds the lattice and the blend shape stays separate.  See :doc:`/rigging/posing_warps`.
* **Deleting a parameter** drops the blend shapes and the weight limits that named it, so that the file has no missing ID.  See :doc:`/rigging/parameters`.

Version Gates
=============

Blend shapes came to Cubism in two steps, and the runtime target says which are available.  See :doc:`/files/runtime_targets`.

.. list-table::
	:header-rows: 1

	* - Feature
	  - From
	  - On an older target
	* - Blend shape parameters
	  - Cubism 4.2
	  - :guilabel:`Add Blend Shape Parameter` is hidden.  A MOC3 export makes the parameter an ordinary one.
	* - Blend shapes on a drawable or a warp deformer
	  - Cubism 4.2
	  - A MOC3 export leaves the blend shapes out.
	* - Blend shapes on a part, a rotation deformer, or a glue
	  - Cubism 5.0
	  - A MOC3 export leaves out those of the parts and the rotation deformers.

The target limits what you can author, and it does not take anything from the document.  A UMA file and a CMO3 file carry every blend shape, and only the copy that a MOC3 export writes is stripped.  The export reports what it left out.  See :doc:`/files/export_notices`.

Current Limitations
===================

* Blend shapes cannot be made, shaped, keyed, or removed one at a time in Umamo.  They come with an imported model, and they are kept, played, and written back.  Only the parameter that drives them can be made.
* The weight limits of a blend shape are kept and applied, and cannot be seen or edited.
* The Data tab lists the blend shapes of drawables and deformers, and not those of parts.

.. seealso::

	* :doc:`/rigging/parameters`
	* :doc:`/rigging/keyforms`
	* :doc:`/files/runtime_targets`
	* :doc:`/editors/properties/data_tab`
