******************
Cubism Interchange
******************

Umamo works with the model formats of Live2D Cubism, so that a model can come into Umamo from the Cubism Editor, be worked on, and go back out again.  Both formats are interchange formats.  Umamo never opens or saves them directly: it imports them into a new document and exports a new file from the open document.  The original file is never modified.

Roles of Each Format
====================

.. list-table::
	:header-rows: 1

	* - Format
	  - What it is
	  - In Umamo
	* - UMA
	  - Umamo's own document.
	  - Open and Save.  See :doc:`/files/uma`.
	* - CMO3
	  - The project file of the Cubism Editor.  It holds the model, the layered artwork it was made from, and the editor's own settings.
	  - Import and Export.
	* - MOC3
	  - The baked model that an application plays.  It holds the rig and the texture atlas pages and nothing else, so it has no layers.
	  - Import and Export, together with its sidecar files.

A CMO3 is the source and a MOC3 is what you ship.  The Cubism Editor produces a MOC3 from a CMO3, and Umamo can produce either one from the open document.

A MOC3 is the center of a group of files.  Besides the ``.moc3`` file there is a ``.model3.json`` manifest that lists the others, a ``.cdi3.json`` file with the display names of the parameters and parts and the way the parameters are grouped, the texture pages as PNG images, and, when the model has them, physics, pose, expression, motion, and user data files.  Umamo reads and writes the group as a whole.

Umamo is not affiliated with Live2D Inc.  The formats were worked out by observation.  See :doc:`/appendices/legal`.

Importing
=========

Importing a model replaces the open document with a new document made from the file.  If the open document has unsaved changes Umamo asks first.  The file is not changed and the new document is not linked to it: the first Save asks where to put a UMA file, and suggests the name of the file you imported.  The file is added to Open Recent.

The status bar shows the progress while a large model is read.  A file that cannot be imported leaves the open document as it was and shows an alert.  See :ref:`uma-open-failures`.

Neither import has a default shortcut.  Both are in the command palette as :guilabel:`Import CMO3…` and :guilabel:`Import MOC3…`.

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: The File menu with the Import submenu open, showing Artwork…, CMO3…, and MOC3….
	:Setup: Launch Umamo.  The rows are always enabled.
	:Crop: The menu bar and the open menus only.
	:Save as: ``images/files/import_menu.png``
	:Caption: The Import submenu of the File menu.

Import CMO3
-----------

.. admonition:: Reference
	:class: refbox

	:Menu: :menuselection:`File --> Import --> CMO3…`

Import CMO3 asks for a ``.cmo3`` file.  A CMO3 holds its own pixels, so it needs no other file.

What comes in:

* The parameters, with their groups, their order in the panel, and their linked pairs.
* The parts, the warp and rotation deformers, and the drawables with their meshes, keyforms, masks, and draw order.
* Blend shapes and glue.
* The canvas and the texture atlas, as the file stored them.
* The layered artwork inside the file, as the source artwork of the document.  Reload and Relink can use it even when the original artwork file is not where Cubism recorded it.  See :doc:`/artwork/relinking_and_reloading`.
* The Runtime Target, taken from the Cubism version that the file was saved for.  See :doc:`/files/runtime_targets`.

Umamo keeps what it cannot edit: physics, guide images, keyform notes, the random pose, model state sets, user data, and the other settings of the Cubism Editor.  Export CMO3 writes them back, for as long as the document stays open.  A UMA file does not carry them.  See :doc:`/files/uma`.

A parameter, parameter group, part, deformer, or drawable that was saved with an empty name shows its ID as its name.

Import MOC3
-----------

.. admonition:: Reference
	:class: refbox

	:Menu: :menuselection:`File --> Import --> MOC3…`

Import MOC3 asks for a ``.moc3`` file.  A MOC3 is only part of a model, so Umamo looks for the rest in the folder that holds the file.

.. list-table::
	:header-rows: 1

	* - File
	  - Needed
	  - Without it
	* - ``name.model3.json``
	  - Yes
	  - The import stops with ``Its model3.json manifest was not found next to the file.``
	* - The texture pages that the manifest lists
	  - Yes
	  - The import stops with ``A texture referenced by its model3.json is missing or unreadable.``
	* - ``name.cdi3.json``
	  - No
	  - The model comes in without display names, parameter groups, or linked parameters.  Everything is named by its ID.
	* - Physics, pose, expression, motion, and user data files
	  - No
	  - Nothing is carried to a later export.

What comes in is the baked model: its parameters, parts, deformers, drawables, meshes, keyforms, blend shapes, glue, and masks, and its texture pages as the atlas.  A MOC3 stores no names for deformers, so each one is named after the drawable that it deforms where that is unambiguous, as in ``Warp40 (ArtMesh5)``.

The physics, pose, expression, motion, and user data files are kept as they were and written out unchanged by Export MOC3.  Umamo does not edit them.  The groups and hit areas of the manifest are kept in the same way.

A MOC3 has no layers, so the document has no source artwork.  Adding artwork to it is refused with the notice ``Artwork can't be added to documents created from imported MOC3 files.``  Export a CMO3 first, import that file, and add the artwork there.

Compatible Cubism Versions
==========================

Umamo reads and writes CMO3 files, and it is tested with the Cubism Editor 4.2 to 5.4.  It reads and writes MOC3 files from version 1 to version 6, the models of Cubism 3.0 to 5.3.  See :doc:`/files/runtime_targets` for the version that each Runtime Target uses.

What an export writes depends on the Runtime Target of the document.  A MOC3 is written in the version of the target, and a CMO3 records the target, so the Cubism Editor opens it with that version selected.

A newer version of Cubism may add something that Umamo does not know.  Open an issue on `GitHub <https://github.com/umamoorg/umamo/issues>`__ that describes the problem and includes a sample file.  See :doc:`/troubleshooting/reporting_bugs`.

Exporting CMO3
==============

Export CMO3 writes a project that the Cubism Editor can open.  How it is built depends on where the document came from:

.. list-table::
	:header-rows: 1

	* - The document came from
	  - The CMO3 is built from
	* - A CMO3
	  - A fresh copy of the original file's contents, with your edits applied on top of it.  Everything that Cubism stored and Umamo does not edit is written back.  A document that you did not edit exports its model unchanged.
	* - Artwork
	  - The model.  The real layers and folders of the artwork are written into the file, and every drawable keeps its layer binding.
	* - A MOC3
	  - The model, with a stand-in source rebuilt from the atlas pages.  Each layer is a slice of a baked page, and not the artwork the model was drawn from.  The file opens and renders in the Cubism Editor, and the export report says so.
	* - A UMA file, or a new document
	  - The model.  Whatever Cubism stored that the UMA file does not carry is absent.

Export CMO3 never writes into the open document or the original file.  Anything that the CMO3 format cannot hold is listed in the export report.  See :doc:`/files/exporting` for the dialog and :doc:`/files/export_notices` for the report.

Exporting MOC3
==============

Export MOC3 bakes the open document into a MOC3 and its sidecar files.  It builds the file from the model whatever the document came from, so the result is a fresh bake and it is not the same bytes as the file you imported.

The version follows the Runtime Target.  A feature that the version cannot hold is removed from the written file, and the export report lists it.  The document keeps the feature.  See :doc:`/files/runtime_targets`.

An options dialog chooses whether hidden objects and guide images are written, which sidecar files are included, and the scale.  See :doc:`/files/exporting`.

What Round-Trips and What Does Not
==================================

Staying inside one format loses the least:

* A CMO3 that is imported and exported in the same session keeps everything it had, the parts that Umamo does not edit included.
* A MOC3 that is imported and exported keeps its rig, its texture pages, and its physics, pose, expression, motion, and user data files.  The moc itself is baked afresh.

Changing format or session loses what the other side has no place for:

* **UMA.**  A UMA file does not carry the data that only Cubism knows, so a CMO3 exported after a reopen lacks it.  See :doc:`/files/uma`.
* **MOC3 to CMO3.**  The CMO3 has no original layers, only slices of the atlas pages.  Names come from the ``.cdi3.json`` file.
* **CMO3 to MOC3.**  A MOC3 has no layers, and no editor settings.  Hidden objects and guide images are left out unless you turn them on.  A feature newer than the Runtime Target is removed.  A MOC3 stores one keyform grid for each object, so a channel keyed over a narrower span is written as a constant.  An id longer than 64 bytes is shortened, and a mesh with more than 65,536 vertices is left out.
* **Anything to CMO3.**  Some edits cannot be stored in a CMO3, such as a fractional draw order or a fractional canvas size.

Each of these is listed in the export report when it happens.  Read it before you rely on the file.

.. seealso::

	* :doc:`/files/exporting`
	* :doc:`/files/export_notices`
	* :doc:`/files/runtime_targets`
	* :doc:`/command_line/convert`
	* :doc:`/getting_started/coming_from_cubism`
	* :doc:`/appendices/legal`
