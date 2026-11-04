*****
Files
*****

Umamo works with several different types of files and has interoperability with Live2D Cubism formats.  Umamo's own native document format is the UMA file type, which is used for opening and saving.  Live2D Cubism formats, CMO3 and MOC3, are also supported for import and export interchange to remain compatible with the existing Live2D ecosystem.  Layered artwork from PSD, CLIP, and KRA formats can also be added to new and existing documents.

.. toctree::
	:maxdepth: 1

	uma
	cubism_interchange
	runtime_targets
	exporting
	export_notices
	format_support

Native and Interchange Formats
==============================

.. list-table::
	:header-rows: 1

	* - To do this
	  - Use
	  - Read
	* - Keep working on a model in Umamo.
	  - :menuselection:`File --> New`, :menuselection:`File --> Open…`, :menuselection:`File --> Save`, and :menuselection:`File --> Save As…`
	  - :doc:`uma`
	* - Bring in a model made in Cubism.
	  - :menuselection:`File --> Import --> CMO3…` or :menuselection:`File --> Import --> MOC3…`
	  - :doc:`cubism_interchange`
	* - Send a model to the Cubism Editor, or to an application that plays it.
	  - :menuselection:`File --> Export --> CMO3…` or :menuselection:`File --> Export --> MOC3…`
	  - :doc:`exporting`
	* - Add layered artwork to the open document.
	  - :menuselection:`File --> Import --> Artwork…`
	  - :doc:`/artwork/importing`
	* - Save a picture of the posed model.
	  - :menuselection:`File --> Export --> Image…`
	  - :doc:`exporting`
	* - Find out which formats Umamo reads and writes.
	  -
	  - :doc:`format_support`

Open and Save refer to the UMA format and nothing else.  An UMA file is Umamo's own format and is recommended for working on puppets in Umamo.

CMO3 and MOC3 are interchange formats created by the Live2D company.  They can be imported to create a new Umamo document from the file.  Umamo does not save directly into Live2D formats and requires exporting to them.  Note that exporting a file does not save the currently open Umamo document.

A typical session goes like this:

#. Create a new document and add artwork to it, or import a CMO3 or MOC3.
#. Work on the model, and use :menuselection:`File --> Save As…` to save it as an UMA file.
#. Export a CMO3 for the Cubism Editor or a MOC3 for an application runtime.

.. warning::

	Umamo does not save your documents automatically.  Keep your original files, and make copies of an UMA file before you try something drastic.  See :doc:`/troubleshooting/backups_and_data_safety`.

.. seealso::

	* :doc:`/files/uma`
	* :doc:`/files/cubism_interchange`
	* :doc:`/files/format_support`
