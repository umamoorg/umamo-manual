***********************************
Runtime Targets and Cubism Versions
***********************************

Every Cubism runtime can play a different set of features.  A model that uses a feature that an older runtime lacks plays wrongly there, or not at all.  The Runtime Target of a document says which runtime you mean the model to play on.  Umamo then hides the controls for the features that runtime cannot play, and when you export a MOC3 it writes the version of that runtime.

What a Runtime Target Is
========================

The Runtime Target is a setting of the document, and it is saved with it.  It is the same idea as the "Model target version selection" of the Cubism Editor.

A target limits what you can *author*.  It does not take anything away:

* It hides or limits controls only.  A model that already uses a feature the target lacks keeps that feature, and it keeps rendering in Umamo.
* A UMA file and a CMO3 file always carry every feature.
* Only a MOC3 export leaves features out, and it does so in the copy that it writes.  The document keeps them, so exporting again with a higher target brings them back.

Choosing a Target
=================

The :guilabel:`Target` list is in the :guilabel:`Runtime` section of the Document tab of the Properties editor.  See :doc:`/editors/properties/document_tab`.  Changing it is an undoable step that the History editor labels ``Set Runtime Target``.

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: The Runtime section of the Document tab, with the Target list open and the target Cubism 4.0 chosen behind it, and the Restricted features list below it.  At least one entry must show ``CURRENTLY IN USE``.
	:Setup: Use a model that has a blend shape or a multiply color on a drawable, choose Cubism 4.0, and open the Properties editor on its Document tab.
	:Crop: The Properties editor only.
	:Save as: ``images/files/runtime_target.png``
	:Caption: The Runtime section of the Document tab.

The starting target depends on where the document came from:

* A CMO3 starts with the target the file was saved for, or with :guilabel:`No Target (All Features)` when it was saved for the latest Cubism.
* A MOC3 starts with the target that matches its version.
* A UMA file starts with the target that it was saved with.
* A new document, and a document made from artwork, start with :guilabel:`No Target (All Features)`.

Below the list, Umamo names the features that the chosen target restricts, or says ``All features are available.``  A restricted feature that your document already uses is marked ``CURRENTLY IN USE``, so that you can see what a MOC3 export would remove.

Target List
===========

.. list-table::
	:header-rows: 1

	* - Target
	  - MOC3 version written
	  - Written by the Cubism Editor
	  - Notes
	* - No Target (All Features)
	  - 6
	  - 5.3
	  - Nothing is restricted.  A CMO3 records it as ``Latest Cubism``, with no version.
	* - Ayagami (Cubism 5.0 Equivalent)
	  - 5
	  - 5.0
	  - Ayagami is a runtime made by someone else, and it is not part of Umamo.  It plays what Cubism 5.0 plays.  A CMO3 records it as Cubism 5.0, so a CMO3 that is reopened shows Cubism 5.0.  A UMA file keeps it.
	* - Cubism 3.0
	  - 1
	  - 3.0 to 3.2
	  - —
	* - Cubism 3.3
	  - 2
	  - 3.3
	  - —
	* - Cubism 4.0
	  - 3
	  - 4.0
	  - —
	* - Cubism 4.2
	  - 4
	  - 4.2
	  - —
	* - Cubism 5.0
	  - 5
	  - 5.0
	  - —
	* - Cubism 5.3
	  - 6
	  - 5.3
	  - The newest runtime that Umamo models.

Gated Features
==============

Each feature is available from the target that is listed.  The names are the ones that the Properties editor shows.

.. list-table::
	:header-rows: 1

	* - Feature
	  - Available from
	  - What it covers
	* - New Warp Deformer Method
	  - Cubism 3.3
	  - The bilinear way of interpolating a warp deformer.
	* - Reversed Mask
	  - Cubism 4.0
	  - Inverting a mask.
	* - Blend Shapes (Drawable and Warp Deformer)
	  - Cubism 4.2
	  - Blend shapes on a drawable or a warp deformer.
	* - Blend Shape Parameters
	  - Cubism 4.2
	  - The parameters that drive blend shapes.
	* - Multiply Color
	  - Cubism 4.2
	  - The multiply color of drawables, deformers, and part composites.
	* - Screen Color
	  - Cubism 4.2
	  - The screen color of the same.
	* - Blend Shapes (Part, Rotation Deformer, Glue)
	  - Cubism 5.0
	  - Blend shapes beyond drawables and warp deformers.
	* - Motion-sync
	  - Cubism 5.0
	  - The motion-sync files.  Umamo does not model them, so this entry only informs.
	* - Blend Mode
	  - Cubism 5.3
	  - The blend modes added in 5.3, and the alpha blend modes.
	* - Part Composite (Offscreen Drawing)
	  - Cubism 5.3
	  - Isolated parts, which draw into an offscreen.
	* - Parameter Repeat
	  - Cubism 5.3
	  - Parameters that repeat.
	* - Art Path
	  - No target
	  - Vector lines of the Cubism Editor.  Umamo carries them in a CMO3 but does not model them, so this entry only informs.

What Gating Does and Does Not Do
================================

What a restricted target does in the editor:

* A control for a whole feature is hidden.  The Multiply Color and Screen Color rows, the invert-mask row, the bilinear option of a warp deformer, and the composite rows of an isolated part are not shown.  :guilabel:`Add Blend Shape Parameter` is missing from the Parameters editor's menus.
* A list of choices is cut down to what the target supports.  The blend modes and alpha blend modes drop to the older ones, and :guilabel:`Isolated` is no longer offered as a group mode.
* A new warp deformer is created with the older method.
* The value that a control holds right now always stays visible and selectable, even if the target lacks it.  A model never loses its own setting from view, and the only way forward from it is to something the target supports.

What it does not do:

* It never stops a model from rendering.  A document that goes beyond the target keeps rendering all of it.
* It never removes anything from the document, and it never stops a save to UMA or an export to CMO3.

A MOC3 export is where a target removes things.  It writes the version of the target, strips from its copy every feature that version cannot hold, and then lists them in the export report: ``Multiply Color is not available for the target runtime version, so it was removed from:`` and the names of up to eight objects, followed by the number of the rest.  See :doc:`/files/export_notices`.

.. note::

	The export decides what the version can hold from the file format itself, and the Document tab follows the Cubism Editor's own list.  The two differ in a few places.  Reversed masks and repeating parameters are marked as restricted below Cubism 4.0 and 5.3, but the MOC3 versions below those can hold them, so the export keeps them.  The Document tab can therefore warn about more than an export removes.  The export report is the final word.

.. seealso::

	* :doc:`/editors/properties/document_tab`
	* :doc:`/files/cubism_interchange`
	* :doc:`/files/exporting`
	* :doc:`/modeling/blending_and_masking`
	* :doc:`/rigging/blend_shapes`
