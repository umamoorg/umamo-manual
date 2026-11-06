*****************
Default Shortcuts
*****************

These are the shortcuts that come with Umamo's three keymap presets.  The Default preset, which this manual teaches, is listed in full.  The Cubism and Blender presets are listed by what they do differently from it.  Your own changes are not listed here.  The :guilabel:`Keybindings` category of Settings shows the shortcuts that are in force.  See :doc:`/interface/keymap` for how the keymap works and how to change a binding.

Default Preset
==============

Every shortcut of the preset is in one of the tables below, grouped by what it does.  Commands are named as the command palette lists them, which is sometimes longer than the label of the menu row.

* :kbd:`Ctrl` is the primary modifier: the Ctrl key on Windows and Linux, and the Cmd key on macOS.  The one exception is Toggle Pose Mode, :kbd:`Ctrl-Tab`, which uses the Control key itself on every system.
* Keys are named by their place on a US QWERTY keyboard.  :kbd:`Equals`, :kbd:`Minus`, :kbd:`Comma`, and :kbd:`Period` are spelled out, the keys of the numeric keypad start with :kbd:`Numpad`, and :kbd:`Left` and :kbd:`Right` are the arrow keys.
* A shortcut acts on the area under the pointer, and only when the command applies.  The Mode column says in which editing mode that is.  *Any* means Object Mode, Edit Mode, and Pose Mode.  See :doc:`/modeling/modes`.
* Keys that are not in the keymap are not in the tables: :kbd:`Escape` and :kbd:`Enter`, :kbd:`X` and :kbd:`Z` during a transform, and the number keys in a pie menu.  See :doc:`/interface/keymap`.  The mouse is in :doc:`/editors/viewport_2d/navigation`.

A command that has no shortcut can still be run from its menu row or from the command palette.  See :doc:`/interface/command_palette`.

Window and Files
----------------

.. list-table::
	:header-rows: 1

	* - Command
	  - Shortcut
	  - Mode
	* - Command Palette
	  - :kbd:`Ctrl-P`, :kbd:`Space`
	  - Any
	* - New Document
	  - :kbd:`Ctrl-N`
	  - Any
	* - Open Document…
	  - :kbd:`Ctrl-O`
	  - Any
	* - Save Document
	  - :kbd:`Ctrl-S`
	  - Any
	* - Save Document As…
	  - :kbd:`Ctrl-Shift-S`
	  - Any
	* - Import Artwork…
	  - :kbd:`Ctrl-Shift-O`
	  - Any
	* - Undo
	  - :kbd:`Ctrl-Z`
	  - Any
	* - Redo
	  - :kbd:`Ctrl-Shift-Z`
	  - Any
	* - Adjust Last Operation
	  - :kbd:`F9`
	  - Any
	* - Settings
	  - :kbd:`Ctrl-Comma`
	  - Any
	* - Previous Workspace
	  - :kbd:`Ctrl-PageUp`
	  - Any
	* - Next Workspace
	  - :kbd:`Ctrl-PageDown`
	  - Any
	* - Toggle Toolbar
	  - :kbd:`T`
	  - Any
	* - Toggle Sidebar
	  - :kbd:`N`
	  - Any

Navigation
----------

.. list-table::
	:header-rows: 1

	* - Command
	  - Shortcut
	  - Mode
	* - Fit View
	  - :kbd:`Ctrl-0`
	  - Any
	* - Actual Size (100%)
	  - :kbd:`Ctrl-1`
	  - Any
	* - Zoom In
	  - :kbd:`Ctrl-Equals`
	  - Any
	* - Zoom Out
	  - :kbd:`Ctrl-Minus`
	  - Any
	* - Zoom In (Large Step)
	  - :kbd:`Ctrl-Shift-Equals`
	  - Any
	* - Zoom Out (Large Step)
	  - :kbd:`Ctrl-Shift-Minus`
	  - Any
	* - Zoom Region
	  - :kbd:`Shift-B`
	  - Any
	* - Frame All
	  - :kbd:`Home`
	  - Any
	* - Frame Selected
	  - :kbd:`NumpadDecimal`
	  - Any

Selection
---------

.. list-table::
	:header-rows: 1

	* - Command
	  - Shortcut
	  - Mode
	* - Select All
	  - :kbd:`A`
	  - Any
	* - Invert Selection
	  - :kbd:`Ctrl-I`
	  - Any
	* - Box Select
	  - :kbd:`B`
	  - Any
	* - Circle Select
	  - :kbd:`C`
	  - Any
	* - Grow Circle Radius
	  - :kbd:`NumpadAdd`
	  - Any
	* - Shrink Circle Radius
	  - :kbd:`NumpadSubtract`
	  - Any
	* - Select Linked under Cursor
	  - :kbd:`L`
	  - Edit, Pose
	* - Select Linked
	  - :kbd:`Ctrl-L`
	  - Edit, Pose
	* - Switch Editing Object
	  - :kbd:`Alt-Q`
	  - Edit, Pose
	* - Vertex Select Mode
	  - :kbd:`1`
	  - Edit, Pose
	* - Edge Select Mode
	  - :kbd:`2`
	  - Edit, Pose
	* - Face Select Mode
	  - :kbd:`3`
	  - Edit, Pose
	* - Toggle Visibility
	  - :kbd:`H`
	  - Object

Transform
---------

.. list-table::
	:header-rows: 1

	* - Command
	  - Shortcut
	  - Mode
	* - Grab Vertices
	  - :kbd:`G`
	  - Any
	* - Rotate Vertices
	  - :kbd:`R`
	  - Any
	* - Scale Vertices
	  - :kbd:`S`
	  - Any
	* - Pivot Point
	  - :kbd:`Period`
	  - Any
	* - Snap
	  - :kbd:`Shift-S`
	  - Any
	* - Toggle Proportional Editing
	  - :kbd:`O`
	  - Edit, Pose
	* - Toggle Proportional Connected Only
	  - :kbd:`Alt-O`
	  - Edit, Pose

Mesh Editing
------------

.. list-table::
	:header-rows: 1

	* - Command
	  - Shortcut
	  - Mode
	* - Toggle Edit Mode
	  - :kbd:`Tab`
	  - Any
	* - Duplicate
	  - :kbd:`Shift-D`
	  - Object, Edit
	* - Merge Vertices
	  - :kbd:`M`
	  - Edit
	* - Connect Vertices
	  - :kbd:`J`
	  - Edit
	* - Rip
	  - :kbd:`V`
	  - Edit
	* - Vertex Slide
	  - :kbd:`Shift-V`
	  - Edit, Pose
	* - Generate Mesh from Art
	  - :kbd:`Shift-M`
	  - Object, Edit

Keying
------

.. list-table::
	:header-rows: 1

	* - Command
	  - Shortcut
	  - Mode
	* - Toggle Pose Mode
	  - :kbd:`Ctrl-Tab`
	  - Any
	* - Insert Keyframe
	  - :kbd:`I`
	  - Object, Pose
	* - Delete Keyframe
	  - :kbd:`Alt-I`
	  - Object, Pose
	* - Insert Key by Type
	  - :kbd:`K`
	  - Pose
	* - Delete Selected Keys
	  - :kbd:`Delete`
	  - Object, Pose
	* - Nudge Keyframe Left
	  - :kbd:`Left`
	  - Object, Pose
	* - Nudge Keyframe Right
	  - :kbd:`Right`
	  - Object, Pose

UV Editor
---------

The UV Editor takes the selection, transform, and navigation shortcuts above for its own contents, and :kbd:`Shift-S` opens the UV Snap pie there instead of the Snap pie.  These two are its own.  See :doc:`/editors/uv_editor/placement`.

.. list-table::
	:header-rows: 1

	* - Command
	  - Shortcut
	  - Mode
	* - Pin Art Placement
	  - :kbd:`P`
	  - Object
	* - Unpin Art Placement
	  - :kbd:`Alt-P`
	  - Object

Overlays
--------

The other overlays have no shortcut.  Switch them in the :guilabel:`Viewport Overlays` menu of the header, or run them from the command palette.  See :doc:`/editors/viewport_2d/overlays`.

.. list-table::
	:header-rows: 1

	* - Command
	  - Shortcut
	  - Mode
	* - Toggle Overlays
	  - :kbd:`Shift-Alt-Z`
	  - Any

Cubism Preset
=============

The Cubism preset is for people who come from the Cubism Editor.  It has the shortcuts of the Default preset, apart from the ones in this table, which follow what Cubism users are used to.  :kbd:`Space` does not open the command palette, because Cubism uses it for panning the canvas.  See :doc:`/getting_started/coming_from_cubism`.

.. list-table::
	:header-rows: 1

	* - Command
	  - Default
	  - Cubism
	* - Command Palette
	  - :kbd:`Ctrl-P`, :kbd:`Space`
	  - :kbd:`Ctrl-P`
	* - Redo
	  - :kbd:`Ctrl-Shift-Z`
	  - :kbd:`Ctrl-Shift-Z`, :kbd:`Ctrl-Y`
	* - Frame Selected
	  - :kbd:`NumpadDecimal`
	  - :kbd:`Ctrl-Shift-0`

Blender Preset
==============

The Blender preset is for people who come from Blender.  It has the shortcuts of the Default preset, apart from the ones in this table, which follow Blender: the command palette is on :kbd:`F3`, as Blender's operator search is, and the zoom keys are the bare :kbd:`Equals` and :kbd:`Minus`.  There is no shortcut for Fit View in this preset.  :kbd:`Home`, Frame All, frames the view in every preset.

.. list-table::
	:header-rows: 1

	* - Command
	  - Default
	  - Blender
	* - Command Palette
	  - :kbd:`Ctrl-P`, :kbd:`Space`
	  - :kbd:`F3`
	* - Fit View
	  - :kbd:`Ctrl-0`
	  - —
	* - Zoom In
	  - :kbd:`Ctrl-Equals`
	  - :kbd:`Equals`
	* - Zoom In (Large Step)
	  - :kbd:`Ctrl-Shift-Equals`
	  - :kbd:`Shift-Equals`
	* - Zoom Out
	  - :kbd:`Ctrl-Minus`
	  - :kbd:`Minus`
	* - Zoom Out (Large Step)
	  - :kbd:`Ctrl-Shift-Minus`
	  - :kbd:`Shift-Minus`

A dash in the Blender table means that the command has no shortcut in that preset.

.. seealso::

	* :doc:`/interface/keymap`
	* :doc:`/interface/command_palette`
	* :doc:`/getting_started/coming_from_cubism`
