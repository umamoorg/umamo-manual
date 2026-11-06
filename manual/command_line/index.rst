************
Command Line
************

Umamo comes with a headless command line tool for reading model and artwork files without opening the editor.  It can print a file's contents, unpack a CMO3 archive, convert between the Cubism formats (CMO3 to MOC3 and vice versa), compare two models, pack artwork layers into texture atlas pages, and run the art mesher over a layer.

The tool uses the same readers, writers, and conversion code as the editor and has access to the same data.  It is ideal for previewing and debugging, especially when a file imports or converts in a way you did not expect.

.. toctree::
	:maxdepth: 1

	dump
	extract
	convert
	diff
	atlas
	mesh

Commands
========

.. list-table::
	:header-rows: 1

	* - Command
	  - What it does
	  - Takes
	* - :doc:`dump`
	  - Prints a file's contents.
	  - CMO3, MOC3, artwork
	* - :doc:`extract`
	  - Unpacks a CMO3 archive into loose files.
	  - CMO3
	* - :doc:`convert`
	  - Converts a model to another format, or saves it again.
	  - CMO3, MOC3
	* - :doc:`diff`
	  - Compares two models.
	  - CMO3, MOC3
	* - :doc:`atlas`
	  - Packs the layers of an artwork file into texture atlas pages.
	  - Artwork
	* - :doc:`mesh`
	  - Runs the art mesher over the layers of an artwork file.
	  - Artwork

Running the Tool
================

The tool is part of Umamo's source code.  It is not included in the downloads on the `Releases page <https://github.com/umamoorg/umamo/releases>`__.  To use it you need a copy of the `source code <https://github.com/umamoorg/umamo>`__ and JDK 21.  The README in the source code repository has details on how to set it up.

You should run it with the Gradle wrapper in the root of the source code, and pass the command and its arguments in a single ``--args`` value:

.. code-block:: bash

	./gradlew -q :cli:run --args="dump model.moc3"

On Windows, use ``gradlew.bat`` in place of ``./gradlew``.

* Always pass ``-q``.  Without it Gradle prints its own build messages before and after the tool's output.
* Relative file paths are resolved against the root of the source code, not against the folder you run the command from.
* Arguments are separated by spaces.  Put a path or a layer name that contains spaces inside single or double quotes within the ``--args`` value, such as ``--args="dump 'My Model.cmo3'"``.
* ``--args="help"`` prints the list of commands and their options.

Conventions
===========

Output
------

The tool writes its results to standard output and everything else(notes, warnings, notices, and error messages) to standard error.  You can redirect the standard output to capture only the results:

.. code-block:: bash

	./gradlew -q :cli:run --args="dump model.cmo3 --xml" > main.xml

Options
-------

An option that takes a value is written ``--name=value``, with no spaces around the ``=``.  A flag is written ``--name`` and takes no value.  Every other argument is a file or folder.

Output Folders
--------------

``extract``, ``atlas``, and ``mesh`` write into a new folder that is named after the input file, without its extension.  ``mesh`` adds ``-mesh`` to the name, so that its files never mix with ``atlas`` output for the same file.  The new folder is created in the folder that you give as the last argument or beside the input file when you do not give one.

If the folder already exists, the tool overwrites files in the folder with the same names.  ``convert`` writes exactly to the destination and does not ask before replacing a file.

Exit Codes
----------

.. list-table::
	:header-rows: 1

	* - Code
	  - Meaning
	* - 0
	  - The command succeeded.
	* - 1
	  - The command failed.  An unexpected error prints ``error:`` and its message.  ``atlas`` and ``mesh`` also use this code for the two failures described on their pages.
	* - 2
	  - The command was used incorrectly: The arguments or options were wrong, a file does not exist, an unsupported as passed, or no command was given.

When you run the tool through Gradle, Gradle turns any non-zero exit code into a failed build.  The exit status of ``./gradlew`` is then 1 for both of the tool's failure codes, and the tool's own code appears in Gradle's message, such as ``finished with non-zero exit value 2``.

Accepted Inputs
===============

The tool recognizes a file by its contents first and falls back to the file extension when it cannot detect the contents.

.. list-table::
	:header-rows: 1

	* - Input
	  - dump
	  - extract
	  - convert
	  - diff
	  - atlas
	  - mesh
	* - CMO3
	  - Yes
	  - Yes
	  - Yes
	  - Yes
	  - —
	  - —
	* - MOC3, or its ``.model3.json``
	  - Yes
	  - —
	  - Yes
	  - Yes
	  - —
	  - —
	* - PSD, CLIP, or KRA
	  - Yes
	  - —
	  - —
	  - —
	  - Yes
	  - Yes
	* - PNG, BMP, JPEG, WebP, or TIFF
	  - Yes
	  - —
	  - —
	  - —
	  - Yes
	  - Yes

A flat image is treated as a layered artwork file with a single layer.

MOC3 Files
----------

A ``.moc3`` file is only part of a model.  When you give the tool a ``.moc3`` file, it looks for the associated JSON sidecar files:

#. The ``.model3.json`` manifest with the same name.  If there is none, any ``.model3.json`` in the same folder whose ``Moc`` entry names the file.
#. The display information, ``.cdi3.json``, which holds the names, the parameter groups, and the linked parameters.  It is located from the manifest ``DisplayInfo`` entry; otherwise, a ``.cdi3.json`` with the same name beside the ``.moc3`` is used.
#. The textures, physics, pose, and user data files listed in the manifest.

You can also give the ``.model3.json`` manifest itself.  The tool then finds the ``.moc3`` file through the manifest, and stops with a usage error if the file is missing.

Without a readable ``.cdi3.json`` a model imports without its display names, parameter groups, and linked parameters.

.. seealso::

	* :doc:`/files/format_support`
	* :doc:`/files/cubism_interchange`
