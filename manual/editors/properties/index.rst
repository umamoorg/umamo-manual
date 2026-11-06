**********
Properties
**********

The Properties editor shows the settings of the document, and the settings of the item you are working on.  It is where you type exact values, choose a blend mode, bind an object to a parent, and read what a runtime target restricts.  What it shows follows the selection and the editor mode, and the controls that the document's runtime target cannot play are left out.

.. toctree::
	:maxdepth: 1

	document_tab
	object_tab
	data_tab

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: The Properties editor beside a 2D Viewport, on the Data tab of a drawable.  The tab strip on the left with all three tabs, and the Mesh, Texture, and Blend sections open.  The search field in the header.
	:Setup: Open a model, select a drawable, and open the Data tab.
	:Crop: The Properties area, with its header.
	:Save as: ``images/editors/properties.png``
	:Caption: The Properties editor.

Layout
======

A column of icon tabs is at the left edge, and the active tab fills the rest of the area.  The header has a search field in the middle, and nothing else.  Neither shows without a document.

The active tab is a stack of **sections**.  A section has a heading and a card of rows under it.  Click the heading to fold the card away or to open it.  Each row is a label and a field.  Rest the pointer on a label for a sentence that says what the field does and what its unit is.

The tab that is shown, the sections that you folded, and the height that you gave the Masked By list belong to the area, and are saved in the document.  The search text is not saved.  See :doc:`/files/uma`.

Tabs and When They Appear
=========================

There are three tabs, always in this order.

:guilabel:`Document`
	The settings of the whole document.  It is always there, with nothing selected as well.  See :doc:`/editors/properties/document_tab`.

:guilabel:`Object`
	Where the item is, and what it is bound to.  It needs an item.  See :doc:`/editors/properties/object_tab`.

:guilabel:`Data`
	What the item is made of.  It needs an item, and its icon is the item's own: a mesh, a warp deformer, a rotation deformer, or a part.  See :doc:`/editors/properties/data_tab`.

The item is the **active** one of the selection, even when several things are selected.  When nothing is active, it is the one that was active last, so the tabs do not vanish when you click an empty place.  An item that was deleted no longer counts.  The Item tab of the sidebar shows the same item.  See :doc:`/editors/viewport_2d/sidebar`.

If you saved a document with the Object tab open and open it with nothing selected, the area shows the Document tab, and goes back to the Object tab when an item is selected.

Item-Type Matrix
================

Which sections each kind of item has:

.. list-table::
	:header-rows: 1

	* - Item
	  - Object tab
	  - Data tab
	* - Drawable with a mesh
	  - :guilabel:`Transform`, :guilabel:`Relations`
	  - :guilabel:`Mesh`, :guilabel:`Texture`, :guilabel:`Blend`, :guilabel:`Blend Shapes`
	* - Drawable without a mesh
	  - :guilabel:`Relations`
	  - :guilabel:`Mesh`, :guilabel:`Texture`, :guilabel:`Blend`, :guilabel:`Blend Shapes`
	* - Warp deformer
	  - :guilabel:`Transform`, :guilabel:`Relations`
	  - :guilabel:`Deformer`, :guilabel:`Blend Shapes`
	* - Rotation deformer
	  - :guilabel:`Transform`, :guilabel:`Relations`
	  - :guilabel:`Deformer`, :guilabel:`Blend Shapes`
	* - Part
	  - :guilabel:`Transform`, :guilabel:`Relations`
	  - :guilabel:`Part`

A section that has nothing to show for an item is left out, and not shown empty.  :guilabel:`Blend Shapes` is only there when the item has a blend shape.  A drawable without a mesh has no place, and so has no :guilabel:`Transform`.

Searching Properties
====================

Type in the search field of the header to find a setting by its name.  The match ignores upper and lower case.

* A search that matches the heading of a section shows every row of that section.
* Otherwise it shows the rows whose labels match, with the sections they are in.
* Every section opens while you search, whatever you folded.
* The tab strip shows only the tabs that have a match, and the area changes to the first of them if the tab you were on has none.

When nothing matches, the area says ``No matching properties.``  Clear the field to get your tabs and folds back.

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: The Properties editor with ``color`` typed in the search field, on the Data tab of a drawable: the Blend section with only the Multiply Color and Screen Color rows, and the tab strip reduced to the tabs that match.
	:Setup: Select a drawable on a document whose runtime target is No Target, open the Data tab, and type ``color``.
	:Crop: The Properties area, with its header.
	:Save as: ``images/editors/properties_search.png``
	:Caption: Searching the properties.

Keyable Fields
==============

Some fields can be keyed: their value can change with the parameters, as the shape of a warp does.  These are the keyable fields:

.. list-table::
	:header-rows: 1

	* - Field
	  - Item
	* - :guilabel:`Draw Order`
	  - Drawable, and part
	* - :guilabel:`Opacity`
	  - Drawable, deformer, and an isolated part
	* - :guilabel:`Multiply Color`, :guilabel:`Screen Color`
	  - Drawable, deformer, and an isolated part
	* - :guilabel:`Flip X`, :guilabel:`Flip Y`
	  - Rotation deformer
	* - :guilabel:`Lattice`
	  - Warp deformer

The :guilabel:`Lattice` row of a warp deformer has no value to type.  It names the parameters that the lattice is keyed on, or says ``Not keyed``, and :kbd:`I` over it keys the lattice at the pose.

A keyable field has one of four looks.

No tint
	The field has no track.  An edit changes its one value, as an edit of any other field does, and is one undo step.

Yellow
	The field has a track, and the parameters are sitting exactly on one of its keys.  An edit changes that key's value.

Green
	The field has a track, and the parameters are between its keys.  The value that you see is blended from the keys.

Orange
	You have edited a keyed field and have not keyed the edit yet.

The tint is a wash over the field with the same color on its text.  The colors are the ones Blender uses for keyframes, and they are the same in the light and the dark theme.

Editing a field that has a track does not change the track.  The new value shows in the viewport as a pending edit, in orange, and it is lost the next time you move a parameter.  To keep it, **key** it: point at the field and press :kbd:`I`.  :kbd:`Alt-I` takes the key at the parameters off again.  The context menu of the field has :guilabel:`Insert Keyframe` and :guilabel:`Delete Keyframe` as well, with the shortcuts that are bound.  They work in Object Mode and in Pose Mode, and they are dimmed in Edit Mode.  See :doc:`/editors/keyform_sheet`, :doc:`/rigging/keyforms`, and :doc:`/interface/keymap`.

Where the key lands is decided by the parameter that is targeted for keying, which you choose in the Parameters editor.  See :doc:`/editors/parameters`.

Editing Values
==============

Number Fields
-------------

Every number is typed or dragged in the same kind of field.

* **Click** it and type, then press :kbd:`Enter`.  :kbd:`Escape` goes back to the old value.
* **Drag** it left or right to scrub the value.  A field that changes what the viewport draws shows the change while you drag, and the release is one undo step.  :kbd:`Escape` while you drag puts the value back.
* **Rest** the pointer on it, and an arrow shows at each end.  Click an arrow to step the value down or up.
* A field with a range fills from the left, up to its value.
* A value outside the range is moved to the nearest end.

Rows of a pair, such as :guilabel:`Size X` and :guilabel:`Size Z`, are joined.  A padlock beside the pair locks the proportions: while it is on, a change to one field changes the other by the same factor.  It starts off, and it is not saved.

Lists, Colors, and Checkboxes
-----------------------------

* A **list** opens when you click it.  The values it offers depend on the runtime target.
* A **color** is a swatch beside a hexadecimal value, such as ``#FFFFFF``.  Click the swatch for red, green, and blue sliders, or type the value.  A typed value applies as soon as it is a complete color, and text that is not one stays in the field until you leave it.
* A **checkbox** is a click.

A field that cannot be edited now, such as a position in Pose Mode, is dimmed and does nothing when you click it.

Relations and Lists of Relations
--------------------------------

A field that binds the item to another one, such as :guilabel:`Parent Deformer`, is a search box: click it, type part of a name, and press :kbd:`Enter` to take the match that is highlighted.  The arrow keys move the highlight.  It has a button that clears the relation, and a dropper that picks the item from the viewport or the Outliner.  See :doc:`/editors/properties/object_tab`.

Runtime Target Gating
=====================

The :guilabel:`Runtime` setting of the document says which Cubism runtime the model is for.  The Properties editor does not offer what that runtime cannot play.

* A **row** for a feature that the target lacks is left out.  This covers :guilabel:`Multiply Color`, :guilabel:`Screen Color`, :guilabel:`Invert Mask`, :guilabel:`Bilinear (Quad)`, and the isolated-part controls.
* A **list** offers the values that the target supports, and the value the item has now, so that a value you already use is never missing from its own list.  This covers :guilabel:`Blend`, :guilabel:`Alpha`, and :guilabel:`Group Mode`.

The setting hides controls and takes nothing from the document.  An item that uses a feature the target lacks keeps it, and keeps rendering with it.  Only a MOC3 export leaves it out.  See :doc:`/files/runtime_targets` for the targets and the features, and :doc:`/files/exporting` for the export.

.. seealso::

	* :doc:`/editors/properties/document_tab`
	* :doc:`/editors/properties/object_tab`
	* :doc:`/editors/properties/data_tab`
	* :doc:`/editors/keyform_sheet`
	* :doc:`/files/runtime_targets`
