*******
extract
*******

``extract`` unpacks a CMO3 file into loose files: the model document, ``main.xml``, as plain text, and every image that is embedded in the archive.  Use it to read the document in a text editor or to view the layer images.

Synopsis
========

.. code-block:: text

	extract <file> [<directory>]

``file`` must be a CMO3 file.  ``extract`` takes no options.  For example:

.. code-block:: bash

	./gradlew -q :cli:run --args="extract Model.cmo3 work/"

Output
======

``extract`` creates a new folder that is named after the model, without the ``.cmo3`` extension, inside ``directory``.  Without a ``directory`` it is created beside the CMO3 file.  The command above writes into ``work/Model/``.

Each entry of the archive becomes a file with the same name.  ``main.xml`` is written unpacked and readable.  The embedded layer images are written as PNG files.  If the archive holds a preview image, it is written as ``preview.png``.

The command prints a line for each file, and a summary:

.. code-block:: text

	Extracted work/Model/image.png (96 bytes)
	Extracted work/Model/image_0.png (83 bytes)
	Extracted work/Model/main.xml (70914 bytes)
	Extracted 3 entries into work/Model

An entry without a name is written as ``entry_`` followed by its number.  When two entries have the same name, the second one is written as ``entry_``, its number, an underscore, and then the name.  If an archive entry is already called ``preview.png``, the preview image is skipped.

Safety
======

``extract`` always creates its own folder, so it never mixes its files into a folder that already holds other files.  If the folder is already there, the command prints a note and writes into it anyway.  It replaces files that have the same names and leaves the others.

The names inside an archive are data from the file and are not trusted.  If an entry would be written outside of the new folder, for example with a name that climbs out of it with ``..``, ``extract`` stops with an error and does not write it.

``extract`` stops with a usage error for a file that is not a CMO3 file.

.. seealso::

	* :doc:`/command_line/dump`
	* :doc:`/command_line/convert`
