***********************
Reloading and Relinking
***********************

Artwork changes while you rig it.  An artist repaints a layer, renames a folder, adds a new piece, or deletes one.  Umamo keeps the model in step with the file, and it does so without ever throwing away your rigging.  **Reloading** reads the files again and folds in what changed.  **Relinking** is how you tell Umamo which layer a piece of art belongs to when it cannot work that out itself.

The rule behind all of it is that artwork changes never destroy rig work.  What matches is updated in place.  What is new is added.  What cannot be matched is left exactly as it was and flagged for you to decide.

The commands are in the Sources editor, and they are described there as well.  See :doc:`/editors/sources`.

How Layers Are Matched
======================

Every drawable's art is bound to a layer of a file by a **key**, which the format gives to the layer when the file is imported.  See :doc:`/artwork/supported_formats` for what the key is made of in each format.  When a file is read again, every binding has one of four outcomes:

Matched
	The file has a layer under the same key.  The art is updated in place if its pixels changed, and nothing happens if they did not.

Added
	The file has a raster layer that no tile is bound to.  It becomes a new drawable, as in an import.  A layer you have marked to be ignored is not added.

Rebound
	The key is gone, but a layer in the file looks so much like the lost one that Umamo is sure enough to move the binding to it.  The art takes the new layer, and no new drawable is made.

Needs review
	The key is gone, and nothing is sure enough.  Nothing is changed, and the binding is flagged.  See `Needs Review`_.

Layers that are not raster layers, such as text and folders, are not considered.  A raster layer that has become a text layer in the file reads as missing.

The step from a lost key to a **rebound** layer is a score between 0 and 100%.  It is made from five signals, each of which can be read when the data is there:

.. list-table::
	:header-rows: 1

	* - Signal
	  - Weight
	  - How it is scored
	* - Name
	  - 35%
	  - How alike the two names are.
	* - Folder
	  - 10%
	  - How much of the folder path is shared.
	* - Position
	  - 20%
	  - How much the two rectangles overlap on the canvas.
	* - Size
	  - 10%
	  - The smaller area over the larger.
	* - Pixels
	  - 25%
	  - How alike the two pictures are, compared at a small size.  Only the five candidates that the other signals like best are compared.

A layer whose pixels are exactly the same as the lost one's, even under a new name, scores 100% outright.  Only layers that no tile is bound to are candidates, apart from layers that are bound only to a new, untouched drawable that a reload made.  A match is made on its own at **70%** or more, and the bar can be moved on the operation strip of the command.  A weaker best candidate is kept as a proposal on the row that needs review.

Reloading
=========

A reload reads the artwork files from disk and applies what changed to the document, as one undo step.  It needs the files to be where the document recorded them.

Reload Artwork Files
--------------------

The refresh button in the header of the Sources editor reloads every listed file that is present.  The command is :guilabel:`Reload Artwork` in the command palette.  It first checks that the files are there, then reads and reloads them.  See :doc:`/editors/sources`.

A notice says what it did.  *Updated* counts the tiles that took new art, *added* the new drawables, *matched* the tiles that were moved to a layer that re-created a lost one, and *need review* the bindings that were left:

* ``Artwork reloaded: 2 updated, 1 added, 4 matched.``
* ``Artwork reloaded: 2 updated, 1 added, 4 matched, 1 need review.  See the log.``
* The same with ``; some art now reaches past its mesh.  Generate Mesh from Art re-meshes it; see the log.`` at the end.
* ``The artwork file(s) have not changed.``  Nothing is recorded in the history.
* ``No artwork file could be read; nothing was reloaded.``

Reload This File
----------------

The :guilabel:`File Actions` menu of a file row has :guilabel:`Reload This File`, which reloads that file alone.  The watcher uses the same command for the files that changed.  See :doc:`/artwork/source_watcher`.

What a Reload Does
------------------

* A bound layer whose pixels changed gets a **new tile** with the new pixels, and the drawables over it sample the new art.  The old pixels are kept, so Undo shows the old art again.
* A layer that changed its size or its place on the canvas keeps its drawables where they are.  A reload never moves a drawable.
* A layer that is new becomes a new drawable with a first mesh, placed among the others where the file puts it, and in the part that holds its folder if the document has one.
* A layer that was lost, but is sure enough to be found again, takes its replacement's art.
* A layer that was erased to nothing, rather than deleted, keeps its art and is flagged for review, because the artist may have meant either.
* The layer's **eye** in the file is followed only while the drawable shows the state the file last had.  If you hid or showed the drawable in the Outliner, that is your work and it stays.
* The new tiles are packed onto the atlas into the gaps around the art that did not change.  See :doc:`/artwork/atlas_packing`.

After the reload the operation strip, titled :guilabel:`Reload Artwork`, has :guilabel:`Match Threshold`, :guilabel:`Alpha Threshold`, and :guilabel:`Birth Mesh Margin`.  Change one and the reload is done again from the files as they were read.  See :doc:`/interface/operation_strip`.

Meshes on Reload
----------------

Your meshes are rig work, so a reload is careful with them.

* A mesh keeps its **vertices**.  Its texture coordinates are carried so that each vertex goes on sampling the same pixel of the canvas as before.  The art moves under a mesh that stays, which is how a re-import in the Cubism Editor behaves.
* The one exception is a first mesh that you have not touched, a plain quad on a drawable that has no deformer.  It is made again to fit the new art.  A quad that covers only one piece of a layer that was split between several drawables is treated as one you made, because making it again would cover the others' art.
* Art that has **grown** past its mesh stays outside it, and the part outside is not drawn.  A reload notice says ``some art now reaches past its mesh``, and :guilabel:`Generate Mesh from Art` makes a mesh for it.  See :doc:`/modeling/generate_mesh`.

Needs Review
============

A binding needs review when nothing in the file settles it, and the document keeps it as it is until you do.  The Sources editor marks the layer with an amber link, and the reload notice counts it.  The reasons are:

* The file no longer has the layer.  It was deleted, or it was renamed and its key changed with the name.
* The layer is still there, but it has been erased to nothing.
* The file was replaced by one that has no layer under this key.  See `Replace Artwork`_.
* The tile is bound to a file that the document does not list.

The tile keeps its art, and the drawables over it go on showing it.  To settle the binding, open the review button of the row:

* :guilabel:`Accept` takes the layer that Umamo proposes, with how sure it is.  Every tile bound to the lost key moves to it in one step.
* :guilabel:`Relink Manually…` is a list of the layers of all files, to choose from.
* :guilabel:`Leave for Now` does nothing.

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: The review menu open on a layer row of the Sources editor: the entry Accept with a layer name and a percentage, Relink Manually…, and Leave for Now, under a layer row with an amber link and the status text Needs review.
	:Setup: Add a layered file, rename a layer in the art program so that its key changes (a PSD without layer IDs works), reload, and click the review button of the flagged layer.
	:Crop: The Sources area and the open menu.
	:Save as: ``images/artwork/review_menu.png``
	:Caption: Reviewing a binding.

The row stays flagged until it is settled.  The :guilabel:`Needs Review` filter of the Sources editor lists only these.  See :doc:`/editors/sources`.

Relinking
=========

Relinking binds a piece of art to a layer by hand.  It is for a tile that is bound to nothing, to the wrong layer, or to a lost one.  Choose the layer in the list of the relink button of the tile, or drop one on the other as below, and the tile is bound to it.  The art of the layer is pulled into the document at the same time, so the drawables show the layer's art from then on.

Umamo reads the layer from its file.  When it cannot, it reads it from the layer images that the Cubism Editor embedded in a CMO3 the document came from, or from the art the document holds.  The notices tell you which: ``Art relinked and reloaded.``, ``Art relinked from the art this document holds, since its file could not be read.``, or ``Art relinked; its file could not be read, so the art did not change.``  In the last case only the binding changes.

A relink is one undo step, ``Relink Art``, and shows the :guilabel:`Relink Art` strip.  Its mesh follows the rules of `Meshes on Reload`_.

Drag and Drop
-------------

In the Sources editor, hold a layer or a piece of art for a moment to pick it up, and drop it on the other kind: a layer on a tile, or a tile on a layer.  The tile is bound to the layer.  See :doc:`/editors/sources`.

Unbind
------

:guilabel:`Unbind` on the relink list frees a tile from its layer.  The tile and its art stay, and the tile moves to the :guilabel:`Unbound Art` group.  Nothing about it is updated by a reload any more.  One undo step, ``Unbind Art``.

Delete Art
----------

:guilabel:`Delete Art` on the relink list removes a tile from the atlas.  It is only on the list while no drawable is drawn from the tile.  The layer is then unbound, so the next reload brings it back as a new drawable, unless the layer is ignored.  One undo step, ``Delete Art``.  See `Ignoring Layers`_.

Match Automatically
===================

:guilabel:`Match Artwork Automatically` goes through every binding that the files no longer resolve, and scores each against the layers of its file that nothing is bound to, and against layers that only new, untouched drawables are bound to.  A match at or above the bar is made, and the rest are left, with their best candidate shown on their rows as a proposal.  It is the button with the wand in the Sources editor, and it is in the command palette.

It is the same step that a reload takes for a lost layer, offered by itself, for when you want to run it after you have unbound or relinked, or at another bar.  It also falls back to the embedded layers of a CMO3, or to the art the document holds, when a file cannot be read, so it works with a file that has moved.

The strip has a :guilabel:`Match Threshold`, on which you can lower the bar and run again.  Notices say what happened:

* ``3 layer(s) matched, 1 left for review.``
* ``No binding matched confidently enough; the suggestions are on the rows that need review.``
* ``Nothing left to match against: every candidate layer is already bound.  Adjust Match Threshold on the reload's strip, or relink manually.``
* ``No artwork could be read, from its file or from this document; nothing was matched.``

The history step is ``Match Artwork``.  When a reload has just made a new drawable for a layer that is really the lost one, re-created, matching moves the old binding to that layer and removes the new drawable, as :guilabel:`Accept` does on a row.  Only a drawable that is new and untouched is removed.

Replace Artwork
===============

:guilabel:`Replace Artwork…` is in the :guilabel:`File Actions` menu of a file row.  It points the record of the file at another file.  Use it when the file has moved or been renamed, when you saved it under a new format, or when you want to swap the art for a new version.

Pick the new file.  Umamo reads it, and then:

* The layers it has under the same keys as before are reloaded, as in a reload.
* The bindings that the new file cannot resolve by key are matched by score, at the bar of the strip.
* The rest are left for review, with the reason ``The replacement file has no layer under this key``.
* The record takes the name, the path, and the format of the new file.  It keeps the place that the old one had on the canvas.

Pointing the record at a file in the same format and with the same layers is the quick way to repair a moved file.  Pointing it at a file of another format means that no key matches, so the bindings are matched by score.  The notice says ``Artwork replaced: 8 layer(s) reloaded by key, 2 matched, 1 left for review.``  The history step is ``Replace Artwork``.  Replace Artwork needs a file row to say which file, so use it from the Sources editor.

Ignoring Layers
===============

A layer that is in the file and that you do not want in the rig, such as a rough sketch or a reference, would be added to the model as a new drawable the next time the file is reloaded.  Mark it to be **ignored**.

* Right-click an unbound layer in the Sources editor, or use the dots at its end, and choose :guilabel:`Ignore Layer`.  :guilabel:`Stop Ignoring` takes the mark off.  The history steps are ``Ignore Layer`` and ``Stop Ignoring Layer``.
* Only a layer that is present and has no tile bound to it can be ignored.
* The mark is saved with the document, and every reload carries it on.
* The setting :guilabel:`When deleting art in the sources, also mark the layer as ignored` makes :guilabel:`Delete Art` do this at once, as one step, ``Delete Art, Ignore Layer``.  See :doc:`/interface/settings`.

Missing Files
=============

The document records the path of each artwork file, and it does not store the files.  A file can go away: you move it, rename its folder, or open the document on another computer.

* The Sources editor marks the file with a broken-file icon in red.  A file with no recorded path, or one that the platform cannot check, shows as unknown and is never called missing.
* The watcher tells you with the notice ``Name is no longer where the document read it.``  See :doc:`/artwork/source_watcher`.
* A reload skips a file that is not there.  One that is there and cannot be read is skipped as well, and the log names it.  With no file left to read, the notice says ``No artwork file could be read; nothing was reloaded.``
* **Relink** and **Match** fall back to the layer images embedded in a CMO3, and then to the art that the document holds, so they still work.
* Everything you made stays: the drawables, the meshes, the keys.  The atlas holds the pixels of every tile.

To repair the links, point the file at its new place with :guilabel:`Replace Artwork…`.  If the file does not exist any more, you can leave the document as it is: the model works without the files.  Only reloading needs them, and relinking and matching can use the art the document holds.

Undo and History
================

Every artwork operation is one undo step, and History names it:

.. list-table::
	:header-rows: 1

	* - Step
	  - From
	* - ``Import Artwork``
	  - :doc:`/artwork/importing`.
	* - ``Reload Artwork``
	  - Reload, whether you pressed it or the watcher did.
	* - ``Relink Art``
	  - A relink by the list, by drop, or by accepting a proposal.
	* - ``Unbind Art``
	  - :guilabel:`Unbind`.
	* - ``Delete Art``, ``Delete Art, Ignore Layer``
	  - :guilabel:`Delete Art`.
	* - ``Match Artwork``
	  - :guilabel:`Match Artwork Automatically`.
	* - ``Replace Artwork``
	  - :guilabel:`Replace Artwork…`.
	* - ``Ignore Layer``, ``Stop Ignoring Layer``
	  - The layer menu.

A reload makes new tiles and does not write over the old ones, so undoing a reload shows the old art again, and redoing shows the new.  A reload, a relink, a match, and a replace show an operation strip that adjusts the step.  The strip is closed by any new step.  See :doc:`/editors/history` and :doc:`/interface/operation_strip`.

Operations that do not fit, such as a pack that would move art which is already placed, are refused whole, with a report, and nothing is changed.  If you edit while an operation is being prepared, the result is dropped and not applied over your edit.

.. seealso::

	* :doc:`/editors/sources`
	* :doc:`/artwork/source_watcher`
	* :doc:`/artwork/supported_formats`
	* :doc:`/modeling/generate_mesh`
