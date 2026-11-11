*************
Art Placement
*************

When Umamo packs artwork into an atlas, each piece of art lands on a page at a place: a position, a turn, and a scale.  The place is called the **placement**, and a piece of art with a placement is a **tile**.  In Object Mode, the UV Editor lets you change the placement by hand: you can move, turn, and scale the art on its page, and you can **pin** it so that it stays where you put it.

Moving the art moves its pixels on the page, and every mesh that samples the art goes with them.  The way the mesh maps onto the art does not change, so the model looks the same in the 2D Viewport.  What changes is where the art sits on the page, and so how the pages are filled.

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: The UV Editor over an atlas page in Object Mode while a Grab is in progress: the badge at the top with the word Placement and the shift in pixels, one island moved by the pointer, and the outline of a piece of art that overlaps another with the word Overlapping in the badge.
	:Setup: Open a model with an atlas page, select a drawable, hover the UV Editor, press G, and move the pointer until the art overlaps its neighbor.
	:Crop: The UV Editor area.
	:Save as: ``images/editors/uv_placement.png``
	:Caption: Moving art on its page.

Picking Islands
===============

Over a page, every visible mesh whose art is on the page is drawn as an **island**: the outline of its triangles.  Each island is a click target for its whole drawable.  The selection is the same selection as in the 2D Viewport and the Outliner, so what you pick here is selected there.

* **Click** an island to select its drawable.  :kbd:`Shift`-click, or :kbd:`Ctrl`-click, adds it, or takes it out.  A click on empty space clears the selection.
* **Alt-click** picks among the islands that overlap at that spot.  See :doc:`/editors/viewport_2d/index`.
* **Drag** a box to select every island it encloses.  :kbd:`Shift` adds to the selection.  The Box Select and Circle Select tools are for elements, and do not arm over this editor in Object Mode.
* Where islands overlap, an island that has opaque art under the pointer wins over one that has none, and among the rest the one in front wins.  In front means in the draw order the model has at rest.  A pose does not change it.  Where no island has opaque art under the pointer, the mesh itself is picked.
* An object that is hidden or marked as not selectable is skipped.

The art that moves is the art of the selected drawables.  A piece of art that several drawables share, as copies do, moves once, with all of them.

Moving, Rotating, and Scaling Art
=================================

Select the drawables whose art you want to place, hover the UV Editor, and press:

* :kbd:`G` to move (Grab),
* :kbd:`R` to turn (Rotate),
* :kbd:`S` to scale.

Move the pointer, then click or press :kbd:`Enter` to confirm.  :kbd:`Escape` or a right-click cancels, and nothing changes.  It is a modal gesture like the one for vertices, with the same axis locks.  See :doc:`/modeling/transforming`.

* **Grab** moves the art in whole pixels of the page.  An axis lock keeps one of the two components at zero.
* **Rotate** turns the art about its pivot.
* **Scale** scales the art about its pivot, and an axis lock leaves the other factor at 1.
* The pivot is the one chosen in :guilabel:`Pivot Point` in the header: :guilabel:`Median Point`, :guilabel:`Individual Origins`, :guilabel:`Active Element`, or :guilabel:`2D Cursor`.  See :doc:`/interface/pie_menus`.
* The badge at the top of the area names the gesture.  It says ``Placement`` and shows the shift in pixels, the angle in degrees, or the scale factor.  Scrubbing is shown live on the art itself.

The confirmed gesture is one undo step: ``Move Art On Atlas``, ``Rotate Art On Atlas``, or ``Scale Art On Atlas``.  It then shows an operation strip with the numbers, :guilabel:`Move X` and :guilabel:`Move Y` in whole pixels with Y running down the page, :guilabel:`Angle`, or :guilabel:`Scale X` and :guilabel:`Scale Y`.  Change a number and the same gesture is done again with the new value.  See :doc:`/interface/operation_strip`.

The UV Snap pie, on :kbd:`Shift-S`, moves the art too: to the pixels of the page, to the grid, or to the cursor.  See :doc:`/interface/pie_menus`.

A gesture is refused, with a notice near the pointer, when it could not be carried out:

.. list-table::
	:header-rows: 1

	* - Notice
	  - Why
	* - ``Show an atlas page in the UV editor to move placements.``
	  - The editor shows a source layer, and not a page.
	* - ``Nothing selected is packed on an atlas page or there is no source artwork.``
	  - The selected drawables have no placement.  Their art is not on a page that Umamo packed, or the puppet keeps no source artwork to compose the page from.
	* - ``Nothing selected is packed on this page.``
	  - The selected art is on another page.  Show that page.
	* - ``Selected tile is pinned.  Unpin it to transform it.``
	  - Every selected piece of art is pinned.  See `Pinning`_.
	* - ``The atlas cannot be recomposed from its source artwork, so placements cannot move.``
	  - Umamo cannot rebuild the page from the artwork.
	* - ``The puppet's UVs address the source artwork and not the atlas so there is no placement to move.``
	  - The puppet file was saved so that its texture coordinates point at the artwork itself, so there is no place on a page to change.

Only the unpinned art is moved when a selection holds both.

Pinning
=======

A **pin** holds a piece of art where it is.  A pinned piece is not moved by hand, and a repack leaves it where it is, if :guilabel:`Keep Pinned Tiles` is on, as it is at first.  Both commands work in Object Mode on the UV Editor under the pointer, and they pin or unpin the art of the selected drawables, pinned or not.  A pin is saved with the puppet file.  The state is also a checkbox, :guilabel:`Pinned`, in the Data tab of the Properties editor.  See :doc:`/editors/properties/data_tab`.

Pin Art Placement
-----------------

.. admonition:: Reference
	:class: refbox

	:Mode: Object Mode
	:Menu: Command palette
	:Shortcut: :kbd:`P`

Pins the art of the selected drawables.  One undo step, ``Pin Art On Atlas``.  If nothing selected is placed on a page, a notice says so.  The key means nothing over a viewport.

Unpin Art Placement
-------------------

.. admonition:: Reference
	:class: refbox

	:Mode: Object Mode
	:Menu: Command palette
	:Shortcut: :kbd:`Alt-P`

Takes the pin off the art of the selected drawables.  One undo step, ``Unpin Art On Atlas``.

Placement Warnings
==================

While you drag, Umamo checks the art against the rest of the page, with its real shape and not a box.

* ``Overlapping`` in the badge means that the art you are moving lies over another piece of art.  The outline of the art you are moving is drawn in the warning color.
* ``Off page`` in the badge means that opaque pixels of the art spill past the edge of the page.

The warnings do not stop you.  When you confirm, a notice says ``Placement overlaps another tile.  Repack the atlas to clear the collision.`` or ``Placement extends past the page edge.  The overhang is cropped.``  Where pieces overlap, a mesh samples paint that belongs to another piece, and the part past the edge is cropped.  A repack lays the pages out again without collisions.  See `Relation to Atlas Packing`_.

Placement Fields in the Sidebar
===============================

The :guilabel:`Item` tab of the sidebar has the placement as numbers, for the drawable that the editor shows: :guilabel:`X` and :guilabel:`Y` in pixels from the top left of the page, :guilabel:`Angle`, and :guilabel:`Scale X` and :guilabel:`Scale Y`.  Type a value, and the art is placed there.  The fields are dimmed when the art cannot be moved, as when its tile is pinned, and a drawable with no place says ``Not placed on a page.``  See :doc:`/editors/viewport_2d/sidebar`.

Relation to Atlas Packing
=========================

Atlas packing lays the pieces out on pages by itself, when artwork is imported and whenever you run :guilabel:`Repack Atlas`.  Placement is the hand tool: it moves pieces after the pack, one at a time or a few together.

* A repack moves the pieces that are not pinned, and packs them around the pinned ones, unless :guilabel:`Keep Pinned Tiles` is off.  Pin the pieces whose place you have chosen before you repack.
* A repack clears an overlap, as the notice says.

See :doc:`/artwork/atlas_packing`.

.. seealso::

	* :doc:`/editors/uv_editor/index`
	* :doc:`/artwork/atlas_packing`
	* :doc:`/editors/viewport_2d/sidebar`
	* :doc:`/modeling/transforming`
