******************
Coming from Cubism
******************

Umamo is built to work with Live2D Cubism.  It reads and writes the Cubism Editor's own files, and a rig means the same thing in both.  The interface is different, because it is modelled on Blender's, and a few ideas have different names.  This page is the map from what you know to where it is here.

Terminology Map
===============

.. list-table::
	:header-rows: 1

	* - In Cubism
	  - In Umamo
	  - Notes
	* - ArtMesh
	  - Drawable
	  - A piece of art with a mesh.  The Outliner lists them as :guilabel:`Drawables`.
	* - Part
	  - Part
	  - The same.  Its :guilabel:`Group Mode` is :guilabel:`Pass Through`, :guilabel:`Grouped`, or :guilabel:`Isolated`.
	* - Warp Deformer, Rotation Deformer
	  - Warp deformer, rotation deformer
	  - The same.  The lattice of a warp deformer can be edited.  A rotation deformer cannot be edited yet.
	* - Parameter
	  - Parameter
	  - In the Parameters editor, with groups.
	* - Combined parameters
	  - Linked parameters
	  - Two parameters shown as one two-dimensional pad.
	* - Keyform
	  - Keyform, key
	  - Keys are shown on the Keyform Sheet, and added with :guilabel:`Insert Keyframe`.
	* - Blend Shape
	  - Blend Shape
	  - The same, from Cubism 4.2.  A blend shape is driven by a blend shape parameter.
	* - Glue
	  - Glue
	  - Imported, shown, and exported.  It cannot be edited yet.
	* - Physics
	  - Not yet
	  - Kept and written back unchanged.  See :doc:`/rigging/physics`.
	* - Draw Order
	  - :guilabel:`Draw Order`
	  - The same.
	* - Clipping, mask
	  - :guilabel:`Masked By`
	  - A drawable lists the drawables that mask it.
	* - Reversed Mask
	  - :guilabel:`Invert Mask`
	  - Available from Cubism 4.0.
	* - Multiply Color, Screen Color
	  - :guilabel:`Multiply Color`, :guilabel:`Screen Color`
	  - The same, from Cubism 4.2.
	* - Blend mode
	  - :guilabel:`Blend Mode` and alpha mode
	  - The blend modes and alpha blend modes of Cubism 5.3.
	* - Offscreen drawing
	  - Part composite, the :guilabel:`Isolated` group mode
	  - Cubism 5.3.
	* - Guide image
	  - :guilabel:`Guide Image`
	  - A setting of a part.  A MOC3 export leaves such parts out unless you ask for them.
	* - Texture atlas
	  - Atlas pages and tiles
	  - Shown in the UV Editor.  :guilabel:`Repack Atlas` packs it again.
	* - Mesh editing
	  - Edit Mode
	  - A mesh is edited in the 2D Viewport.
	* - Automatic mesh generation
	  - :guilabel:`Generate Mesh from Art`
	  - Also done for you when you add artwork.  See :doc:`/modeling/generate_mesh`.
	* - Updating a model after the artwork changed
	  - Reload, relink, and match
	  - The Sources editor.  Umamo can also watch the artwork files.  See :doc:`/artwork/relinking_and_reloading`.
	* - Model target version selection
	  - Runtime Target
	  - See `Runtime Target`_.
	* - Animation
	  - Not yet
	  - A long term goal.

The terms of the whole manual are in :doc:`/appendices/glossary`.

Keymap Presets
==============

Umamo has three sets of shortcuts to start from, and you choose one in Quick Setup, or in the :guilabel:`Keybindings` category of Settings.  See :doc:`/interface/keymap`.

The :guilabel:`Cubism` preset is for people who do not want to learn a new set.  It is much smaller than the default.  It keeps:

* :kbd:`Ctrl-N`, :kbd:`Ctrl-O`, :kbd:`Ctrl-S`, and :kbd:`Ctrl-Shift-S` for New, Open, Save, and Save As, and :kbd:`Ctrl-Shift-O` for Import Artwork.
* :kbd:`Ctrl-Z` to undo, and :kbd:`Ctrl-Shift-Z` and :kbd:`Ctrl-Y` to redo.
* :kbd:`Ctrl-P` for the command palette.  :kbd:`Space` is left alone, because Cubism uses it for panning the canvas.
* :kbd:`Ctrl-0` to fit the view, :kbd:`Ctrl-1` for actual size, and :kbd:`Ctrl-Equals` and :kbd:`Ctrl-Minus` to zoom.  :kbd:`Ctrl-Shift-0` frames the selection.
* :kbd:`Ctrl-Tab` for Pose Mode, :kbd:`F9` for Adjust Last Operation, and :kbd:`Ctrl-Comma` for Settings.
* The keying keys, :kbd:`I`, :kbd:`Alt-I`, and :kbd:`K`, and :kbd:`P` and :kbd:`Alt-P` to pin and unpin art in the UV Editor.

It leaves the rest unassigned: Tab for Edit Mode, and the single keys for grab, rotate, scale, select all, hide, and so on.  Every command is still in the command palette, and most are in the menus, the right-click menu of the viewport, and the toolbar.  You can give any of them a key of your own.

The shortcuts in this manual are those of the default preset.  See :doc:`/appendices/default_shortcuts` for all three.  On macOS, :kbd:`Ctrl` stands for :kbd:`Cmd`, except where a shortcut uses the Control key itself.

File Compatibility
==================

* **CMO3.**  Umamo imports and exports CMO3 files, and it is tested with the Cubism Editor 4.2 to 5.4.  A CMO3 that Umamo exports is made to open in the Cubism Editor.
* **MOC3.**  Umamo imports and exports baked models together with the files beside them.  A MOC3 holds no layers, so a model that comes from one has no artwork to edit.
* **Artwork.**  Umamo reads layered files from Photoshop, Clip Studio Paint, and Krita, as well as flat images, and keeps the model in step when the artwork changes.
* **What Umamo keeps without editing it.**  A CMO3 holds things that Umamo does not edit yet, such as physics and the settings of the Cubism Editor.  Umamo keeps them while the document is open, and writes them back when you export a CMO3 in the same session.  A UMA file does not hold them.

Keep your Cubism files.  Import them into Umamo, work, and export the result, and use :menuselection:`File --> Save As…` to keep a UMA file as you go.  See :doc:`/files/cubism_interchange` for what survives the trip.

Umamo is not made by or connected to Live2D Inc.  See :doc:`/appendices/legal`.

Keying Differences
==================

Cubism and Umamo both store a shape for each key of a parameter, and blend the shapes between them.  How you arrive at a key is different.

* **Pose first, then key.**  In Umamo you set the parameters to the pose that you want to key, shape the lattice of a warp deformer in Pose Mode, and key it with :kbd:`I`, :guilabel:`Insert Keyframe`.  Until then the change is only a preview, and the Keyform Sheet marks it with a circle.  Moving a parameter drops lattice edits that are not keyed yet, with a notice, and Undo brings them back.  Pose Mode shapes warp deformer lattices at present.
* **Edit Mode is the rest shape.**  Edit Mode changes the shape at the default pose.  You cannot insert, remove, or move keys in it.
* **Key what is under the pointer.**  :kbd:`I` keys the field or the row that the pointer is over, :kbd:`Alt-I` removes the key, and :kbd:`K` opens a pie to key the lattice, the opacity, the colors, or all of them.
* **The Keyform Sheet shows the keys.**  It lays out the keys of each object as marks on tracks, much as Blender's dope sheet does.  Select them and move them there.

See :doc:`/rigging/keyforms`, :doc:`/rigging/posing_warps`, and :doc:`/editors/keyform_sheet`.

Runtime Target
==============

The Cubism Editor asks for a model target version, and hides what the older runtimes cannot play.  Umamo's Runtime Target does the same.  It is a setting of the document, in the :guilabel:`Runtime` section of the Document tab of the Properties editor.  A CMO3 or MOC3 that you import brings its own target, and a new document has :guilabel:`No Target (All Features)`.

The target hides the controls of the features that it lacks, and it decides which version of MOC3 an export writes.  It never removes anything from the document.  See :doc:`/files/runtime_targets`.

.. seealso::

	* :doc:`/interface/keymap`
	* :doc:`/files/cubism_interchange`
	* :doc:`/files/runtime_targets`
	* :doc:`/rigging/index`
	* :doc:`/appendices/glossary`
