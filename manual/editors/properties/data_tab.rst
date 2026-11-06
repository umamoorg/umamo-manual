********
Data Tab
********

The Data tab is about what the item is made of.  The tab, and its icon, change with the kind of item: a drawable gets its mesh, its texture, and the way it is blended; a deformer gets its colors and its lattice or its angle; a part gets its grouping.  See :doc:`/editors/properties/index` for the item the tab shows and for the fields that can be keyed.

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: The Data tab of a drawable with the Mesh, Texture, Blend, and Blend Shapes sections open.  In the Blend section, the Draw Order, Opacity, Blend, Alpha, Multiply Color, Screen Color, Cull Back Faces, Masked By, and Invert Mask rows, with at least one mask in the list and one field tinted green.
	:Setup: Use a model with the runtime target No Target.  Select a drawable that has a mask and a keyed opacity, and set the parameters off a key.
	:Crop: The Properties area, with its header.
	:Save as: ``images/editors/properties_data_drawable.png``
	:Caption: The Data tab of a drawable.

Drawable
========

Mesh
----

One line, ``Mesh: 128 verts, 214 tris``, which counts the vertices and triangles, or ``No mesh``.  A drawable that has a mesh also has two buttons:

* :guilabel:`Generate Mesh from Art` makes a new mesh from the drawable's artwork.
* :guilabel:`Generate Quad Mesh` makes a plain quad mesh in its place.

The buttons run the commands of the same names, over the selection, and they are dimmed when the command is not available.  See :doc:`/modeling/generate_mesh`.

Texture
-------

Which art the drawable is drawn from.

* ``Own Atlas Binding`` means that the drawable is bound to its own place on the atlas.
* ``Texture Source: ArtMesh12`` means that it shares the binding of another drawable, as a copy made by Duplicate does.  Deleting that drawable does not take the art from the copy.

:guilabel:`Pinned`
	A checkbox, which is there when Umamo has placed the art on its atlas page.  It holds the art in place: moving it by hand in the UV Editor is refused, and a repack leaves it where it is unless :guilabel:`Keep Pinned Tiles` is turned off.  This is the same flag that :guilabel:`Pin Art Placement` sets.  See :doc:`/editors/uv_editor/placement` and :doc:`/artwork/atlas_packing`.

Blend
-----

How the drawable is stacked and composited.

:guilabel:`Draw Order`
	Where the mesh stacks, from 0 to 1000.  Higher draws in front, and a tie goes to the one higher in the Outliner.  Inside a part that is Grouped or Isolated, the drawable stacks only among that part's contents.  It is keyable, and unlike the draw order of a part it can have a fraction, because it is blended between keys.

:guilabel:`Opacity`
	From 0, invisible, to 1, fully opaque.  Keyable.

:guilabel:`Blend`
	How the colors of the mesh mix with what is behind it, like the blend modes of a paint program.  See `Blend Mode and Alpha Mode Lists`_.

:guilabel:`Alpha`
	How the transparency of the mesh combines with what is behind it.  The row is left out when the blend mode ignores alpha, and when the runtime target has no alpha modes and the drawable uses the plain one, :guilabel:`Over`.

:guilabel:`Multiply Color` and :guilabel:`Screen Color`
	Two colors that tint the mesh.  :guilabel:`Multiply Color` multiplies the colors of the mesh by its color, to darken or tint it, and white leaves it as it is.  :guilabel:`Screen Color` screens its color over the mesh, to lighten it, and black leaves it as it is.  Both are keyable, and both are only there for runtime targets of Cubism 4.2 and later.

:guilabel:`Cull Back Faces`
	A checkbox.  Hides any part of the mesh that a deformation has flipped over, instead of drawing it mirrored.

:guilabel:`Masked By`
	The drawables that clip this one, so that it shows only where they have art.  See `Masks`_.

:guilabel:`Invert Mask`
	A checkbox.  Shows the mesh only where its masks have **no** art.  It is only there for runtime targets of Cubism 4.0 and later.

Each edit is one undo step, and History names it, such as ``Set Blend Mode`` or ``Set Opacity``.  See :doc:`/modeling/blending_and_masking`.

Masks
^^^^^

The :guilabel:`Masked By` row is a list of the masking drawables, over a search field that says ``Add Mask…``.

* Click the field, type part of a name, and press :kbd:`Enter` to add the match that is highlighted.
* Click the **dropper** and then a drawable in the 2D Viewport or a row of the Outliner to add that drawable.
* Click the remove button at the end of an entry to take it off.
* Drag the handle under the list to change its height.  The height is saved in the document.

Any drawable can be a mask except the drawable itself.  A drawable is listed once.

Blend Shapes
------------

A read-only line for every blend shape the drawable has, such as ``Smile: 3 keys``, with the name of the parameter that drives it and the number of keys.  The section is left out for a drawable that has none.  A blend shape is made and keyed elsewhere.  See :doc:`/rigging/blend_shapes`.

Warp Deformer
=============

The :guilabel:`Deformer` section of a warp.

:guilabel:`Opacity`, :guilabel:`Multiply Color`, and :guilabel:`Screen Color`
	Scale and tint **everything the deformer moves**, deformers nested in it included.  Opacity goes from 0 to 1, and 1 leaves it as it is.  The two colors follow the same rules as those of a drawable.  All three are keyable.

:guilabel:`Lattice`
	Not a value.  It names the parameters that the lattice is keyed on, such as ``Keyed on Angle X, Angle Y``, or says ``Not keyed``.  The tint shows whether the pose is on a key, between keys, or holds a shape that you made in Pose Mode and have not keyed.  Point at the row and press :kbd:`I` to key the lattice at the pose.  See :doc:`/editors/keyform_sheet` and :doc:`/rigging/posing_warps`.

:guilabel:`Rows` and :guilabel:`Columns`
	How many cells the lattice has from top to bottom and from left to right, from 1 to 100, with the padlock for their proportions.  A change resamples the keyforms of the mesh, keeps the art in place, and shows an operation strip titled ``Lattice Resolution``.  The pair works in Edit Mode only, and is dimmed in Object Mode and Pose Mode.  See :doc:`/rigging/deformers`.

:guilabel:`Bilinear (Quad)`
	A checkbox.  Bends each cell smoothly between its four corners, and not as a fan of two triangles.  It works in Edit Mode only, and it is only there for runtime targets of Cubism 3.3 and later.  History names it ``Toggle Bilinear Warp``.

Rotation Deformer
=================

The :guilabel:`Deformer` section of a rotation.

* :guilabel:`Opacity`, :guilabel:`Multiply Color`, and :guilabel:`Screen Color` are the same as for a warp.
* :guilabel:`Base Angle` is the rotation of the deformer at rest, in degrees.  It is the same field as in the Object tab.  See :doc:`/editors/properties/object_tab`.
* :guilabel:`Flip X` and :guilabel:`Flip Y` mirror everything the deformer moves, left to right and top to bottom, about its pivot.  They are keyable, and a flag does not blend: it takes the value of the key below the pose.

Part
====

The :guilabel:`Part` section.

:guilabel:`Guide Image`
	A checkbox.  Marks the part as a guide image, such as a reference sketch.  It shows in the editor, and a MOC3 export leaves it and everything in it out.  Its row in the Outliner is dimmed.  History names it ``Toggle Guide Image``.

:guilabel:`Draw Order`
	Where the whole part stacks, a whole number from 0 to 1000.  Higher draws in front.  It counts only when :guilabel:`Group Mode` is :guilabel:`Grouped` or :guilabel:`Isolated`.  It is keyable.

:guilabel:`Group Mode`
	How the contents of the part stack with the rest of the model.

	* :guilabel:`Pass Through`: each drawable stacks by its own draw order.
	* :guilabel:`Grouped`: the whole part stacks at the draw order of the part.
	* :guilabel:`Isolated`: like :guilabel:`Grouped`, and the part is also drawn as one layer with its own opacity, blend, colors, and masks.

An **isolated** part has more rows, which are the settings of the layer: :guilabel:`Opacity`, :guilabel:`Blend`, :guilabel:`Alpha`, :guilabel:`Multiply Color`, :guilabel:`Screen Color`, :guilabel:`Masked By`, and :guilabel:`Invert Mask`.  They work as the same rows of a drawable do, with two differences.  The opacity applies once to the whole layer, so drawables that overlap inside the part do not show through each other.  And :guilabel:`Masked By` can hold parts as well as drawables: a part stands for every drawable inside it, and keeps standing for them as they change.  A part cannot mask itself.

The layer is only shown while the part is :guilabel:`Isolated`, and it is kept while you change the mode, so choosing :guilabel:`Grouped` and then :guilabel:`Isolated` again gives you the settings back.  Isolated parts need a runtime target of Cubism 5.3 or :guilabel:`No Target (All Features)`.  Under an older target the list does not offer :guilabel:`Isolated`, unless the part already is, and then the layer rows are left out and cannot be edited.

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: The Data tab of an isolated part: Guide Image, Draw Order, and Group Mode set to Isolated, then the layer rows Opacity, Blend, Alpha, Multiply Color, Screen Color, Masked By with one drawable and one part in the list, and Invert Mask.
	:Setup: Use a model with the runtime target No Target.  Select a part, and set its Group Mode to Isolated.
	:Crop: The Properties area, with its header.
	:Save as: ``images/editors/properties_data_part.png``
	:Caption: The Data tab of an isolated part.

Blend Mode and Alpha Mode Lists
===============================

The :guilabel:`Blend` list has these modes, in this order.

.. list-table::
	:header-rows: 1

	* - Group
	  - Modes
	* - Honor the :guilabel:`Alpha` setting
	  - :guilabel:`Normal`, :guilabel:`Additive`, :guilabel:`Additive (Glow)`, :guilabel:`Darken`, :guilabel:`Multiply`, :guilabel:`Color Burn`, :guilabel:`Linear Burn`, :guilabel:`Lighten`, :guilabel:`Screen`, :guilabel:`Color Dodge`, :guilabel:`Overlay`, :guilabel:`Soft Light`, :guilabel:`Hard Light`, :guilabel:`Linear Light`, :guilabel:`Hue`, :guilabel:`Color`
	* - Ignore the :guilabel:`Alpha` setting
	  - :guilabel:`Additive (Legacy)`, :guilabel:`Multiply (Legacy)`

The two modes named *Legacy* are the Add and Multiply modes that Cubism had before 5.3.  They blend in a premultiplied form and do not look at :guilabel:`Alpha`, and the row is left out when you choose one.  A runtime target before Cubism 5.3 offers only :guilabel:`Normal` and these two, plus the mode the item already has.

The :guilabel:`Alpha` list has five modes.

:guilabel:`Over`
	Stacks normally.  Every earlier version of Cubism behaves like this.

:guilabel:`Atop`
	Draws only over art that is already there.

:guilabel:`Out`
	Erases what is behind it, instead of drawing.

:guilabel:`Conjoint` and :guilabel:`Disjoint`
	Change how soft edges overlap.

A runtime target before Cubism 5.3 offers only :guilabel:`Over`, plus the mode the item already has, so that the only way forward from a mode the target cannot play is back to :guilabel:`Over`.  See :doc:`/files/runtime_targets`.

.. seealso::

	* :doc:`/modeling/blending_and_masking`
	* :doc:`/modeling/generate_mesh`
	* :doc:`/rigging/deformers`
	* :doc:`/editors/keyform_sheet`
	* :doc:`/files/runtime_targets`
