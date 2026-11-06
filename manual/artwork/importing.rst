*****************
Importing Artwork
*****************

Importing artwork is how a rig starts.  You give Umamo a layered file or a flat image, and it makes a drawable with a first mesh for each layer, a part for each folder, and a texture atlas that holds all the art.  You can then rig the model, and change the artwork in your art program later: Umamo keeps the two in step.

Artwork is always **added to the open document**.  It does not replace the document and it does not ask about unsaved changes, in the way that importing an object into a Blender scene adds to the scene.  A new document is empty, so adding artwork to it is how you begin a rig from art.  See :doc:`/files/uma` for the new document.

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: The 2D Viewport just after a layered file was added to a new document: the model drawn from its layers, the Outliner beside it with the parts and drawables, and the operation strip in the corner of the viewport, open, with the title Import Artwork and its rows.
	:Setup: Start a new document, add a layered file of a character with a few folders, and press F9 to open the strip.
	:Crop: The whole window.
	:Save as: ``images/artwork/import_result.png``
	:Caption: A layered file added to a new document.

Ways to Import
==============

Import Artwork…
---------------

.. admonition:: Reference
	:class: refbox

	:Menu: :menuselection:`File --> Import --> Artwork…`
	:Shortcut: :kbd:`Ctrl-Shift-O`

Opens a file picker that offers the artwork formats: ``.psd``, ``.clip``, ``.kra``, ``.png``, ``.bmp``, ``.jpg``, ``.jpeg``, ``.webp``, ``.tif``, and ``.tiff``.  Pick one file, and its layers are added.  See :doc:`/artwork/supported_formats`.

The command is the same wherever it is started from, so it is under the same rules and shows the same operation strip.

From the Sources Editor
-----------------------

The first button in the header of the Sources editor runs the same command.  It is the place to add a second file next to the first, with the list of files in front of you.  See :doc:`/editors/sources`.

Drag and Drop
-------------

Drag one or more artwork files onto the window.  The first file in the drop decides what the drop means: if it is artwork, every artwork file in the drop is added, one after the other, and each is finished before the next begins.  Any other kind of file is opened instead.  See :doc:`/files/uma`.

From the Command Palette
------------------------

Open the command palette and type ``import``.  :guilabel:`Import Artwork…` runs the same command as the menu.  See :doc:`/interface/command_palette`.

What Import Creates
===================

For each file, Umamo adds:

* A **drawable** for each raster layer that has any art in it, named for the layer.  Its opacity, its eye, and its blend mode come from the layer.  A layer with no name takes the id of the drawable as its name.  Drawables get the ids ``ArtMesh1``, ``ArtMesh2``, and so on.
* A **part** for each folder, nested as the folders are, named for the folder.  A hidden folder is a hidden part.  Parts get the ids ``Part1``, ``Part2``, and so on.  The order of the layers and folders in the file is the order of the drawables and parts in the Outliner.
* A **first mesh** for each drawable.  See `Initial Mesh and Parameter Template`_.
* An **atlas tile** for each layer: the layer's pixels, bound to the layer by its key, so that the layer can be found again.  The tiles are packed onto atlas pages.  See `Packing on Import`_ and :doc:`/artwork/atlas_packing`.
* A **source**, which is the record of the file: its name, its path, its format, a hash of its contents, the time it was last changed, and the list of its layers.  It is what Reload and Relink work from, and it is listed in the Sources editor.

A layer that clips to the layer below it becomes a drawable that is **masked by** that layer, which is the layer below it in the same folder that does not clip itself.  A clipping layer with nothing to clip to is imported unclipped, and a note says so.  See :doc:`/modeling/blending_and_masking`.

A folder whose blend mode is not Normal, or whose opacity is below 100%, becomes a part that is drawn as one layer.  Its blend mode and opacity are the folder's.  Any other folder is a part that draws its contents as if the folder were not there.  See :doc:`/editors/properties/data_tab`.

Layers that have no pixels to draw are skipped, and the notes name them.  See `Import Notes`_.

First Artwork versus Added Artwork
==================================

The first artwork of a document does more than a later file does.

The **first artwork** of a document, which is the first one that adds any drawables:

* Sets the **canvas** to the size of the file, and puts the **world origin** at the center of the canvas.  See :doc:`/editors/properties/document_tab`.
* Adds the **starter parameters**, if the document has none.  See `Initial Mesh and Parameter Template`_.
* Turns on **Show source artwork**, so that the viewport draws each drawable from its own layer, as you drew it, and not from the atlas.  See :doc:`/editors/properties/document_tab`.

A **later file** is placed on the canvas that is already there.  The canvas does not change, and the document keeps its parameters.  The file is lined up on the canvas by an anchor, and you can move it from there:

:guilabel:`Align`
	Which part of the file's canvas is lined up with the same part of the document's canvas: :guilabel:`Top Left`, :guilabel:`Top`, :guilabel:`Top Right`, :guilabel:`Left`, :guilabel:`Center`, :guilabel:`Right`, :guilabel:`Bottom Left`, :guilabel:`Bottom`, or :guilabel:`Bottom Right`.  The anchor starts as :guilabel:`Center`, and it is set in :guilabel:`Align Added Artwork` in the Settings.

:guilabel:`Offset X` and :guilabel:`Offset Z`
	Move the art right and up from where :guilabel:`Align` puts it, in pixels.  A negative number moves it left or down.

The place is saved with the file's record, so a Reload puts the layers back in the same place.

Adding artwork is refused for a document whose drawables do not all come from artwork.  That is the case for a document that was imported from a MOC3, because its drawables draw from baked pages, and adding artwork would replace them.  A notice says ``Artwork can't be added to documents created from imported MOC3 files.  Export it as CMO3 first and then import the artwork into that file.``  See :doc:`/files/cubism_interchange`.

Adjusting After Import
======================

When the import has finished, the operation strip, with the title :guilabel:`Import Artwork`, offers its settings so that you can change them without importing again.  It is closed at first and shows only its title.  Click the title or press :kbd:`F9` to open it.  See :doc:`/interface/operation_strip`.

.. list-table::
	:header-rows: 1

	* - Row
	  - What it sets
	* - :guilabel:`Align`
	  - Where the added file's canvas sits on the document's canvas.  Only there when the file joined a document that already had artwork.
	* - :guilabel:`Offset X`, :guilabel:`Offset Z`
	  - Moves the art from where :guilabel:`Align` puts it, in pixels, up to 8192 either way.  Only there when the file joined a document that already had artwork.
	* - :guilabel:`Alpha Threshold`
	  - How opaque a pixel must be, from 1 to 255, to count as art when the first mesh of a layer is made.  It starts at 1, so any pixel that is not fully transparent counts.
	* - :guilabel:`Birth Mesh Margin`
	  - How far the first quad of a layer reaches past its art, from 0 to 64 pixels.  It starts at 2.  A mesh made from art keeps the margins of its preset.

A change imports the same file again from the strip, from the state of the document before the import, and replaces the first result.  It is all one undo step, ``Import Artwork``.  The strip goes away when you make another change to the document, for example when you select something, and the result then stays as it is.  Change the settings first, and then go on.

Initial Mesh and Parameter Template
===================================

Two settings in the :guilabel:`Import` category of the Settings say what a new drawable and a new document start with.  See :doc:`/interface/settings`.

:guilabel:`Initial Mesh`
	:guilabel:`Generated from Art` is the default.  Each drawable starts with a mesh that follows its art, made with the preset in :guilabel:`Mesh Generation Preset`, which is :guilabel:`Standard`, :guilabel:`Fine`, or :guilabel:`Coarse`.  :guilabel:`Quad` gives each drawable one rectangle around its art instead.  A layer that cannot be meshed from its art, because nothing in it is opaque enough, because it would need too many vertices, or because the mesher refused it, starts as a quad, and a note gives the reason.  See :doc:`/modeling/generate_mesh`.

:guilabel:`Parameter Template`
	:guilabel:`Humanoid` is the default.  It gives a document with no parameters the 39 standard Live2D parameters, with the ids, ranges, and defaults that Live2D-compatible runtimes and face trackers look for, such as ``ParamAngleX`` and ``ParamEyeLOpen``.  Their names are yours to change.  :guilabel:`None` leaves the document without parameters.  A document that already has parameters keeps them whatever the template says.  See :doc:`/rigging/parameters`.

Packing on Import
=================

The new art is packed onto atlas pages as part of the import, and the status bar shows ``Packing the atlas…`` while it works.  The pages of a document that already has art stay as they are: the new tiles are packed into the gaps around the art that is on the pages, and nothing that is there already is moved.

The pack uses the page size of the document, which is 4096 pixels for a new one.  If a layer is too big for it, the pack tries again with pages of 8192 pixels, which is the largest the import uses.  A layer that does not fit even then, or that cannot be packed for another reason, stays unpacked and is drawn from its own layer.  A note names it.

If the pack cannot keep the art that is on the pages already where it is, nothing is added, and a report names the tiles.  See :doc:`/artwork/atlas_packing`.

Import Notes
============

Nothing that an import cannot carry across is dropped without a word.  When there is anything to say, the status bar says ``Artwork imported with notes.  See the log.``, and the log has a line for each one, each beginning with ``add artwork:``.  When there is nothing to say, it says ``Artwork added.``  See :doc:`/editors/logs`.

.. list-table::
	:header-rows: 1

	* - Log line
	  - What happened
	* - ``layer 'Name' is a text layer with no pixels; skipped``
	  - A text, vector, fill, or adjustment layer.  It has no drawable.
	* - ``layer 'Name' has no opaque pixels; skipped``
	  - The layer is empty, or all of it is below the alpha threshold.  It has no drawable.
	* - ``layer 'Name' blends with Difference, which has no equivalent; imported as Normal``
	  - The mode is not in Umamo's list.  See :doc:`/artwork/supported_formats`.
	* - ``layer 'Name' blends with GlowDodge; imported as the nearest mode, ColorDodge``
	  - The mode is carried to the nearest one, which is not the same formula.
	* - ``layer 'Name' clips to the layer below but has none in its folder; imported unclipped``
	  - A clipping layer with nothing below it to clip to.
	* - ``layer 'Name' writes only some color channels; imported writing all of them``
	  - A Krita layer with a channel switched off.
	* - ``folder 'Path' blends with Difference, which has no equivalent; its part composites as Normal``
	  - The same for a folder.
	* - ``folder 'Path' clips to the layer below; its part imports unclipped``
	  - A folder that is itself a clipping layer.
	* - ``layer 'Name' is larger than the largest atlas page; left unpacked``
	  - The art does not fit a page of 8192 pixels.
	* - ``layer 'Name' could not be packed (reason); left unpacked``
	  - The packer could not place it for another reason.
	* - ``layer 'Name' could not be meshed automatically (reason); born as a quad``
	  - The mesher refused the art.  The drawable has a quad.

Some other results are shown to you at once, because nothing was added:

* ``The file has no layers with pixels to add.``
* ``The document changed while the artwork was being added; nothing was applied.``  An edit landed while the file was being read.  Add the file again.
* ``Artwork can't be added to documents created from imported MOC3 files.``  See `First Artwork versus Added Artwork`_.
* ``name is not a file format Umamo recognizes.``  The file is not artwork, or it could not be read.  The reasons are not told apart, so the log has the detail.  See :doc:`/troubleshooting/common_messages`.

Import Settings
===============

All of these are in the :guilabel:`Import` category of :menuselection:`Edit --> Settings…`.  They apply to the next artwork you add.

.. list-table::
	:header-rows: 1

	* - Setting
	  - What it does here
	* - :guilabel:`Parameter Template`
	  - The starter parameters of a document that has none.
	* - :guilabel:`Initial Mesh`
	  - Whether a new drawable starts with a mesh made from its art, or a quad.
	* - :guilabel:`Mesh Generation Preset`
	  - The preset of the meshes made from art.
	* - :guilabel:`Align Added Artwork`
	  - The starting value of :guilabel:`Align`.

The other settings of the category are about artwork that is already in the document: :guilabel:`Watch Artwork Files`, the ignoring of deleted art, and the layer positions in the Sources editor.  See :doc:`/artwork/source_watcher` and :doc:`/editors/sources`.

.. seealso::

	* :doc:`/artwork/supported_formats`
	* :doc:`/editors/sources`
	* :doc:`/modeling/generate_mesh`
	* :doc:`/artwork/atlas_packing`
	* :doc:`/interface/settings`
