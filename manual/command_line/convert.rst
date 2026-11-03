*******
convert
*******

``convert`` converts a model from one Cubism format to another, or reads a model and writes it again in the same format.

Synopsis
========

.. code-block:: text

	convert <in> <out>

``in`` is a CMO3 file, a MOC3 file, or a ``.model3.json`` manifest.  ``out`` is the file to write.  ``convert`` takes no options.  For example:

.. code-block:: bash

	./gradlew -q :cli:run --args="convert model.cmo3 out/model.moc3"

Folders that ``out`` needs are created.

Direction Matrix
================

The direction comes from the kind of the input file and the extension of ``out``.

.. list-table::
	:header-rows: 1

	* - From
	  - To
	  - What happens
	* - CMO3
	  - ``.cmo3``
	  - A resave.  A model that has not been edited writes its ``main.xml`` out byte for byte as it was read.  Only the archive around it is written afresh.
	* - MOC3
	  - ``.moc3``
	  - A rebake.  The model is written again from scratch and is not byte for byte the same as the source, by design.  Only the ``.moc3`` file is written.
	* - CMO3
	  - ``.moc3``
	  - The whole MOC3 family, as described below.
	* - MOC3
	  - ``.cmo3``
	  - A new CMO3 is built from the model and its texture pages.  The Cubism Editor can open it.

Any other pair is a usage error, and so is a file that is not a model.

CMO3 to MOC3
------------

The command writes a MOC3 model with its other files, in the folder of ``out``.  When ``out`` is ``Model.moc3``, they are:

.. list-table::
	:header-rows: 1

	* - File
	  - Contents
	* - ``Model.moc3``
	  - The model.
	* - ``Model.model3.json``
	  - The manifest.
	* - ``Model.cdi3.json``
	  - The display information: names, parameter groups, and linked parameters.
	* - ``Model.4096/texture_00.png``
	  - One file for each texture page, in a folder named after the width of the page.

The command prints a line for each file that it writes.  A texture page that cannot be decoded is left out, and the conversion goes on without it.

MOC3 to CMO3
------------

The texture pages are the ones that the manifest lists.  Without a manifest next to the MOC3 file, or with a page that is missing on disk, the command warns and goes on, so the CMO3 has fewer textures or none.

The MOC3 file holds only the packed texture pages and not the artwork they were made from.  The CMO3 is built around a stand-in for the artwork, whose layers are slices of those pages.  Because of that the command always reports a ``no source artwork`` notice.  The file opens and renders in the Cubism Editor, but its layers are not the original layers.  Reloading the original layered artwork into the model replaces them.

Overwrites Without Confirmation
===============================

.. warning::

	``convert`` replaces the output files without asking.  This includes ``out`` and, for a conversion to MOC3, every other file of the family.  Check the destination before you run it.

Notices and Warnings
====================

A conversion to a format that cannot hold everything that the model holds is reported as a list of notices, printed to standard error.  They are advisory.  A notice never makes the command fail, so the exit code is still 0.

.. code-block:: text

	Export notices (2):
	  no source artwork: the CMO3 was built around a stand-in document rebuilt from 1 atlas page(s), so its layers are atlas slices rather than the original artwork
	  [Part] PartHairBack: CompositeStaticsShadowedByKeyforms

Each line is the one that Umamo's own log shows for the notice, so a report reads the same whichever tool wrote the file.  See :doc:`/files/export_notices`.

A MOC3 file without a ``.cdi3.json`` produces the same warning as ``dump --puppet`` does.

Differences from the App Export
===============================

``convert`` uses the same conversion as :menuselection:`File --> Export`, but it makes its own choices where the export dialog asks you:

* ``convert`` keeps hidden parts and hidden drawables.  The export dialog drops them unless you tick the options for them.
* Guide image parts are dropped, as they are by default in the dialog.
* There is no way to leave out the display information or choose the scale.  The scale is taken from the model.
* A MOC3 rebake writes only the ``.moc3`` file.  The app writes the whole family, and it carries the model's physics, pose, user data, expression, and motion files along.
* The folder of texture pages is named after each page's own width.  The app names it after the largest dimension of any page, so the two names differ only for pages that are not square or not all the same size.

.. seealso::

	* :doc:`/files/cubism_interchange`
	* :doc:`/files/exporting`
	* :doc:`/command_line/diff`
