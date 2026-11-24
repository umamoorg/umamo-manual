*******
Sources
*******

The Sources editor is a table of the artwork behind the model.  It lists the artwork files that the puppet was made from, the layers of each file, the pieces of art that are bound to those layers, and the drawables that are drawn from each piece.  Use it to see what is bound to what, to find a drawable by the layer it came from, to reload files that you changed in your art program, and to repair a binding that a change broke.  What a binding is, and how reloading works, is in :doc:`/artwork/relinking_and_reloading`.

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: The Sources editor with its header and a table: one artwork file, open, with its layers, one layer open to show a piece of art and the drawable under it, one layer with an amber status icon and the review button, and the Unbound Art group at the end.
	:Setup: Import a layered file, change the name of a layer in the art program, reload, and open the Sources editor.
	:Crop: The Sources area, with its header.
	:Save as: ``images/editors/sources.png``
	:Caption: The Sources editor.

Reading the Table
=================

The table is a tree, from the file down to the drawable:

#. An **artwork file** that the puppet lists.
#. The **layers** that the file had the last time Umamo read it.
#. The **tiles** that are bound to each layer.  A tile is one piece of art in the puppet's atlas.
#. The **drawables** that are drawn from each tile.

At the end is a group, :guilabel:`Unbound Art`, with the tiles that are bound to no layer, and the tiles that are bound to a file that the puppet does not list.

Files and the :guilabel:`Unbound Art` group are open at first, and layers and tiles are closed.  Click the arrow of a row to open or close it.  Which rows are open is saved with the puppet file.

An empty puppet has an empty table.

Header Controls
===============

The header has, left to right, the :guilabel:`Import Artwork…` button, the search field, the :guilabel:`Match Automatically` button, the :guilabel:`Reload Artwork Files` button, and the :guilabel:`Filters` button.  They do not show without an open puppet.

Import Artwork
--------------

The first button runs :guilabel:`Import Artwork…`, the same command as in the File menu.  It opens the import dialog and adds the file you choose to the open puppet.  See :doc:`/artwork/importing`.

Search
------

Type part of a name to list only the rows that match, with the rows above them for context.  The match is on the names of files, layers, tiles, and drawables, and ignores upper and lower case.  Every row opens while you search, and the arrows do nothing until you clear the field.  The text is not saved with the puppet file.

Match Automatically
-------------------

The wand button runs :guilabel:`Match Artwork Automatically`.  It reads every file, and rebinds the art whose layers the files no longer have to their best matches, as one step.  Matches that are not sure enough are not made.  Their proposals stay on the rows that need review.

A notice says what happened, such as ``3 layer(s) matched, 1 left for review.``, or ``No binding matched confidently enough; the suggestions are on the rows that need review.``  The strip of the command has the :guilabel:`Match Threshold`, which says how sure a match must be.  See :doc:`/interface/operation_strip` and :doc:`/artwork/relinking_and_reloading`.

Reload Artwork Files
--------------------

The button with the circular arrow runs :guilabel:`Reload Artwork`.  It checks that every file is still there, and then reloads the files that are, as one undo step.  A notice says what changed, such as ``Artwork reloaded: 2 updated, 1 added, 4 matched.``  If no file changed, it says ``The artwork file(s) have not changed.``

When Umamo has noticed that files changed on disk and is waiting for you, the button shows an alert mark, and its tooltip says ``Artwork files changed on disk.  Reload to take the changes.``  That happens when :guilabel:`Watch Artwork Files` is :guilabel:`Notify Only`, or when a file was edited while the puppet file was closed.  See :doc:`/artwork/source_watcher`.

Filters
-------

The :guilabel:`Filters` button lists one checkbox for each kind of row:

:guilabel:`Bound`
	Layers that a tile is bound to, by a key or by name.

:guilabel:`Unbound`
	Layers that no tile is bound to, the ignored ones among them, and tiles that are bound to no layer.

:guilabel:`Missing Files`
	Files that are no longer where the puppet read them, with everything under them.

:guilabel:`Needs Review`
	Bindings that a reload could not settle.  See `Reviewing a Binding`_.

All four are on at first.  A kind that is off is left out with what is under it.  The rows that give context to a row that is shown stay.  The button has another glyph while a kind is off, and the choice is saved with the puppet file.

Row Types and Columns
=====================

Every row has the same parts: an arrow, an icon, a name with a line of detail, and, at the end, a button.

.. list-table::
	:header-rows: 1

	* - Row
	  - Icon
	  - Detail
	  - Button
	* - File
	  - The sources glyph, which is red with a broken file when the file is missing
	  - The format and the number of layers, such as ``PSD · 24 layers``, and ``no path recorded`` when the puppet does not know where the file is
	  - :guilabel:`File Actions`
	* - Layer
	  - A link, in a color that gives the status
	  - The size, and the place of the top-left corner, such as ``512 × 640 at 120, 48``
	  - :guilabel:`Layer Actions` for an unbound or ignored layer, and the review button for a layer under review
	* - Tile
	  - A texture glyph
	  - The page that the art is packed on, such as ``page 2``, and ``bound to Hair in Old.psd`` for a tile bound to a file that is not listed
	  - The relink button
	* - Drawable
	  - A mesh glyph
	  - None
	  - None
	* - Unbound Art
	  - A broken link, red
	  - None
	  - None

The place of a layer is measured from the corner of the file, which is what the art program shows.  A setting changes this: with :guilabel:`In the Sources area, measure layer positions from the world axes` on, the detail reads such as ``512 × 640 at 12.5 x, 30.0 z``, from the world axes like every other position.  See `Related Settings`_.

Status Indicators
=================

The icon of a row says its status, and its tooltip says it in words.  The colors are those of a traffic light: green for what is settled, amber for what holds only by name or waits for you, and red for what is unbound or missing.

.. list-table::
	:header-rows: 1

	* - Status
	  - Row
	  - Meaning
	* - Present
	  - File
	  - The file is where the puppet read it.
	* - Missing
	  - File
	  - The file is not there any more.
	* - Unknown
	  - File
	  - The puppet has no path for the file, or the platform cannot check.  Umamo never calls a file missing when it could not look.
	* - Bound
	  - Layer
	  - A tile is bound to the layer by a key that the format made for it.  The binding does not depend on the name of the layer.
	* - Bound by name
	  - Layer
	  - A tile is bound by the name and place of the layer.  It holds only while the layer keeps them.
	* - Unbound
	  - Layer, group
	  - No tile is bound to the layer.  The art that is bound to none is listed under :guilabel:`Unbound Art`.
	* - Needs review: The artwork no longer has this layer
	  - Layer
	  - A tile is bound to a layer that its file does not list any more.  The tile keeps its art until you decide.
	* - Needs review: The layer is empty in the artwork
	  - Layer
	  - The file still has the layer, but it is empty.
	* - Needs review: The replacement artwork has no layer under this key
	  - Layer
	  - :guilabel:`Replace Artwork…` pointed the file at another file, which has nothing for this binding.
	* - Needs review: This puppet does not list the artwork this art is bound to
	  - Tile
	  - The tile is bound to a file that the puppet does not list.
	* - Ignored: A reload never adds this layer
	  - Layer
	  - You asked Umamo to keep the layer out of the rig.
	* - Unplaced
	  - Tile
	  - The tile is in the puppet and on no page.

Row Actions
===========

File Actions
------------

Right-click a file, or click the dots at its end.

:guilabel:`Replace Artwork…`
	Points the file at another file, which you choose.  The bindings that the new file cannot resolve go to review.

:guilabel:`Reload This File`
	Reloads this file alone, as one undo step.

See :doc:`/artwork/relinking_and_reloading`.

Layer Actions
-------------

An unbound layer and an ignored layer each have a menu at the end of the row and on a right-click.

:guilabel:`Ignore Layer`
	A reload never makes a drawable for this layer.  Use it for layers that are only a guide, such as a sketch.

:guilabel:`Stop Ignoring`
	Takes it back.

Other layers have no menu: a bound layer is matched by its key and needs no mark, and a layer under review has a binding to settle first.

Relinking a Layer
-----------------

The button on a **tile** is a list of the layers of every file, grouped under the name of the file, with a search box on top.  Choose a layer, and the tile is bound to it, and Umamo pulls the art of the layer in from its file when it can read the file.  The binding changes in one undo step, ``Relink Art``.

* The layer that the tile is bound to now is dimmed.
* :guilabel:`Unbind` is on the list while the tile is bound.  It frees the tile from its layer.
* :guilabel:`Delete Art` is on the list while no drawable is drawn from the tile.  It removes the tile from the atlas.  A tile that a drawable uses cannot be deleted, because the drawable would have nothing to show.
* ``No layer matches.`` means that the search found nothing.

Reviewing a Binding
-------------------

A layer under review has a button with an amber link at its end.  It opens a short menu:

* :guilabel:`Accept` followed by the layer that Umamo proposes and how sure it is, such as ``Accept Hair Front (91%)``.  The tiles that were bound to the lost layer move to it, as one step.  If a reload has already made a new drawable for the proposed layer, the entry ends with ``and remove its new drawable``, and accepting removes that drawable.
* :guilabel:`Relink Manually…` changes the menu into the list of layers of the relink button, for you to choose from.
* :guilabel:`Leave for Now` closes the menu and does nothing.

There may be no proposal, and then the first entry is not there.  Until you decide, the tile keeps the art it has.

Drag and Drop to Rebind
=======================

You can also relink by dragging.  Press a row and hold it for a moment to pick it up, then drop it on a row of the other kind:

* Drop a **layer** on a **tile** to bind that tile to the layer.
* Drop a **tile** on a **layer** to bind the tile to it.

The rows that can take the drop are outlined as you move over them.  A layer under review, and an ignored layer, can be neither dragged nor dropped on, and nor can a file, a drawable, or the :guilabel:`Unbound Art` group.  The layer you dropped on opens afterwards so that you see the tile arrive.  :kbd:`Escape` while you drag cancels it.  The drop is one undo step, ``Relink Art``.

Selecting Drawables and Hover Previews
======================================

Click a row to select the drawables it stands for, which also selects them in the 2D Viewport and the Outliner:

* A **drawable** row selects that drawable.
* A **tile** row selects every drawable drawn from the tile.
* A **layer** row selects every drawable drawn from any tile bound to it.
* A file or the :guilabel:`Unbound Art` group selects nothing, so a click folds it instead.

The rows of the drawables that are selected are highlighted.

Rest the pointer on a layer, a tile, or a drawable for a moment and a picture of its art pops up beside the row.  A layer previews the art of the tile that is bound to it, so an unbound layer, whose pixels live only in its file, has none.  A layer under review previews the old art that the review is about.

Related Settings
================

In :guilabel:`Import` in :menuselection:`Edit --> Settings…`:

:guilabel:`Watch Artwork Files`
	Whether a changed file reloads by itself, only notifies you, or is left alone.  See :doc:`/artwork/source_watcher`.

:guilabel:`When deleting art in the sources, also mark the layer as ignored`
	Stops a piece of art that you delete from coming back at the next reload.

:guilabel:`In the Sources area, measure layer positions from the world axes`
	Changes the position in the detail of a layer, as above.

See :doc:`/interface/settings`.

.. seealso::

	* :doc:`/artwork/importing`
	* :doc:`/artwork/relinking_and_reloading`
	* :doc:`/artwork/source_watcher`
	* :doc:`/interface/settings`
