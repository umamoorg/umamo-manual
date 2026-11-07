********
Settings
********

The Settings window holds the global editor settings and not specific to a puppet file: the language and the theme, how the viewport draws, how artwork comes in, and your shortcuts.  Some other programs, and older notes about Umamo, call it Preferences.

Opening Settings
================

Choose :menuselection:`Edit --> Settings…`, or press :kbd:`Ctrl-Comma`.  It is in the command palette as :guilabel:`Settings`.

The window opens over the Umamo window.  The categories are in a list on the left, and the settings of the chosen one are on the right.  There is no :guilabel:`OK` or :guilabel:`Apply`: every change takes effect and is saved as you make it, so the language, the theme, and the colors change behind the window while you work in it.  Close it with the button at its top right, with :kbd:`Escape`, or by clicking outside it.

The settings are saved in a file in your user folder.  See :doc:`/getting_started/configuration`.  Nothing in this window changes a puppet file.

Interface
=========

.. list-table::
	:header-rows: 1

	* - Setting
	  - What it does
	* - :guilabel:`Theme`
	  - :guilabel:`Dark`, :guilabel:`Light`, or :guilabel:`System`, which follows your operating system.  The default is dark.
	* - :guilabel:`Language`
	  - The language of the interface: English, 日本語, 한국어, or Français.  Umamo picks one at the first start from your system's languages.  See :doc:`/about/contribute/translations`.
	* - :guilabel:`History Steps`
	  - How many undo steps are kept, from 1 to 1000.  The default is 200.  Lowering it trims the history of the open puppet file, but never the current step or the steps you can redo.  See :doc:`/editors/history`.
	* - :guilabel:`Check for updates when Umamo starts`
	  - Whether Umamo asks once a day if a newer version is out.  See :doc:`/getting_started/updating`.

Colors
======

The colors that Umamo draws over your art.  They are your colors, and not a part of the theme, because no theme can know what reads well against a piece of art.  Each is a hexadecimal color written ``#AARRGGBB``: the opacity, then red, green, and blue.  An edit recolors the viewport as you type.

Viewport
--------

.. list-table::
	:header-rows: 1

	* - Setting
	  - Default
	  - Used for
	* - :guilabel:`Selection Highlight`
	  - ``#FF338CFF``
	  - The tint over the objects that are selected.
	* - :guilabel:`Active Selection Highlight`
	  - ``#FF7DE400``
	  - The same, for the active object.
	* - :guilabel:`Warning`
	  - ``#FFFF5A5A``
	  - A warning in the viewport, such as art that overlaps another tile.
	* - :guilabel:`Pinned Placement`
	  - ``#FFB266FF``
	  - Art that is pinned to its place on an atlas page.

Mesh Editing
------------

The elements of a mesh in Edit Mode, in three groups, :guilabel:`Vertex`, :guilabel:`Edge`, and :guilabel:`Face`, each with four colors:

:guilabel:`Idle`
	An element that is not selected.

:guilabel:`Selected`
	An element that is selected.

:guilabel:`Active`
	The element you selected last.

:guilabel:`Off-key`
	An element while the pose is between keys, when it can only be looked at.

Deformers
---------

The lattice of a warp deformer, by role: :guilabel:`Idle`, :guilabel:`Selected`, :guilabel:`Active`, :guilabel:`Unkeyed` for a lattice with edits that are not keyed yet, and :guilabel:`Hovered` for the lattice under the pointer.  The selected and active colors start the same as the selection highlights, so a selected warp reads as selected art does.

Viewport
========

.. list-table::
	:header-rows: 1

	* - Setting
	  - Default
	  - What it does
	* - :guilabel:`Zoom Step (%)`
	  - 1
	  - How much each notch of the mouse wheel zooms, from 0.1 to 100 percent.
	* - :guilabel:`Coarse Zoom Step (%)`
	  - 5
	  - The same, while :kbd:`Shift` is held, and for the larger zoom commands.
	* - :guilabel:`Grid Scale`
	  - 100
	  - The distance between the major lines of the grid in the 2D Viewport, in world units, from 1 to 100000.
	* - :guilabel:`Grid Subdivisions`
	  - 10
	  - How many cells each major cell of that grid is divided into, from 1 to 100.
	* - :guilabel:`UV Grid Scale`
	  - 256
	  - The same, for the grid of the UV Editor, in texels.
	* - :guilabel:`UV Grid Subdivisions`
	  - 8
	  - The same, for the UV Editor's cells.
	* - :guilabel:`Supersampling (2x Render Quality)`
	  - On
	  - Draws the viewport at twice the resolution and scales it down, so edges are smooth.  Turn it off to make a slow graphics card faster.
	* - :guilabel:`Keep supersampling while resizing panels`
	  - On
	  - Keeps that quality while you drag a splitter.  Only available with supersampling on.
	* - :guilabel:`Show Toolbar by Default`
	  - On
	  - Whether a 2D Viewport shows its toolbar until you toggle it there.
	* - :guilabel:`Show Sidebar by Default`
	  - Off
	  - The same, for the sidebar.

An area that you have toggled keeps its own choice, so changing the default does not flip it.  The grid can also be set for one area in its overlays.  See :doc:`/editors/viewport_2d/overlays`.  For the performance settings, see :doc:`/troubleshooting/performance_and_memory`.

Import
======

How artwork is brought into a puppet file.  See :doc:`/artwork/importing`.

.. list-table::
	:header-rows: 1

	* - Setting
	  - Default
	  - What it does
	* - :guilabel:`Parameter Template`
	  - Humanoid
	  - The parameters that the first artwork of a puppet file starts with: :guilabel:`Humanoid` for the usual set, or :guilabel:`None`.
	* - :guilabel:`Initial Mesh`
	  - Generated from Art
	  - The mesh that each new layer starts with: one :guilabel:`Generated from Art`, or a plain :guilabel:`Quad`.
	* - :guilabel:`Mesh Generation Preset`
	  - Standard
	  - The preset for generated meshes: :guilabel:`Standard`, :guilabel:`Fine`, or :guilabel:`Coarse`.  See :doc:`/modeling/generate_mesh`.
	* - :guilabel:`Align Added Artwork`
	  - Center
	  - Where a file that is added later sits on the canvas, among the nine places from :guilabel:`Top Left` to :guilabel:`Bottom Right`.  It sets the :guilabel:`Align` row of the import's operation strip.
	* - :guilabel:`Watch Artwork Files`
	  - Reload Automatically
	  - What Umamo does when an artwork file changes on disk: :guilabel:`Reload Automatically`, :guilabel:`Notify Only`, or :guilabel:`Off`.  It applies at once.  See :doc:`/artwork/source_watcher`.
	* - When deleting art in the sources, also mark the layer as ignored
	  - Off
	  - Stops a deleted piece of art from coming back at the next reload.
	* - In the Sources area, measure layer positions from the world axes
	  - Off
	  - Shows layer positions from the world axes, like every other position, and not from the corner of the art file, which is what the art program shows.

Keybindings
===========

The preset, the shortcut of every command, and the button that resets your changes.  See :doc:`/interface/keymap`.

Pen
===

The category is there, and it is empty: ``Pen configuration is coming soon.``  See :doc:`/interface/pen_and_touch`.

.. seealso::

	* :doc:`/interface/keymap`
	* :doc:`/getting_started/configuration`
	* :doc:`/artwork/importing`
	* :doc:`/artwork/source_watcher`
	* :doc:`/editors/viewport_2d/overlays`
