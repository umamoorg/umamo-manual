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
	  - Yes, as artwork
	  - —
	  - Clip Studio Paint.
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

Each file picker operation is filtered to only show the files that it supports:

.. list-table::
	:header-rows: 1

	* - Command
	  - Files Offered
	* - :menuselection:`File --> Open…`
	  - ``.uma``
	* - :menuselection:`File --> Import --> CMO3…`
	  - ``.cmo3``
	* - :menuselection:`File --> Import --> MOC3…`
	  - ``.moc3``
	* - :menuselection:`File --> Import --> Artwork…`
	  - ``.psd``, ``.clip``, ``.kra``, ``.png``, ``.bmp``, ``.jpg``, ``.jpeg``, ``.webp``, ``.tif``, and ``.tiff``

Platform Notes
==============

* Windows, macOS, and Linux read and write every format in the table.
* The ``.uma`` file type is registered by the installers.  See :doc:`/getting_started/installing`.
* A MOC3 is a group of files, so reading or writing one needs access to the whole folder.  Android and iPadOS only gives the application the single file that was picked so MOC3 import and export is not supported on mobile platforms.
* Large models and large artwork files use a lot of memory to read and export.  See :doc:`/troubleshooting/performance_and_memory`.

If you need a format or a newer version that is not supported, open an issue.  See :doc:`/troubleshooting/reporting_bugs`.

.. seealso::

	* :doc:`/files/uma`
	* :doc:`/artwork/supported_formats`
	* :doc:`/command_line/index`
