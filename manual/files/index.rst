*****
Files
*****

Umamo works with several kinds of files, and each kind has its own way in.  Umamo's own document is the UMA file, which you open and save.  The Live2D Cubism formats, CMO3 and MOC3, are imported and exported, so that a Cubism file is never changed by accident.  Layered artwork is added to the document that is open.

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

Open and Save mean UMA and nothing else.  A UMA file is Umamo's own format, and it keeps everything Umamo knows about the model.

CMO3 and MOC3 are interchange formats.  They belong to Live2D Cubism, and Umamo does not model everything that they can hold.  Importing a CMO3 or a MOC3 makes a new Umamo document from the file and leaves the file as it was.  Exporting writes a new file from the open document, and leaves the open document as it was.  An export does not count as a save.

A typical session goes like this:

#. Import a CMO3 or a MOC3, or start a new document and add artwork to it.
#. Work on the model, and use :menuselection:`File --> Save As…` to save it as a UMA file.  Save again as you go.
#. Export a CMO3 for the Cubism Editor, or a MOC3 for the application that plays the model.

.. warning::

	Umamo does not save your documents automatically.  Keep your original files, and make copies of a UMA file before you try something drastic.  See :doc:`/troubleshooting/backups_and_data_safety`.

.. seealso::

	* :doc:`/files/uma`
	* :doc:`/files/cubism_interchange`
	* :doc:`/files/format_support`
