*******
Editors
*******

An editor is what an area of the window shows.  Umamo has ten of them, and every area can be switched to any of them, so you build the layout that suits the work.  This chapter describes each editor on its own: what it shows, what its controls do, and what you can change with it.  How areas are made, split, and joined is in :doc:`/interface/window_system`, and the layouts that come with Umamo are in :doc:`/interface/workspaces`.

.. toctree::
	:maxdepth: 1

	viewport_2d/index
	outliner
	properties/index
	parameters
	keyform_sheet
	uv_editor/index
	sources
	tool_settings
	history
	logs

Areas and Editor Types
======================

The dropdown at the left end of the header of an area switches it to another editor.  The same editor can be in several areas at once, each with its own view.  The editors are used for these jobs:

.. list-table::
	:header-rows: 1

	* - To
	  - Use
	* - Select, move, and shape the model, and key a pose
	  - :doc:`/editors/viewport_2d/index`
	* - Find an object by name, hide it, rename it, or move it to another parent
	  - :doc:`/editors/outliner`
	* - Type an exact value, bind an object to a parent, or choose a blend mode
	  - :doc:`/editors/properties/index`
	* - Pose the model, and add, arrange, and range the parameters
	  - :doc:`/editors/parameters`
	* - See, select, and move the keys of a parameter
	  - :doc:`/editors/keyform_sheet`
	* - Fit a mesh to its texture, and place the art on its atlas page
	  - :doc:`/editors/uv_editor/index`
	* - See which artwork files the model came from, and repair a broken link
	  - :doc:`/editors/sources`
	* - Look through the undo steps, and go back to one
	  - :doc:`/editors/history`
	* - Read what Umamo has written while it ran
	  - :doc:`/editors/logs`
	* - Set the options of the tool in use
	  - :doc:`/editors/tool_settings`, which is not built yet.  The settings of an operation are in the operation strip today.

The 2D Viewport and the UV Editor are the **work surfaces**: they draw the model, take the pointer for selecting and transforming, and show the operation strip.  The others are panels that read from the model and write to it through their fields and lists, and all of them show the same model and the same selection.  Select something in one, and it is selected in the others.

The Area Header
===============

Every area has a header.  At its left end is the editor type, and after it come the controls of that editor.  Most headers follow the same plan:

* **Controls that make or change something** come first, such as :guilabel:`Add Parameter`, and :guilabel:`Import Artwork…`.
* A **search field** is in the middle of the headers of the Outliner, the Properties editor, the Parameters editor, and the Sources editor.
* **Filters and view controls** are at the right end.
* The 2D Viewport and the UV Editor share their edit controls: the select mode, the pivot point, snapping, proportional editing, and the overlays.  The state behind the select mode, the pivot, and proportional editing belongs to the session, so changing one in a viewport changes it in the UV Editor too.

The controls of most editors are not shown until a document is open.  When a header is too narrow, the controls that do not fit move into a menu at the end of the header, and the editor type never moves.  A right-click on the header opens the menu of the area, with the layout commands.  See :doc:`/interface/window_system`.

Default Workspaces
==================

Umamo opens in the Modelling workspace, which has the editors that you need to build and key a rig.  The other workspaces are for textures and for physics.

.. list-table::
	:header-rows: 1

	* - Workspace
	  - Editors
	* - Modelling
	  - :doc:`/editors/parameters` on the left, :doc:`/editors/viewport_2d/index` in the middle above the :doc:`/editors/keyform_sheet`, and the :doc:`/editors/outliner` above :doc:`/editors/properties/index` on the right
	* - Texture
	  - Two :doc:`/editors/uv_editor/index` on the left, the 2D Viewport in the middle, and a column of :doc:`/editors/sources`, the Outliner, and Properties on the right
	* - Physics
	  - A single 2D Viewport.  The physics tools are not built yet.

:doc:`/editors/history` and :doc:`/editors/logs` are in no default workspace.  Switch any area to them when you need them, then switch back.  See :doc:`/interface/workspaces`.

View State Saved with the Document
==================================

The state of an editor belongs to its area, and it is saved with the document, so a file reopens with the layout of panels as you left it.  See :doc:`/files/uma`.

.. list-table::
	:header-rows: 1

	* - Editor
	  - What is saved
	* - 2D Viewport
	  - The pan and zoom, the overlays, the toolbar, and the sidebar
	* - UV Editor
	  - The picture it shows, the overlays, and the sidebar
	* - Outliner
	  - The branches that are open, the kinds of rows that are listed, and the columns that are shown
	* - Properties
	  - The tab, the sections that are folded, and the height of the Masked By list
	* - Parameters
	  - The groups that are open, the range editors that are open, and the filter for the selection
	* - Keyform Sheet
	  - The owners that are open, the parameters that are folded, the filters, the part of the range that is in view, and the width of the names
	* - Sources
	  - The rows that are open, and the kinds of rows that are listed

The **text of a search**, a name being edited, and the proportional size of the UV Editor are not saved, because a file that reopened with last week's search typed in would look broken.  The History and Logs editors have nothing to save.  Which keys are selected in the Keyform Sheet is kept by the session, not by the area, and Undo takes a change of it back.

Commands Act on the Area Under the Pointer
==========================================

The shortcuts and the commands of the command palette go to the area that the pointer touched last.  The same key can mean a different thing in each editor:

* :kbd:`Home` frames everything: the model in a viewport, the page in a UV Editor, and the keys in a Keyform Sheet.
* :kbd:`B` arms a box select in a viewport, in a UV Editor in Edit Mode, and in a Keyform Sheet.
* :kbd:`I` makes a key at a spot of a track in the Keyform Sheet, and on a field in the Properties editor.
* :kbd:`N` opens the sidebar of the viewport or the UV Editor under the pointer.
* :kbd:`P` and :kbd:`Alt-P` pin and unpin art, and they work only over a UV Editor.

Commands that belong to one editor do nothing when they are used over another.  See :doc:`/interface/window_system`, :doc:`/interface/command_palette`, and :doc:`/interface/keymap`.

Search Fields and Filter Popups
===============================

The search fields and the filter popups of the editors work in the same way.

* A search matches part of a name, and ignores upper and lower case.  The Parameters editor matches the ID of a parameter as well, and the Properties editor matches the labels of its fields.
* While a search is on, every branch, group, and section is open, so a match is never hidden in a closed one, and the arrows do nothing until you clear the field.
* A filter button opens a popup that stays open while you tick its boxes.  Its glyph changes while a filter is on.
* The Outliner, the Parameters editor, the Keyform Sheet, and the Sources editor have a filter button.  The Outliner's has the kinds of rows and the columns, the Parameters editor's has the selection filter, the Keyform Sheet's has the kinds of tracks, and the Sources editor's has the kinds of rows.

.. seealso::

	* :doc:`/interface/window_system`
	* :doc:`/interface/workspaces`
	* :doc:`/interface/keymap`
