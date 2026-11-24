*********
Pie Menus
*********

A pie menu is a ring of choices that opens under the pointer.  You pick one by the direction in which you move, not by aiming at a button, so a flick of the hand is enough, with the mouse as much as with a pen.  The menu choices can also be selected by the number shown next to the choice label.  Umamo has several pie menus for choices that you make often: The pivot point, snapping, the target of a merge, and which values to key.

Using a Pie
===========

Press the key of a pie.  The ring opens centered on the pointer, with its name in the middle and up to eight choices around it.  If the pointer is near the edge of the window, the ring moves in so that it fits.

.. figure:: /images/interface/pie_menu.png

	The Snap pie, with its eight choices and their numbers.

Then pick one:

* **Move toward it and click.**  The choice nearest the direction of the pointer from the middle is highlighted, and a click picks it.  You do not need to reach it.
* **Press, drag, and let go.**  Move the pointer toward it while the button is down, and the release picks it.
* **Press its number.**  Every choice shows a number, which follows the order of the ring.  :kbd:`1` to :kbd:`8` or :kbd:`Numpad1` to :kbd:`Numpad8` picks the choice.
* **Cancel.**  Press :kbd:`Escape`, or click in the small disc in the middle.

A choice that does not apply right now is dimmed, and cannot be picked.

The choices are placed in a fixed order: west, east, south, north, then the diagonals northwest, northeast, southwest, and southeast.  A pie of four, then, reads as a plain compass.

Because a pie is a ring of commands, each choice is the same command as the one in the command palette, and it can be bound to a key of its own.  See :doc:`/interface/command_palette`.

The Pies
========

Pivot Point
-----------

.. admonition:: Reference
	:class: refbox

	:Shortcut: :kbd:`Period`

The point that rotations and scales turn about.  The 2D Viewport's header has the same choice as a menu.

.. list-table::
	:header-rows: 1

	* - Direction
	  - Number
	  - Choice
	  - The pivot is
	* - West
	  - :kbd:`1`
	  - :guilabel:`Median Point`
	  - The middle of the selection.
	* - East
	  - :kbd:`2`
	  - :guilabel:`Individual Origins`
	  - The center of each selected item on its own.
	* - South
	  - :kbd:`3`
	  - :guilabel:`Active Element`
	  - The active element.
	* - North
	  - :kbd:`4`
	  - :guilabel:`2D Cursor`
	  - The 2D cursor.

See :doc:`/modeling/transforming`.

Snap
----

.. admonition:: Reference
	:class: refbox

	:Shortcut: :kbd:`Shift-S`

Moves the selection or the 2D cursor in one step.  It opens over the 2D Viewport, and in the UV Editor it opens the UV Snap pie below.

.. list-table::
	:header-rows: 1

	* - Direction
	  - Number
	  - Choice
	* - West
	  - :kbd:`1`
	  - :guilabel:`Cursor to World Origin`
	* - East
	  - :kbd:`2`
	  - :guilabel:`Cursor to Selected`
	* - South
	  - :kbd:`3`
	  - :guilabel:`Cursor to Active`
	* - North
	  - :kbd:`4`
	  - :guilabel:`Cursor to Grid`
	* - Northwest
	  - :kbd:`5`
	  - :guilabel:`Selection to Grid`
	* - Northeast
	  - :kbd:`6`
	  - :guilabel:`Selection to Cursor`
	* - Southwest
	  - :kbd:`7`
	  - :guilabel:`Selection to Cursor (Keep Offset)`
	* - Southeast
	  - :kbd:`8`
	  - :guilabel:`Selection to Active`

The four :guilabel:`Cursor` choices put the 2D cursor in the named place.  The four :guilabel:`Selection` choices move the selection.  :guilabel:`Selection to Cursor` moves the selected elements onto the cursor, and the :guilabel:`Keep Offset` form moves them together so that the selection keeps its shape.  See :doc:`/modeling/snapping`.

UV Snap
-------

.. admonition:: Reference
	:class: refbox

	:Shortcut: :kbd:`Shift-S`

The same shortcut, over the UV Editor.  It works on UV coordinates in Edit Mode, and on art placed on an atlas page in Object Mode.  In Pose Mode the UV Editor only shows, so no pie opens.

.. list-table::
	:header-rows: 1

	* - Direction
	  - Number
	  - Choice
	* - West
	  - :kbd:`1`
	  - :guilabel:`Selection to Pixels`
	* - East
	  - :kbd:`2`
	  - :guilabel:`Selection to Cursor`
	* - South
	  - :kbd:`3`
	  - :guilabel:`Selection to Cursor (Keep Offset)`
	* - North
	  - :kbd:`4`
	  - :guilabel:`Selection to Grid`
	* - Northwest
	  - :kbd:`5`
	  - :guilabel:`Cursor to Pixels`
	* - Northeast
	  - :kbd:`6`
	  - :guilabel:`Cursor to Selected`
	* - Southwest
	  - :kbd:`7`
	  - :guilabel:`Cursor to Grid`

See :doc:`/editors/uv_editor/editing`.

Merge
-----

.. admonition:: Reference
	:class: refbox

	:Mode: Edit Mode
	:Shortcut: :kbd:`M`

Merge Vertices asks where the vertices should come together.

.. list-table::
	:header-rows: 1

	* - Direction
	  - Number
	  - Choice
	  - The vertices meet
	* - West
	  - :kbd:`1`
	  - :guilabel:`Merge at Center`
	  - At the middle of them.
	* - East
	  - :kbd:`2`
	  - :guilabel:`Merge at First`
	  - On the first one selected.
	* - South
	  - :kbd:`3`
	  - :guilabel:`Merge at Last`
	  - On the last one selected.

The choice is kept in the :guilabel:`Merge At` row of the operation strip, so it can be changed afterwards.  See :doc:`/interface/operation_strip`.

Insert Key
----------

.. admonition:: Reference
	:class: refbox

	:Mode: Pose Mode
	:Shortcut: :kbd:`K`

Chooses which values of the posed warps to key.  It opens over a 2D Viewport only.

.. list-table::
	:header-rows: 1

	* - Direction
	  - Number
	  - Choice
	  - Keys
	* - West
	  - :kbd:`1`
	  - :guilabel:`Lattice`
	  - The shape of the lattice.
	* - East
	  - :kbd:`2`
	  - :guilabel:`Opacity`
	  - The opacity.
	* - South
	  - :kbd:`3`
	  - :guilabel:`Colors`
	  - The multiply and screen colors.
	* - North
	  - :kbd:`4`
	  - :guilabel:`All`
	  - All of them.

:kbd:`I` keys the lattice and any opacity and colors that have values not keyed yet.  See :doc:`/rigging/keyforms`.

Other Ways to Reach the Same Choices
====================================

Every choice of a pie is a command, so it can be reached without the pie:

* The right-click menu of the 2D Viewport has rows for the Snap, Merge, and Insert Key pies, which open their choices as a list, in the modes where those apply.
* The command palette lists each choice by name, such as :guilabel:`Cursor to World Origin` or :guilabel:`Merge at Center`.
* The Transform Pivot Point and Snap menus in the 2D Viewport's header, and the Snap menu in the UV Editor's, list the same choices.
* You can give any choice a shortcut of its own in :guilabel:`Keybindings`.  See :doc:`/interface/keymap`.

The shortcuts above are those of the default keymap.  The other presets bind some of them differently.

.. seealso::

	* :doc:`/interface/keymap`
	* :doc:`/modeling/transforming`
	* :doc:`/modeling/snapping`
	* :doc:`/rigging/keyforms`
	* :doc:`/interface/pen_and_touch`
