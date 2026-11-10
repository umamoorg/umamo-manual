******************
Coming from Cubism
******************

Umamo is built to work with Live2D Cubism and it reads and writes the Cubism Editor's own files.  However, it is not built to be exactly like Cubism.  It instead uses the design paradigms and interface style of the popular Blender 3D modelling software.  If you're already familiar with Blender then working Umamo will feel like home.

Terminology Map
===============

.. list-table::
	:header-rows: 1

	* - In Cubism
	  - In Umamo
	  - Notes
	* - ArtMesh (Drawable)
	  - Drawable
	  - A piece of art with a mesh.  The Outliner lists them as :guilabel:`Drawables`.
	* - Part
	  - Part
	  - —
	* - Warp Deformer, Rotation Deformer
	  - Warp Deformer, Rotation Deformer
	  - Rotation deformer is not supported yet.
	* - Parameter
	  - Parameter
	  - —
	* - Combined Parameter
	  - Linked Parameter
	  - Two parameters shown as one two dimensional pad.
	* - Keyform
	  - Keyform, Key
	  - Keys are shown on the Keyform Sheet and inserted(keyed) on the keyform with :guilabel:`Insert Keyframe`.
	* - Blend Shape
	  - Blend Shape
	  - —
	* - Glue
	  - Glue
	  - Glue is not supported yet.
	* - Physics
	  - Physics
	  - Physics are not supported yet.  See :doc:`/rigging/physics`.
	* - Draw Order
	  - Draw Order
	  - The same.
	* - Clipping, mask
	  - Masked By
	  - A drawable lists the drawables that mask it.
	* - Reversed Mask
	  - Invert Mask
	  - —
	* - Multiply Color, Screen Color
	  - Multiply Color, Screen Color
	  - —
	* - Blend, Alpha modes
	  - Blend, Alpha modes
	  - —
	* - Offscreen Drawing
	  - Part Composite, the :guilabel:`Isolated` group mode
	  - This is named as the isolated part composite mode.  Cubism's naming is describing a low level graphics drawing technique that does not describe what is happening to the user.
	* - Guide Image
	  - Guide Image
	  - —
	* - Texture Atlas
	  - Atlas Pages and Tiles
	  - Shown in the UV Editor area.  A page is one unique texture atlas.  A tile is an individual art layer positioned on the page.
	* - Mesh editing
	  - Edit Mode
	  - A mesh is edited in the 2D Viewport while in edit mode.  Press :kbd:`Tab` to enter Edit Mode from Object Mode.
	* - Automatic Mesh Generation
	  - :guilabel:`Generate Mesh from Art`
	  - Accessible from the :guilabel:`Command Palette` and :kbd:`Shift+M`.  See :doc:`/modeling/generate_mesh`.
	* - Updating a model after the artwork changed
	  - Reload, relink, and match
	  - The Sources editor.  Umamo can also watch the artwork files to reload automatically.  See :doc:`/artwork/relinking_and_reloading`.
	* - Select Target Version
	  - Runtime Target
	  - See `Runtime Target`_.
	* - Animation
	  - Not yet
	  - A long term goal.

The terms of the whole manual are in :doc:`/appendices/glossary`.

Keymap Presets
==============

Umamo has three sets of shortcuts to start from.  You choose one in Quick Setup or in the :guilabel:`Keybindings` category of Settings.  See :doc:`/interface/keymap`.

**We highly recommend learning the default keymap as it is used throughout the manual.**  However, the :guilabel:`Cubism` preset is for people who do not want to learn a new set.  There are less keys bound by default.  It keeps:

* :kbd:`Ctrl-N`, :kbd:`Ctrl-O`, :kbd:`Ctrl-S`, and :kbd:`Ctrl-Shift-S` for New, Open, Save, and Save As, and :kbd:`Ctrl-Shift-O` for Import Artwork.
* :kbd:`Ctrl-Z` to undo, and :kbd:`Ctrl-Shift-Z` and :kbd:`Ctrl-Y` to redo.
* :kbd:`Ctrl-P` to open the :guilabel:`Command Palette`.
* :kbd:`Ctrl-0` to fit the view, :kbd:`Ctrl-1` for actual size, and :kbd:`Ctrl-Equals` and :kbd:`Ctrl-Minus` to zoom.  :kbd:`Ctrl-Shift-0` frames the selection.
* :kbd:`Ctrl-Tab` for Pose Mode, :kbd:`F9` for Adjust Last Operation, and :kbd:`Ctrl-Comma` for Settings.
* The keying keys, :kbd:`I`, :kbd:`Alt-I`, and :kbd:`K`, and :kbd:`P` and :kbd:`Alt-P` to pin and unpin art in the UV Editor.

Because the Cubism keymap conflicts with many of the default keymaps there will be some functionality that will be only accessible through the :guilabel:`Toolbar`, :guilabel:`Sidebar`, and :guilabel:`Command Palette`.  See :doc:`/appendices/default_shortcuts` to view all the available keymaps.

File Compatibility
==================

* **CMO3.**  Umamo imports and exports CMO3 files and is tested with Cubism Editor 4.2 to 5.4.  A CMO3 exported from Umamo can be opened in the Cubism Editor.  Umamo has advanced editing features that when exported to CMO3 may not be supported in Cubism.
* **MOC3.**  Umamo imports and exports baked models together with their sidecar files.  Importing MOC3 is functionality intended for rescuing a puppet file when the original CMO3 was lost.
* **Artwork.**  Umamo reads layered artwork from Photoshop, Clip Studio Paint, Krita, and flat image format.

While Umamo is in development preview you should keep your original Cubism files.  Import them into Umamo, work on them, and export the result as separate copies.  Use :menuselection:`File --> Save As…` to save an UMA file as you go.  See :doc:`/files/cubism_interchange` for what is kept when moving between formats.

Umamo is not affiliated with Live2D Inc.  See :doc:`/appendices/legal`.

Keying Differences
==================

In Umamo pose authoring is not automatically keyed and keying a pose onto a parameter requires an explicit action.

* **Pose first, then key.**  In Umamo you set the parameters to the pose that you want to key, shape the lattice of a warp deformer in Pose Mode, and key it with :kbd:`I`, :guilabel:`Insert Keyframe`.  Until the change is committed it is only a preview and will be denoted the on the Keyform Sheet marked with an orange circle.  Moving a parameter before keying an committed pose will discard the pose edit, but can be brought back with :guilabel:`Undo`.
* **Edit Mode is the rest shape.**  Edit Mode changes the shape of meshes and deformers at the default pose.  You cannot insert, remove, or move keys while in :guilabel:`Edit Mode`.
* **Key what is under the pointer.**  :kbd:`I` keys the field or the row that the pointer is over, :kbd:`Alt-I` removes the key, and :kbd:`K` opens a pie menu to key the lattice, the opacity, the colors, or all of them.
* **The Keyform Sheet shows the keys.**  It shows the keys of each object as marks on tracks, similar to an animation dope sheet.  Keys can be selected and moved there.

See :doc:`/rigging/keyforms`, :doc:`/rigging/posing_warps`, and :doc:`/editors/keyform_sheet`.

Runtime Target
==============

The Cubism Editor has a "Select Target Version" setting the limits the availability of features based on the SDK runtime version.  Umamo's :guilabel:`Runtime Target` option has all the Cubism targets plus other runtime targets.  It can be found in the :guilabel:`Properties` editor area, :guilabel:`Puppet` tab, :guilabel:`Runtime` section.

The Runtime Target hides the controls for features that are unsupported by the target version.  If you downgrade the target version those features will not be removed from the puppet file, but a MOC3 export strips unsupported features in the resulting file.  See :doc:`/files/runtime_targets`.

.. seealso::

	* :doc:`/interface/keymap`
	* :doc:`/files/cubism_interchange`
	* :doc:`/files/runtime_targets`
	* :doc:`/rigging/index`
	* :doc:`/appendices/glossary`
