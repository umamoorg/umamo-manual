*********
Exporting
*********

Exporting writes a file from the open document and leaves the document as it is.  Umamo exports a model as a CMO3 or as a MOC3 with its sidecar files, and it exports a picture of the posed model as a PNG image.

The Export Menu
===============

The :menuselection:`File --> Export` submenu has three rows:

.. list-table::
	:header-rows: 1

	* - Row
	  - Command palette
	  - Writes
	* - :menuselection:`File --> Export --> CMO3…`
	  - Export CMO3…
	  - A Cubism Editor project.  See `Export CMO3`_.
	* - :menuselection:`File --> Export --> MOC3…`
	  - Export MOC3…
	  - A baked model with its sidecar files.  See `Export MOC3`_.
	* - :menuselection:`File --> Export --> Image…`
	  - Export Image…
	  - A PNG image of the posed model.  See `Export Image`_.

None of them has a default shortcut.  A row is greyed out while there is nothing to export with it.

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: The File menu with the Export submenu open, showing CMO3…, MOC3…, and Image….
	:Setup: Open any model, so that the rows are enabled.
	:Crop: The menu bar and the open menus only.
	:Save as: ``images/files/export_menu.png``
	:Caption: The Export submenu of the File menu.

Some things are the same for every export:

* An export is not a save.  The document is not marked as saved, its title does not change, and the UMA file is not touched.
* The file picker suggests the name of the document's UMA file without its extension, or else the name of the file that the document came from, or ``Untitled``.  The picker adds the extension.
* The status bar shows ``Exporting model…`` or ``Exporting image…`` while the file is written, and ``Exported`` with the name of the file when it is done.  You can keep working in the meantime.
* Only one model export runs at a time.  Asking for another CMO3 or MOC3 export shows the notice ``An export is already in progress.``  New, Open, and quitting wait for a running model export to finish, and say ``Waiting on export to finish…``
* A CMO3 and an image are written to a temporary file first and moved into place when they are complete, so a failed export leaves the old file as it was.  The files of a MOC3 are written straight into place.
* The native file picker asks before it replaces the file you picked.  A MOC3 export also writes other files beside it, and has a warning of its own for those.  See `Overwrite Warning`_.

Export CMO3
===========

.. admonition:: Reference
	:class: refbox

	:Menu: :menuselection:`File --> Export --> CMO3…`

Export CMO3 asks where to put the file, writes a ``.cmo3``, and then shows the export report if there is anything to report.  It has no options.

The CMO3 records the Runtime Target of the document as the version that it is made for.  How the file is built depends on where the document came from.  See :doc:`/files/cubism_interchange`.

Export MOC3
===========

.. admonition:: Reference
	:class: refbox

	:Menu: :menuselection:`File --> Export --> MOC3…`

Export MOC3 bakes the document into a runtime model.  It first shows the `Export Options`_ dialog.  When you confirm it, the file picker asks where to put the ``.moc3`` file, and Umamo builds and writes the files that make up the model.  Cancelling either one writes nothing.

Export Options
--------------

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: The MOC3 Export Options dialog, with the Content, Sidecar Files, and Scale sections, the Cancel and Export buttons, and the canvas readout under Pixels per unit.
	:Setup: Import a MOC3 that has a physics file, so that the physics checkbox is enabled, and choose File → Export → MOC3….
	:Crop: The dialog only.
	:Save as: ``images/files/export_moc3_options.png``
	:Caption: The MOC3 Export Options dialog.

.. list-table::
	:header-rows: 1

	* - Option
	  - Default
	  - Effect
	* - :guilabel:`Export hidden parts`
	  - Off
	  - Parts that are hidden are left out, with everything in them.  Turn it on to write them.
	* - :guilabel:`Export hidden drawables`
	  - Off
	  - Drawables that are hidden are left out.  Turn it on to write them.
	* - :guilabel:`Export sketch parts`
	  - Off
	  - Parts that are marked as guide images are left out, because they are for drawing and are not part of the model.  Turn it on to write them.
	* - :guilabel:`Physics settings (physics3.json)`
	  - On
	  - Writes the physics file that was imported with the model.  It is greyed out and unticked unless the document came from a MOC3 that had one.
	* - :guilabel:`User data (userdata3.json)`
	  - On
	  - The same, for the user data file.
	* - :guilabel:`Display info (cdi3.json)`
	  - On
	  - Writes the file that names the parameters, the parts, and the parameter groups.  Without it a tool can only show IDs.
	* - :guilabel:`Pixels per unit`
	  - See below
	  - The scale of the model file.  It is a number from 1 to 1,000,000.

The defaults are those of the bake that the Cubism Editor does: hidden objects and guide images are dropped, and every sidecar is included.  Everything that the options leave out is listed in the export report.

:guilabel:`Pixels per unit` says how many pixels of the canvas make one unit of the model.  It starts at the scale the model was imported with, or else at the width of the canvas, so that the canvas is one unit wide.  Under the field, the dialog shows the canvas measured in units at the scale that you typed.

Umamo remembers the choices until you quit, so the next dialog opens with them, but it does not save them to your settings.  The checkboxes carry over to other documents.  The scale is kept for the same document only, and a different document starts from its own.  The choices are remembered when you confirm the dialog, even if you then cancel the file picker.

Files Written
-------------

A baked model is a group of files.  Export MOC3 writes them all beside the file that you picked, and makes the folders that it needs.  *name* is the name you gave in the picker.

.. list-table::
	:header-rows: 1

	* - File
	  - Notes
	* - ``name.moc3``
	  - The model.
	* - ``name.model3.json``
	  - The manifest that lists the other files.  A model imported from a MOC3 keeps its eye blink and lip sync groups and its hit areas here.
	* - ``name.cdi3.json``
	  - The display information.  Not written when you turn it off.
	* - ``name.size/texture_00.png``, ``texture_01.png``, and so on
	  - The atlas pages.  The folder is named with the largest width or height of any page in pixels, such as ``name.4096``.  A model imported from a MOC3 keeps the file names and folders of its manifest, and writes its original texture files unchanged.
	* - Physics, pose, user data, expression, and motion files
	  - Written unchanged when the document was imported from a MOC3 that had them.  Umamo does not make them.

Overwrite Warning
-----------------

The file picker asks about the ``.moc3`` file that you pick and nothing else.  The rest of the group lands beside it without a question, so Umamo checks for them first.  If any of the files it is about to write already exist, a warning lists every one of them:

``Exporting will overwrite 3 existing file(s): name.model3.json, name.cdi3.json, name.4096/texture_00.png``

Choose :guilabel:`Overwrite` to replace them, or :guilabel:`Cancel` to write nothing.  This is the only place that Umamo asks.  The CMO3 export and the image export write one file, and the file picker covers it.

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: The overwrite warning with its message listing at least two files and the Overwrite and Cancel buttons.
	:Setup: Export a MOC3 once, and then export it again to the same place.
	:Crop: The dialog and a little of the window around it.
	:Save as: ``images/files/export_overwrite.png``
	:Caption: The warning that lists the files an export would replace.

Version and Stripping
---------------------

The Runtime Target of the document decides which MOC3 version is written.  The sections that a version lacks do not exist in its files, so Umamo removes from the copy it writes every feature that the version cannot hold: blend shapes, colors, part composites, and so on.  The document keeps them.  The export report lists what was removed.  See :doc:`/files/runtime_targets`.

An object whose ID is longer than the 64 bytes that a MOC3 stores is written with a shortened ID, and the ``.cdi3.json`` file uses the shortened one.  A drawable with more than 65,536 vertices is left out.  The report lists them.

Export Image
============

.. admonition:: Reference
	:class: refbox

	:Menu: :menuselection:`File --> Export --> Image…`

Export Image saves a picture of the posed model as a PNG image.  The picture is drawn by the viewport renderer, so it shows the model as the 2D Viewport does: the current pose, with the blend modes, masks, and colors, and only the drawables that are shown.

The dialog asks for a region, a scale, and a background, and shows the size that they make.  Confirm it, and the file picker asks where to put the PNG file.

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: The Export Image dialog with the Region, Scale, and Background sections, a size readout such as ``1024 × 1536 px``, and the Cancel and Export buttons.
	:Setup: Open a posed model, point at the 2D Viewport, and choose File → Export → Image….
	:Crop: The dialog only.
	:Save as: ``images/files/export_image.png``
	:Caption: The Export Image dialog.

Region
------

.. list-table::
	:header-rows: 1

	* - Region
	  - What the picture frames
	* - :guilabel:`Viewport`
	  - Exactly what a 2D Viewport shows, with the same pan and zoom.  At a scale of 100% it is the viewport, pixel for pixel.  It is only offered when a 2D Viewport is available to frame.
	* - :guilabel:`Canvas`
	  - The canvas of the document.  It is only offered when the document has a canvas.
	* - :guilabel:`Visible Content`
	  - The drawables that are shown, at the current pose, cropped tightly around them.  This is the default.

Scale
-----

The scale is a percentage from 1 to 1600.  For :guilabel:`Viewport`, 100% is the size of the viewport on screen.  For :guilabel:`Canvas` and :guilabel:`Visible Content`, 100% is one pixel for each unit of the canvas.  The picture is rounded up to whole pixels.

The dialog shows the result as ``width × height px``.  No edge may be longer than 16384 pixels.  When one would be, the dialog says ``is past the 16384 px limit`` in place of the size, and :guilabel:`Export` is disabled.  It is also disabled when there is nothing to frame, and the dialog says ``Nothing is visible to capture.``

Background
----------

:guilabel:`Transparent`
	Every pixel that the model does not cover is fully transparent.  This is the default.

:guilabel:`Solid Color`
	A flat color, set in the :guilabel:`Color` field as a hexadecimal color.  It may have an alpha value, so the background can be translucent.  The color is kept while you choose another background.

:guilabel:`Viewport Grid`
	The grid and the world axes, as the viewport shows them.  See :doc:`/editors/viewport_2d/overlays`.

Umamo remembers the choices until you quit, for every document.

Export Reports and Failures
===========================

When a CMO3 or a MOC3 has been written and there is something it could not carry, an alert opens with the export report.  The file has been written already.  The report says what is missing from it, and reading it is the way to know whether the file does what you need.  See :doc:`/files/export_notices`.

An export that fails shows ``Could not export`` with the name of the file and the reason.  The open document is not affected.

* If the reason is a message from the system, such as a full disk or a folder that cannot be written to, fix that and export again.
* If there was not enough memory, the alert says that Umamo ran out of memory.  When you run the ``.jar`` build, it also gives the command that lets Umamo use half of your memory.  Save your document first, quit, and start Umamo with it.  See :doc:`/troubleshooting/performance_and_memory`.
* An image can fail on its own with ``The viewport renderer could not draw the image.``, or with ``There was not enough memory for a`` and a size in pixels, in which case you should use a smaller scale.
* ``Something unexpected stopped it; the details are in the log.``  Open :doc:`/editors/logs`, and include it if you report the problem.  See :doc:`/troubleshooting/reporting_bugs`.

.. seealso::

	* :doc:`/files/cubism_interchange`
	* :doc:`/files/export_notices`
	* :doc:`/files/runtime_targets`
	* :doc:`/interface/menus`
	* :doc:`/command_line/convert`
