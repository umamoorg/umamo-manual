********************
Blending and Masking
********************

The way that a drawable is drawn onto the model is made of a few settings: how see-through it is, how its colors mix with what is behind it, how it is tinted, and where it is cut away by other drawables.  This page says what each of them means.  The fields themselves, and where to find them, are in the Data tab of the Properties editor.  See :doc:`/editors/properties/data_tab`.

Some of these settings are features that only newer versions of Cubism can play.  `Runtime Target Limits`_ says which.

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: The same piece of art three times, side by side: drawn normally, drawn with a different blend mode, and masked by another drawable with Invert Mask on.
	:Setup: Use a model with the runtime target No Target.  Duplicate a drawable that overlaps another, and set the blend mode of one, and the mask of another.
	:Crop: The viewport, around the three drawables.
	:Save as: ``images/modeling/blend_and_mask.png``
	:Caption: Blend mode and mask on the same art.

Opacity
=======

Opacity says how much of the drawable shows, from 0, which is invisible, to 1, which is fully opaque.  It is keyable, so a drawable can fade in and out as a parameter moves.  Opacity is different from the eye: the eye hides the drawable in the editor's view, and opacity is part of the model's motion.  See :doc:`/modeling/parts_and_drawables`.

Opacity is not only for drawables.

* A **warp deformer** or a **rotation deformer** has an opacity that scales everything it moves, the deformers nested in it included.
* An **isolated part** has the opacity of its layer, which is applied once to the whole of what the part draws.  See `Isolated Parts and Composites`_.

Blend Mode
==========

The blend mode says how the colors of the drawable mix with the colors that are already there.  It is chosen from a list, :guilabel:`Blend`, and it is not keyable.  It is :guilabel:`Normal` at first, which draws the drawable over what is behind it.

The other modes are the ones of a paint program, and they work as they do there.  They fall into groups by what they do:

.. list-table::
	:header-rows: 1

	* - Group
	  - Modes
	  - In short
	* - Lighten
	  - :guilabel:`Additive`, :guilabel:`Additive (Glow)`, :guilabel:`Lighten`, :guilabel:`Screen`, :guilabel:`Color Dodge`
	  - Make what is behind lighter.  Good for glows, light, and shine.
	* - Darken
	  - :guilabel:`Darken`, :guilabel:`Multiply`, :guilabel:`Color Burn`, :guilabel:`Linear Burn`
	  - Make what is behind darker.  Good for shadows and shading.
	* - Contrast
	  - :guilabel:`Overlay`, :guilabel:`Soft Light`, :guilabel:`Hard Light`, :guilabel:`Linear Light`
	  - Lighten the light parts and darken the dark ones.
	* - Color
	  - :guilabel:`Hue`, :guilabel:`Color`
	  - Take the hue, or the hue and the saturation, from the drawable, and the rest from what is behind.
	* - Older
	  - :guilabel:`Additive (Legacy)`, :guilabel:`Multiply (Legacy)`
	  - The two blend modes that Cubism had before 5.3.

Artwork imports carry their blend modes in: the mode of a layer in the file becomes the mode of the drawable, and a mode that Umamo does not know is read as :guilabel:`Normal`.  See :doc:`/artwork/supported_formats`.

The full list, and which ones a runtime target allows, are in :doc:`/editors/properties/data_tab`.

Alpha Mode
==========

The blend mode is about color.  The **alpha mode** is about transparency: how the see-through parts of the drawable combine with what is behind it.  It is a Cubism 5.3 feature.  The list is :guilabel:`Alpha`.

:guilabel:`Over`
	The usual way.  The drawable is stacked on what is behind it.  Every Cubism before 5.3 draws like this, and it is the first choice.

:guilabel:`Atop`
	The drawable is drawn only over art that is already there.

:guilabel:`Out`
	The drawable erases what is behind it instead of being drawn.

:guilabel:`Conjoint` and :guilabel:`Disjoint`
	Change how the soft edges of the drawable overlap with those behind it.

The Alpha row is left out when the blend mode is one of the older two, which ignore it.

Multiply Color and Screen Color
===============================

Two colors tint a drawable without changing its art.

:guilabel:`Multiply Color`
	Multiplies the colors of the drawable.  It darkens and tints.  White leaves the drawable as it is.

:guilabel:`Screen Color`
	Screens a color over the drawable.  It lightens.  Black leaves the drawable as it is.

Both are keyable, so the tint can change with a parameter, such as a blush that comes up with an expression or a shade that falls over a face as it turns.  They are on drawables, on deformers, where they tint everything the deformer moves, and on isolated parts, where they tint the whole layer.  Both need a runtime target of Cubism 4.2 or later.

Masks
=====

A **mask** cuts a drawable away to the shape of other drawables.  The drawable that is masked shows only where its masks have art.  A mask is how an eye is kept inside its socket, or how a highlight stays on the surface that it lies on.

Masked By
---------

The :guilabel:`Masked By` list holds the drawables that clip this one.  Add one by typing its name in the field, or with the dropper and a click in the viewport or the Outliner.  Any drawable but the drawable itself can be a mask.  The list of masks is not keyable.  See :doc:`/editors/properties/data_tab`.

A mask is a drawable like any other, and it is drawn too.  If you want only its shape, hide it with its eye.  A hidden drawable is still deformed, so it goes on masking.

A layer that was set to clip to the layer below it in the artwork file comes in already masked by that layer.  See :doc:`/artwork/importing`.

Invert Mask
-----------

:guilabel:`Invert Mask` turns the cut around.  The drawable then shows only where its masks have **no** art, so the mask is a hole instead of a window.  It needs a runtime target of Cubism 4.0 or later.

Isolated Parts and Composites
=============================

A part whose group mode is :guilabel:`Isolated` is drawn in two steps.  First everything inside it is drawn together, on a layer of its own.  Then that layer is put on the model as one picture.  The picture is the part's **composite**, and it has the settings of a drawable: :guilabel:`Opacity`, :guilabel:`Blend`, :guilabel:`Alpha`, :guilabel:`Multiply Color`, :guilabel:`Screen Color`, :guilabel:`Masked By`, and :guilabel:`Invert Mask`.  It is Cubism 5.3's offscreen drawing.

Why would you want it?

* An opacity of the part is applied **once**, to the finished picture.  Without it, a drawable that overlaps another inside a part would let the other show through when the part fades.
* A blend mode, a tint, or a mask of the part works on all that is inside as a unit.
* One mask cuts away everything inside the part together.

The composite's opacity and its two colors are keyable.  Its blend mode, alpha mode, and masks are not.

:guilabel:`Masked By` of a composite can hold **parts** as well as drawables.  A part stands for all the drawables inside it, and goes on standing for them as drawables are added and removed.  A part cannot mask itself.  This is an Umamo addition: Cubism names drawables only, so a CMO3 or MOC3 export writes the drawables in place of the part, and the clipping looks the same.  The grouping is lost there, and a UMA file keeps it.

The settings of the composite stay with the part when you change the group mode.  Choose :guilabel:`Grouped` and then :guilabel:`Isolated` again, and you have them back.

A folder of an artwork file whose blend mode is not Normal, or whose opacity is below 100%, is imported as an isolated part with that blend mode and opacity.  See :doc:`/artwork/importing`.

Runtime Target Limits
=====================

Each setting on this page comes from a version of Cubism.  The runtime target of the document says which versions the model is for, and Umamo hides the settings that the target cannot play.  See :doc:`/files/runtime_targets`.

.. list-table::
	:header-rows: 1

	* - Setting
	  - From
	  - On an older target
	* - :guilabel:`Invert Mask`
	  - Cubism 4.0
	  - The checkbox is hidden.  A MOC3 export keeps an inverted mask that you already have, because every MOC3 version has room for it.
	* - :guilabel:`Multiply Color`, :guilabel:`Screen Color`
	  - Cubism 4.2
	  - The rows are hidden.  A MOC3 export sets the color back to nothing and drops its keys.
	* - The new blend modes, and :guilabel:`Alpha`
	  - Cubism 5.3
	  - The list holds :guilabel:`Normal` and the two older modes.  A MOC3 export changes a newer mode to the nearest older one: the Additive modes become :guilabel:`Additive (Legacy)`, :guilabel:`Multiply` becomes :guilabel:`Multiply (Legacy)`, and every other mode becomes :guilabel:`Normal`.  The alpha mode becomes :guilabel:`Over`.
	* - :guilabel:`Isolated` parts
	  - Cubism 5.3
	  - The group mode is not offered.  A MOC3 export makes an isolated part :guilabel:`Grouped`, so its contents keep one place in the stack and are no longer drawn as one picture.

The target limits what you can *author*, and nothing is taken out of the document.  A model that already has one of these settings keeps it and draws it in Umamo, and the control stays in view so that you can change it.  A UMA file and a CMO3 file carry all of them.  Only the copy that a MOC3 export writes is stripped, and it reports what it changed, so exporting again with a higher target brings the settings back.  A mask of a part works on every target, because it is written as drawables.  See :doc:`/files/export_notices`.

.. seealso::

	* :doc:`/editors/properties/data_tab`
	* :doc:`/modeling/parts_and_drawables`
	* :doc:`/files/runtime_targets`
