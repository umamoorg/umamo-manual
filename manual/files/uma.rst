*********
UMA Files
*********

A UMA file, with the extension ``.uma``, is Umamo's own document.  It holds everything that you build in Umamo: the rig, the texture atlas, the list of artwork files that the rig was made from, and how you were looking at the model when you saved.  :menuselection:`File --> Open…` and :menuselection:`File --> Save` work with UMA files and with nothing else.  CMO3 and MOC3 files come in through :menuselection:`File --> Import` and go out through :menuselection:`File --> Export`.  See :doc:`/files/cubism_interchange`.

.. warning::

	Umamo is alpha level software and it does not save your documents automatically.  Save often, and keep copies.  See `Safety and Backups`_.

The UMA File
============

A UMA file holds:

* The rig: the parameters and their groups, the parts, the warp and rotation deformers, the drawables with their meshes and keyforms, the blend shapes, and the glue.  The Runtime Target of the document is part of the rig.
* The texture atlas: every piece of source art as a tile, with its pixels and its place on the atlas pages.
* The list of artwork files that the rig was made from, with the layers that each file held when Umamo last read it.  The artwork files themselves are not stored, so they must stay where they are for Reload and Relink to find them.  See :doc:`/artwork/relinking_and_reloading`.
* A small picture of the model in the pose it was saved in, 256 by 256 pixels at most.  Umamo writes one on every save, and a document does not need it to open.
* The state of the editor.  See `What a UMA Remembers`_.

A UMA file is an ordinary ZIP archive.  A ZIP tool can list what is inside it, but there is never a need to change it by hand.  The format is written up in ``docs/format/UMA.md`` in the source code repository.

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: The File menu open with the Open Recent submenu expanded, listing at least three files.  New, Open…, Save, Save As…, Import, Export, and Exit must be readable.
	:Setup: Open and save a few documents first, so that Open Recent has entries.
	:Crop: The menu bar and the open menus only.
	:Save as: ``images/files/file_menu.png``
	:Caption: The File menu, with Open Recent expanded.

New, Open, Save, and Save As
============================

New, Open, an import, and Exit each replace or end the document that is open.  When it has unsaved changes, each of them asks first.  See `Unsaved Changes`_.

New
---

.. admonition:: Reference
	:class: refbox

	:Menu: :menuselection:`File --> New`
	:Shortcut: :kbd:`Ctrl-N`

New replaces the open document with an empty one.  The new document has a canvas of 1200 by 1200 pixels and nothing else: no parts, drawables, or parameters.  The first artwork that you add with :menuselection:`File --> Import --> Artwork…` brings a canvas size of its own and the starter parameters.  See :doc:`/artwork/importing`.

Umamo also starts with a new document when you launch it without a file.

If another document is still opening, New is refused and the status bar says ``Another document is still opening.``

Open…
-----

.. admonition:: Reference
	:class: refbox

	:Menu: :menuselection:`File --> Open…`
	:Shortcut: :kbd:`Ctrl-O`

Open asks for a UMA file and replaces the open document with it.  The file picker only offers ``.uma`` files.  The status bar shows ``Opening`` and the name of the file while a large document is read, and you can keep working in the meantime.  If the document you were editing changes while the new one loads, Umamo asks about unsaved changes again before it swaps them.

The document opens as it was saved, with the pose, selection, mode, cursors, and views that it remembers.  The undo history starts empty.

There are other ways to open a UMA file:

* :menuselection:`File --> Open Recent` lists the last ten documents that you opened, imported, or saved, newest first.  It is greyed out until there is one.  A file that has moved or been deleted since fails to open with an alert.
* Drag the file onto the window.  See `Drag and Drop`_.
* Double-click the file in your file manager, when the installer has registered the file type.  See `File Association`_.
* Start Umamo with the path of a ``.uma``, ``.cmo3``, or ``.moc3`` file as an argument.

Save
----

.. admonition:: Reference
	:class: refbox

	:Menu: :menuselection:`File --> Save`
	:Shortcut: :kbd:`Ctrl-S`

Save writes the document to its UMA file.  The first save of a new document, or of a document that was imported from a CMO3 or a MOC3, asks where to put the file, as Save As does.  The name that it suggests is the name of the file the document came from without its extension, so ``Erica.cmo3`` suggests ``Erica``, and ``Untitled`` for a new document.  Every save after that writes the same file without asking.

Large documents take a few seconds to write, and you can keep editing while they do.  The status bar says ``Saving…`` and then ``Saved`` with the name of the file.  Anything that you change while the file is being written stays unsaved, and the document is still marked as changed afterwards.  A second Save while one is running does nothing but show the notice ``A save is already in progress.``

Save is greyed out for a document that opened read-only.  See `Read-Only Documents and Open Failures`_.

Save As…
--------

.. admonition:: Reference
	:class: refbox

	:Menu: :menuselection:`File --> Save As…`
	:Shortcut: :kbd:`Ctrl-Shift-S`

Save As always asks where to put the file.  Once it is saved, the document belongs to the new file: Save writes there, the window title shows its name, and it appears in Open Recent.  The file that the document belonged to before is not touched again.

Use Save As to keep a copy of the document at a point that you may want to come back to.

The first time that you save a document that was imported from a CMO3 or a MOC3, the status bar tells you what the UMA file does not carry.  See `What a UMA Does Not Carry`_.

Drag and Drop
=============

You can drop files onto the Umamo window.  A drop is one gesture, so the first file in it decides what the whole drop means:

* If the first file is layered artwork or a flat image, every artwork file in the drop is added to the open document as source artwork, exactly like :menuselection:`File --> Import --> Artwork…`.  See :doc:`/artwork/importing`.  The other files in the drop are ignored.
* Otherwise the first file is opened as the document, replacing the open one after the usual question about unsaved changes.  This works for ``.uma``, ``.cmo3``, and ``.moc3`` files.  The other files in the drop are ignored.

Ignored files are not reported on screen.  The log lists them, in :doc:`/editors/logs`.  A file that Umamo does not recognize is reported with the alert ``is not a file format Umamo recognizes``.

.. _uma-open-failures:

Read-Only Documents and Open Failures
=====================================

A UMA file made by a newer version of Umamo can hold parts that this version cannot interpret.  When one of those parts is required to edit the document honestly, the document opens read-only:

* An alert says ``opened read-only``, and lists the parts that Umamo could not interpret.
* The window title ends with ``(read-only)``.
* Save and Save As are greyed out for as long as the document is open.  You can still edit the document, and you can still export it as a CMO3, a MOC3, or an image.
* Closing or replacing it with unsaved changes offers Discard and Cancel only, because there is nowhere to save to.

Use Export, or update Umamo, to keep your edits.  A part that is not required does not make the document read-only.  Umamo keeps what it does not understand and writes it back unchanged when you save.

When a file cannot be opened, an alert names the file and says why.  The document that was open stays as it was, with its unsaved changes.

.. list-table::
	:header-rows: 1

	* - Message
	  - What it means
	* - Could not read *name*.
	  - The file is missing, or Umamo is not allowed to read it.
	* - *name* is not a file format Umamo recognizes.
	  - The contents of the file match none of the formats in :doc:`/files/format_support`.  Check that you picked the right file.  A ``model3.json`` file is not a document on its own, so it is reported this way too.  Import the ``.moc3`` file beside it instead.
	* - *name* cannot be opened in the editor yet.
	  - Umamo recognizes the format, but it cannot open it as a document.
	* - Could not open *name*.  The file may be damaged.
	  - The file is a format that Umamo knows, but reading it failed.
	* - Could not import *name*.  Its model3.json manifest was not found next to the file.
	  - A MOC3 import needs its ``model3.json`` file.  See :doc:`/files/cubism_interchange`.
	* - Could not import *name*.  A texture referenced by its model3.json is missing or unreadable.
	  - A MOC3 import needs every texture file that its ``model3.json`` lists.
	* - *name* has no layers with pixels to import.
	  - An artwork file has no layer with any visible pixel, so there is nothing to build a rig from.
	* - *name* was made by a newer version of Umamo and cannot be opened by this one.
	  - Update Umamo.  See :doc:`/getting_started/updating`.

If a save fails, an alert says ``Could not save`` with the name of the file and the reason.  The file that was there before is left as it was.

What a UMA Remembers
====================

A UMA file reopens the way you left it, so that you can carry on from where you stopped.  None of this counts as a change to the document: panning the view or selecting a drawable does not make Umamo ask whether to save.

For each area, kept separately for the 2D Viewport and the UV Editor where it applies:

* The pan and zoom of the view.  An area that you switch between the 2D Viewport and the UV Editor finds each as you left it.
* Which overlays are on, and the area's grid.  See :doc:`/editors/viewport_2d/overlays`.
* Whether the toolbar and the sidebar are open, the sidebar's width and tab, and which of its panels are folded.
* The Outliner's open branches, its filters, and which columns are shown.
* The Sources editor's open rows and filters.
* The Parameters editor's folded groups, open range editors, and the filter for the selected parameters.
* The Keyform Sheet's folded rows, filters, and visible slice.
* The tab of the Properties editor and the sections that are folded.
* The UV Editor's choice of texture.

For the document as a whole:

* The pose, as the value of every parameter that is away from its default.
* The selection, the selected parameters, the mode, and the select mode.
* The 2D cursor and the UV cursor.
* The pivot point and the proportional editing settings.

What a UMA Does Not Carry
=========================

* The undo history.  A reopened document starts with an empty history.
* The artwork files, which are listed by path and are not stored.  The pixels of every tile are stored.
* The layout of the windows and the workspaces.  They belong to your settings, not to the document.  See :doc:`/interface/workspaces`.
* Physics, motions, and animation.  Umamo does not edit them yet.  See :doc:`/rigging/physics`.
* Data that only Cubism knows about.  The first time that you save a document that was imported from a CMO3, the status bar says that the CMO3's physics, guides, keyform notes, random pose, model state sets, user data, and other editor settings are not carried in the file.  For a document imported from a MOC3, the notice names the physics, motions, expressions, user data, and pose.

Umamo remembers that data for as long as the document stays open, so a CMO3 that you export in the same session still contains it.  A CMO3 that you export after reopening the UMA file does not.  If you need that data, keep the original Cubism files and export from the session that imported them.

Safety and Backups
==================

Unsaved Changes
---------------

The window title shows ``Umamo``, the name of the document, and a ``*`` when the document has unsaved changes.  Only changes to the model count.  Moving a parameter slider, changing the selection, and moving the view do not.  Undoing back to the point that was saved clears the marker.  Exporting does not clear it, because an export is not a save.

New, Open, the imports, and Exit ask before they replace or end a document with unsaved changes.  The window's close button, the quit command of the operating system, and the back gesture on Android do the same.

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: The unsaved-changes dialog with its message and its three buttons, Save, Don't Save, and Cancel.
	:Setup: Edit anything in a document, such as moving a vertex, and then choose File → New.
	:Crop: The dialog and a little of the window around it.
	:Save as: ``images/files/unsaved_changes.png``
	:Caption: The question that New, Open, and Exit ask when the document has unsaved changes.

The question reads ``The document has unsaved changes.  Save them first?``, or ``Save them before quitting?`` for Exit.

Save
	Saves the document, then carries on once the file has been written.  It is the default answer.

Don't Save
	Carries on and discards the changes.

Cancel
	Stays where you are.

A document that opened read-only cannot be saved, so it offers ``Discard`` or ``Quit Without Saving`` and Cancel.

Exit and replacing the document wait for a save or an export that is in progress, so that the process never ends in the middle of writing a file.

How Saving Is Written
---------------------

A save writes the whole file to a temporary file beside the target, and moves it over the target only when it is complete.  If Umamo or the computer stops during a save, the file that was there before is still there.  A stopped save can leave a hidden temporary file beside it, whose name starts with a dot and contains ``.tmp-``.  The next save of the same file removes it.

No Autosave
-----------

There is no autosave and no automatic backup.  Work that you have not saved is lost when Umamo closes, crashes, or is stopped, and so is the undo history.

Making Your Own Backups
-----------------------

* Keep your original CMO3, MOC3, and artwork files untouched, and work in UMA files.
* Before a drastic step, such as :doc:`/artwork/atlas_packing` or reloading artwork, use :menuselection:`File --> Save As…` to save a copy under a new name.  Keep working in the copy.
* Copy the ``.uma`` file in your file manager from time to time.  It is a single file.
* Do not rely on the undo history to bring work back.  It is not saved.

See :doc:`/troubleshooting/backups_and_data_safety`.

File Association
================

The Windows installer, the Debian and Fedora packages, and the macOS application register the ``.uma`` file type, so that a double-click on a UMA file opens it in Umamo.  The portable archives do not register anything.  See :doc:`/getting_started/installing` for how to register the type by hand.

On macOS, a file that you open while Umamo is running replaces the open document, after the same question about unsaved changes that Open Recent asks.

Compatibility with Older Versions
=================================

UMA is a new format and it is still changing while Umamo is in development.

* Umamo reads UMA files from older versions of Umamo, with one exception, and it writes the current format when you save.  An older version of Umamo may not be able to read the file afterwards.
* A UMA file from a newer version opens read-only when it needs something this version does not have, or does not open at all.  See `Read-Only Documents and Open Failures`_.
* Umamo keeps the parts of a file that it does not understand and writes them back unchanged.

.. warning::

	Version 0.5.0 changed how a mesh is stored.  UMA files saved by version 0.4.0 that hold meshes cannot be read by version 0.5.0.  Keep a copy of the original artwork or Cubism files that those documents were made from.

.. seealso::

	* :doc:`/files/cubism_interchange`
	* :doc:`/files/format_support`
	* :doc:`/troubleshooting/backups_and_data_safety`
	* :doc:`/interface/menus`
	* :doc:`/editors/history`
