*************
Atlas Packing
*************

A model is drawn from textures, and a texture is a picture file that holds many pieces of art side by side.  Umamo calls this the **atlas**.  Packing is the work of laying the pieces out on the pages of the atlas, close together and without touching.  Umamo does it for you when you add artwork, and you can do it again, with other settings, whenever you like.

The atlas matters at the end: a Cubism runtime draws the model from the pages, and the pages are what a MOC3 export writes.  While you rig, it matters because a page that is wasteful, or whose pieces touch, shows up as a model that is slow, big, or fringed at the edges.

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: An atlas page in the UV Editor, with the pieces of art packed on it and a visible gutter between them, and the Repack Atlas strip open beside it with its nine rows.
	:Setup: Add a layered file with many layers, run Repack Atlas from the command palette, and open the strip with F9.
	:Crop: The UV Editor area.
	:Save as: ``images/artwork/atlas_repack.png``
	:Caption: Repacking the atlas.

Atlas Pages and Tiles
=====================

A **tile** is one piece of art: one layer of an artwork file.  A tile is cut down to the part of the layer that has any art in it, which is the *trim*, and the drawables that use the layer sample that part.

A **page** is a picture, square by default, that holds tiles.  A model can have several pages.  Each tile has a **placement** on a page: where it sits, whether it is turned a quarter turn, and its scale.  The placement is part of the document.  It is saved, it can be undone, and it is written to the files you export.

Around each tile is a **gutter**, an empty margin that keeps neighboring art from bleeding into each other when the texture is filtered.  The edge pixels of the tile are copied outward into the first part of the gutter, which is the **extrusion**, and that hides seams at the edge.  A tile also keeps clear the room that its meshes reach, so a mesh that extends past its art does not sample the art of the tile next to it.

The pages are built from the pieces of art.  The art of every tile is stored in the document, so the pages can be made again at any time.  The UV Editor shows the pages, and the texture selector chooses which one.  See :doc:`/editors/uv_editor/index` and :doc:`/editors/uv_editor/texture_selector`.

Automatic Packing
=================

Umamo packs without being asked at two moments:

* When you **add artwork**, the new tiles are packed onto the pages.  The art that is on the pages already stays where it is, and the new tiles go into the gaps around it.  A new document starts with no pages, so its first artwork makes them.  The pack uses the same defaults as the settings below, and the page size of the document.
* When a **reload**, a **relink**, or a **match** brings in new art, the changed tiles are packed in the same way, around the tiles that did not change.

Nothing is rearranged by this.  If you want everything laid out afresh, run :guilabel:`Repack Atlas`.  See :doc:`/artwork/importing` and :doc:`/artwork/relinking_and_reloading`.

Repack Atlas
============

:guilabel:`Repack Atlas` lays out every tile of the document again, from scratch, on new pages, and moves the model's texture coordinates to follow.  It is one undo step.  The model looks the same after it, because every vertex goes on sampling the same pixel of the same art.  What changes is where on the pages the pieces sit and how many pages there are.

Use it when pieces have been added one at a time and left gaps, when you changed the gutter or the page size, when you moved art by hand and made a mess, or before you export.

Running It
----------

.. admonition:: Reference
	:class: refbox

	:Menu: Command palette

Open the command palette and choose :guilabel:`Repack Atlas`.  It is not in a menu and it has no shortcut.  The status bar shows ``Packing the atlas…`` while it works, and ``Atlas repacked.`` when it is done.

The command is available when the document has art tiles, and its texture coordinates address the pages.  A model that came from a MOC3 has no tiles, so it has nothing to repack.  A document whose texture coordinates address the artwork itself and not the pages cannot be repacked either.  See :doc:`/files/cubism_interchange`.

A repack takes every tile that a drawable uses, and the tiles that are on the pages already.  A tile that is on a page and that no drawable uses is packed with the rest, and if it cannot be packed it leaves the pages and the log says so, without refusing the repack.  Art that was never placed and that nothing uses is not put on a page.

If you change the model while the pack is being worked out, the repack is cancelled with ``Repack canceled: the atlas changed while packing.`` and nothing is applied.  Run it again.

Adjusting After the Run
-----------------------

When the repack is done, the operation strip, titled :guilabel:`Repack Atlas`, has the settings that the pack used.  It is closed at first and shows only its title.  Click the title or press :kbd:`F9` to open it.  Change a row and the pack is run again at once over the same step, so you can try page sizes and spacings and watch the result in the UV Editor.  It is still one undo step.  The strip goes away when you make another change to the model.  See :doc:`/interface/operation_strip`.

Pack Options
------------

.. list-table::
	:header-rows: 1

	* - Row
	  - First value
	  - What it sets
	* - :guilabel:`Max Page Size`
	  - The largest page of the document, or 4096 if it has none
	  - The largest side a page may have, in pixels, chosen from 1024, 2048, 4096, 8192, and 16384, and the document's own size.  With :guilabel:`Shrink Pages` on, a page is this big only if the art needs it.
	* - :guilabel:`Gutter`
	  - 2
	  - The empty space around each piece of art and along the page edge, from 0 to 64 pixels.
	* - :guilabel:`Extrude`
	  - 2
	  - How many pixels of each piece's edge color are copied outward into the gutter.  It is never more than the gutter, so a narrower gutter pulls it in.
	* - :guilabel:`Allow Rotation`
	  - Off
	  - Lets the pack turn art a quarter turn to fit more onto a page.
	* - :guilabel:`Keep Pinned Tiles`
	  - On
	  - Leaves pinned art where it is and packs the rest around it.  See `Pinned Tiles`_.
	* - :guilabel:`Power-of-Two Pages`
	  - On
	  - Rounds the width and height of each page up to a power of two, such as 1024 or 2048.
	* - :guilabel:`Square Pages`
	  - On
	  - Makes every page square.
	* - :guilabel:`Shrink Pages`
	  - On
	  - Sizes each page to the art it holds, instead of always using the maximum.
	* - :guilabel:`Alpha Threshold`
	  - 1
	  - How opaque a pixel must be, from 1 to 255, to count as art when the empty border around each piece is trimmed away.  At 1, any pixel that is not fully transparent counts.

Square pages, power-of-two sizes, and shrinking are on at first.

Pinned Tiles
------------

A pinned tile is art that you placed by hand and want to keep there.  With :guilabel:`Keep Pinned Tiles` on, a repack leaves each pinned tile on its page at its place and packs the other tiles in the room that is left.  With it off, pinned art is packed like all the other art.  Either way the pin itself stays, so you can turn the row back on and run the pack again.

A pinned tile whose place does not fit inside the maximum page size cannot be kept, and the repack is refused for it.  See `When a Repack Is Refused`_.  Pins are set in the UV Editor with :kbd:`P` and :kbd:`Alt-P`.  See :doc:`/editors/uv_editor/placement`.

Manual Placement
================

Packing is automatic, and placement is by hand: in the UV Editor in Object Mode you can move, turn, and scale a piece of art on its page, and pin it.  Use placement for a few pieces that need a particular place, and packing for the rest.  A piece that you moved on top of another, or off the page, is flagged, and a repack puts it right.  See :doc:`/editors/uv_editor/placement`.

A repack does not undo a placement that you pinned, if :guilabel:`Keep Pinned Tiles` is on.  It lays out all the others again, and your hand placements of unpinned art are lost.  Pin what you want to keep.

When a Repack Is Refused
========================

A repack is **all or nothing**.  If it cannot place a tile that a drawable uses, it applies nothing, because the drawables over that tile would be left without a page.  A report names the tiles that could not be packed and the reason for each, and the model is unchanged.  The report is a window you have to dismiss, and it is also in the log.

.. list-table::
	:header-rows: 1

	* - Reason in the report
	  - What to do
	* - ``Drawable mesh is larger than the atlas page size.``
	  - The tile and its gutter do not fit on a page even alone.  Raise :guilabel:`Max Page Size`, lower the gutter, or make the layer smaller.
	* - ``Source artwork layer has no opaque pixels.``
	  - Nothing in the layer reaches the alpha threshold.  Lower :guilabel:`Alpha Threshold`, or delete the drawable.
	* - ``Source artwork layer is below the minimum opaque coverage.``
	  - The layer has fewer opaque pixels than the pack needs.
	* - ``Source artwork layer could not be decoded.``
	  - Its pixels cannot be read, or they are not the size the tile says.  Reload or relink the layer.
	* - ``Drawable's current placement could not be inverted.``
	  - The placement of the tile cannot be worked backwards, for example because it was scaled to nothing, or because the page it names is not there, so the texture coordinates cannot follow it.  Fix the placement in the UV Editor.
	* - ``Pinned placement does not fit inside the maximum page size.``
	  - A pinned tile is out of range of the page.  Unpin it, or raise :guilabel:`Max Page Size`.

A tile that no drawable uses never refuses a repack.  If it cannot be packed, it leaves the pages.

Remembered Options
==================

The options of the last repack are remembered for the next one, for as long as the window is open.

* The gutter, the extrusion, the rotation, the page shape flags, the alpha threshold, and the :guilabel:`Keep Pinned Tiles` choice are kept across documents, because they are about how you like to pack.
* The :guilabel:`Max Page Size` is kept only within the same document.  It belongs to the pages of one model, and carrying it to another would pack that model at the wrong size.  A document you open next starts from its own page size.
* Nothing is written to the settings.  After you restart Umamo, a repack starts from the first values again.

Source Artwork Display and Export
=================================

The viewports can draw the model from two places: from the **atlas pages**, as a runtime would, or from the **source layers**, as you drew them.  The document's :guilabel:`Show source artwork` setting chooses.  A new import turns it on, so that you see your art as drawn, and the pack in the background is what makes the document ready to ship.  Turn it off to check the model against the pages, where a seam or a bleed would show.  See :doc:`/editors/properties/document_tab`.

Packing and placing change the pages and the texture coordinates, and not what the model looks like when drawn from the source layers.  Repack Atlas can be run whichever way the model is drawn.

When you export, the pages are what is used:

* A **MOC3** export writes the pages as the textures of the model.  See :doc:`/files/cubism_interchange` and :doc:`/files/exporting`.
* A **CMO3** export writes the real layers of the artwork, with the placement of each on the atlas.  If you moved art by hand, and a page picture could not be redrawn, the export report says so, and a repack fixes it.  See :doc:`/files/export_notices`.

The atlas Command-Line Tool
===========================

The packer is also a command of its own, ``atlas``, that packs the layers of an artwork file into pages without opening Umamo.  It checks its own work by reading every tile back out of its page and comparing it byte by byte.  It is the packer on its own, so it has no pins, no meshes to keep clear, and fewer settings: its pages are always square and rotation is off unless you ask for it.  See :doc:`/command_line/atlas`.

.. seealso::

	* :doc:`/editors/uv_editor/placement`
	* :doc:`/editors/uv_editor/texture_selector`
	* :doc:`/command_line/atlas`
	* :doc:`/artwork/importing`
