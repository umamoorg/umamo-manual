**************
Format Support
**************

This page lists the file formats that Umamo reads and writes, how it tells them apart, and the differences between platforms.

Support Table
=============

.. list-table::
	:header-rows: 1

	* - Format
	  - Read
	  - Write
	  - Notes
	* - UMA (``.uma``)
	  - Yes, with :menuselection:`File --> Open…`
	  - Yes, with :menuselection:`File --> Save`
	  - Umamo's native document.  See :doc:`/files/uma`.
	* - CMO3 (``.cmo3``)
	  - Yes, with :menuselection:`File --> Import --> CMO3…`
	  - Yes, with :menuselection:`File --> Export --> CMO3…`
	  - The Cubism Editor project.  Tested with Cubism Editor 4.2 to 5.4.
	* - MOC3 (``.moc3``)
	  - Yes, with :menuselection:`File --> Import --> MOC3…`
	  - Yes, with :menuselection:`File --> Export --> MOC3…`
	  - The baked runtime model, versions 1 to 6.  It needs its ``.model3.json`` file and its textures beside it.
	* - MOC3 sidecar files (``.model3.json``, ``.cdi3.json``, ``.physics3.json``, ``.pose3.json``, ``.exp3.json``, ``.motion3.json``, ``.userdata3.json``)
	  - With the MOC3 that lists them
	  - With the MOC3 that lists them
	  - Never opened on their own.  See :doc:`/files/cubism_interchange`.
	* - PSD (``.psd``)
	  - Yes, as artwork
	  - —
	  - Photoshop.
	* - CLIP (``.clip``)
	  - Partial, as artwork
	  - —
	  - Clip Studio Paint.  Implemented, but not fully tested, and it has known blending issues.
	* - KRA (``.kra``)
	  - Yes, as artwork
	  - —
	  - Krita.
	* - PNG (``.png``)
	  - Yes, as artwork
	  - Yes, with :menuselection:`File --> Export --> Image…`
	  - Also the format of the texture pages that a MOC3 export writes.
	* - BMP, JPEG, WebP, and TIFF (``.bmp``, ``.jpg`` and ``.jpeg``, ``.webp``, ``.tif`` and ``.tiff``)
	  - Yes, as artwork
	  - —
	  - A flat image is read as artwork with one layer.

Artwork is added to the open document with :menuselection:`File --> Import --> Artwork…`.  See :doc:`/artwork/supported_formats` for how each artwork format is read.

The file pickers only offer the files that their command can use:

.. list-table::
	:header-rows: 1

	* - Command
	  - Files offered
	* - :menuselection:`File --> Open…`
	  - ``.uma``
	* - :menuselection:`File --> Import --> CMO3…`
	  - ``.cmo3``
	* - :menuselection:`File --> Import --> MOC3…`
	  - ``.moc3``
	* - :menuselection:`File --> Import --> Artwork…`
	  - ``.psd``, ``.clip``, ``.kra``, ``.png``, ``.bmp``, ``.jpg``, ``.jpeg``, ``.webp``, ``.tif``, and ``.tiff``

Detection
=========

Umamo recognizes a file by what is inside it before it looks at the name.  Every format starts with a signature of its own, so a file with the wrong extension still opens as what it really is.  A UMA and a KRA are both ZIP archives, and each is told apart by the marker it keeps at the start, so neither is mistaken for the other.

When the contents match no format, Umamo goes by the extension.  It is there for formats where a tool may have removed the marker, such as a KRA.  Extensions are matched without regard to case.  A file that matches neither is reported with ``is not a file format Umamo recognizes``.

Dragging files onto the window chooses the way in from the extension of the first file alone: artwork is added, and anything else is opened.  The real format is then found from the contents.  See :doc:`/files/uma`.

The command line tool recognizes files in the same way, and reads the same formats.  See :doc:`/command_line/index`.

Platform Notes
==============

* Windows, macOS, and Linux read and write every format in the table.
* The ``.uma`` file type is registered by the installers.  See :doc:`/getting_started/installing`.
* A MOC3 is a group of files, so reading or writing one needs a folder that Umamo can see into.  Android gives an application only the single file that was picked, so a MOC3 cannot be imported there yet, and a MOC3 export writes the ``.moc3`` file alone.
* Large models and large artwork files take much memory to read and to export.  See :doc:`/troubleshooting/performance_and_memory`.

If you need a format or a newer version that is not supported, open an issue.  See :doc:`/troubleshooting/reporting_bugs`.

.. seealso::

	* :doc:`/files/uma`
	* :doc:`/artwork/supported_formats`
	* :doc:`/command_line/index`
