*******
Artwork
*******

A Umamo model starts as artwork.  You paint the character in a layered file, add the file to a document, and Umamo makes a drawable for each layer, a mesh for each drawable, and a texture atlas that holds the pictures.  This chapter is about that path: how artwork gets into a document, how it is kept in step while the artist keeps painting, and how the pictures are laid out for the end.

.. toctree::
	:maxdepth: 1

	supported_formats
	importing
	relinking_and_reloading
	source_watcher
	atlas_packing

The Source-Art Workflow
=======================

The steps of working with source art, with the page that describes each:

#. **Add the artwork.**  Use :menuselection:`File --> Import --> Artwork…` on a new document.  Each layer becomes a drawable with a first mesh, each folder becomes a part, and the first file sets the canvas.  See :doc:`/artwork/importing`.
#. **Rig the model.**  Edit the meshes, build deformers, key the parameters.  That work is what the rest of this manual is about, and it is never thrown away by what follows.  See :doc:`/rigging/index`.
#. **Keep painting.**  The artist saves the file.  Umamo notices, and either reloads by itself or tells you.  See :doc:`/artwork/source_watcher`.
#. **Reload and relink.**  Changed layers are updated in place, new layers are added, and a layer that cannot be matched is flagged for you to decide.  See :doc:`/artwork/relinking_and_reloading`.
#. **Pack the atlas.**  The art is laid out on texture pages, once at the start and again when you ask.  See :doc:`/artwork/atlas_packing`.
#. **Export.**  The pages and the layers go into the files you hand on.  See :doc:`/files/exporting`.

You can come back to any step at any time.  The files are not stored in the document: it keeps their paths, and it keeps the pixels of every piece of art.  See :doc:`/files/uma`.

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: The Texture workspace with a model made from artwork: the UV Editor showing an atlas page, the 2D Viewport, and the column of the Sources editor with a file open to its layers, the Outliner, and the Properties editor.
	:Setup: Add a layered file with several folders to a new document, switch to the Texture workspace, and select a drawable.
	:Crop: The whole window.
	:Save as: ``images/artwork/workflow.png``
	:Caption: A model made from artwork, in the Texture workspace.

Which Editors Are Involved
==========================

:doc:`/editors/sources`
	The table of files, layers, pieces of art, and drawables.  It has the buttons to import, to reload, and to match, and the menus to relink and ignore.  It is the main place for everything in this chapter.

:doc:`/editors/uv_editor/index`
	Shows the atlas pages and the source layers, and lets you place and pin art on a page.

:doc:`/editors/properties/document_tab`
	Has the :guilabel:`Show source artwork` setting, which chooses whether the viewports draw the model from the layers or from the pages.

:doc:`/editors/outliner`
	Lists the parts and drawables that the import made.

:doc:`/interface/operation_strip`
	Offers the settings of an import, a reload, a match, and a repack after they have run.

:doc:`/interface/settings`
	The :guilabel:`Import` category has the parameter template, the initial mesh, the alignment of added files, and the watch mode.

Document Types That Can Take Artwork
====================================

Artwork is added to the document that is open.  Whether it can be added depends on where the document came from:

.. list-table::
	:header-rows: 1

	* - Document
	  - Artwork
	* - A new document
	  - Yes.  The first file sets the canvas and gives the document its starter parameters.
	* - A UMA file made from artwork
	  - Yes.  The artwork files it lists can be reloaded, if they are still where it recorded them.
	* - A CMO3 import
	  - Yes, when its drawables are all drawn from artwork.  The layers inside the CMO3 stand in for the artwork files when those are not found.  See :doc:`/files/cubism_interchange`.
	* - A MOC3 import
	  - No.  Its drawables are drawn from baked pages, and adding artwork would replace them.  A notice says so.  Export it as a CMO3, import that file, and add the artwork there.

.. seealso::

	* :doc:`/editors/sources`
	* :doc:`/editors/uv_editor/index`
	* :doc:`/modeling/generate_mesh`
