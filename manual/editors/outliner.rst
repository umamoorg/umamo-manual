********
Outliner
********

The Outliner lists everything in the rig as a tree: the deformers, and the parts with the drawables and the parts inside them.  It is the place to find an object by name, to select it, to hide it or make it unselectable, to rename it, to delete it, and to move it to another parent.

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: The Outliner with the Puppet root open: the Armature with a couple of deformers, and a few parts, one of them open to show drawables and a sub-part.  One drawable selected.  The pointer and the eye columns visible, and one drawable hidden so that its row is dimmed and its eye struck through.
	:Setup: Open a model that has a warp deformer and a few parts, select a drawable, and hide another one.
	:Crop: The Outliner area, with its header.
	:Save as: ``images/editors/outliner.png``
	:Caption: The Outliner.

The Tree
========

There is one root, :guilabel:`Puppet`, and everything is under it.

* The :guilabel:`Armature` comes first.  It holds the deformers, nested the way the rig nests them: a deformer is inside the deformer that is its parent.  The Armature is there even when the rig has no deformers.
* The **parts** follow, with any drawables that sit at the top level, in the order of the rig.  Each part lists its drawables and the parts inside it, in their order.

Each row has an arrow to open or close it, a small icon for what it is, and its name.  Only the root is open at first.  A closed part that has a selected object somewhere inside it is marked, so that you can tell where the selection is.

When you select an object somewhere else, such as by clicking it in the 2D Viewport, the Outliner opens the branches above its row and scrolls to it.  A click in the Outliner itself never scrolls the list.

Which branches are open, which kinds of rows and which columns are shown, belong to the area and are saved in the puppet file.  See :doc:`/files/uma`.

Header
======

The header of an Outliner has a search field in the middle and a filter button at the right end.  Neither shows without an open puppet.

Search
------

Type part of a name to see only the rows that match, with the branches above them.  The match ignores upper and lower case.  Every branch opens while a search is on, so a match is never hidden in a closed branch, and the arrows do nothing until the search is cleared.

If you clicked a row among the results, clearing the search brings the tree back with that row in view.  The search text is not saved with the puppet file, so the file always reopens to the whole tree.

Filters
-------

The filter button opens a list with two groups.

:guilabel:`Restriction Toggles`
	Two buttons, :guilabel:`Selectable Column` and :guilabel:`Visibility Column`.  A lit button shows that column on every row.  Hide a column you do not use to give the names more room.

:guilabel:`Filters`
	Three checkboxes, :guilabel:`Parts`, :guilabel:`Drawables`, and :guilabel:`Deformers`, for the kinds of rows that are listed.  Turn off :guilabel:`Drawables` to see only the structure.  Turning off :guilabel:`Parts` does not hide their drawables: they are listed directly under the root, as if there were no parts.

The button shows a different glyph while any of the three kinds is turned off.

Selecting Rows
==============

Click a row to select its object.  The selection is shared with the other editors, so the object is selected in the 2D Viewport too.  An object that cannot be selected in the viewport can still be selected here.

* **Click** selects the row and clears the rest.
* :kbd:`Ctrl`-click (:kbd:`Cmd` on macOS) adds the row to the selection, or removes it if it is selected.
* :kbd:`Shift`-click selects every visible row from the active one to the clicked one, and adds them to the selection.  Rows that a search or a filter hides are not in the run.

The last row you clicked is the active one.  The status bar shows its name.  See :doc:`/interface/status_bar`.  The Armature and the root have no object and cannot be selected.

A click is also how a field of the Properties editor takes its pick, when you have armed it to choose a parent from the Outliner.  The row is then given to the field, and the selection stays as it was.  See :doc:`/editors/properties/object_tab`.

Visibility and Selectability Columns
====================================

Two columns of small icons are at the right end of each row, the pointer first and the eye after it.

* The **pointer** column says whether the object can be selected in the viewport.  Click it to switch it.  An object that cannot be selected is skipped by clicks and boxes in the 2D Viewport.  Parts, drawables, and deformers all have a pointer.
* The **eye** column says whether the object is shown.  Click it to hide or show it.  The eye is struck through while the object is hidden.  Parts and drawables have an eye.  Deformers do not.

Clicking an icon changes the flag and does not select the row.  :kbd:`Shift`-click an icon to set the row and everything under it to one value, the opposite of the clicked row's, so that a mixed branch ends up the same.  Each change is one undo step, and it is saved with the puppet file.

Hiding a part hides everything inside it in the viewport, whatever the eye of each of them says.  Only the part's own row is dimmed.  See :doc:`/modeling/parts_and_drawables`.

Renaming
========

Double-click the name of a row to rename it in place.  The whole name is selected, so typing replaces it.  :kbd:`Enter`, or a click anywhere else, keeps the new name, and :kbd:`Escape` goes back to the old one.  Spaces at the start and the end are removed, and a blank name keeps the old name.  The ID of the object does not change when you rename it.  Rename is also in the row menu.

Row Menu
========

Right-click a row for its menu.  A right-click does not select the row, and the entries that change a flag, rename, or delete work on the row you clicked.

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: The row menu of a part: Select Hierarchy, Toggle Visibility, Toggle Selectability, Rename, Create Warp Deformer, Delete, and Delete Hierarchy.
	:Setup: In Object Mode, right-click a part in the Outliner.
	:Crop: The row and the menu.
	:Save as: ``images/editors/outliner_row_menu.png``
	:Caption: The row menu of a part.

Select Hierarchy
----------------

Selects the row and everything under it: a part with all the drawables and parts inside it, or a deformer with all the deformers nested in it.  The drawables that a deformer moves are not included, because the Outliner lists them under their parts.  It replaces the selection, and the row becomes the active one.  :guilabel:`Select Hierarchy` is in the command palette too, where it expands the current selection in the same way.

Toggle Visibility
-----------------

.. admonition:: Reference
	:class: refbox

	:Menu: Outliner row menu
	:Shortcut: :kbd:`H`

Shows or hides the object, like the eye.  Parts and drawables only.  The menu entry changes the row you clicked.  The shortcut works on the whole selection: it flips the state of the active object, and gives the same state to the rest, so a mixed selection ends up the same.

Toggle Selectability
--------------------

Switches whether the object can be selected in the viewport, like the pointer.  It is in the menu of every row.

Rename
------

Opens the inline editor on the name.

Create Warp Deformer
--------------------

.. admonition:: Reference
	:class: refbox

	:Mode: Object Mode
	:Menu: Outliner row menu, Context menu

Wraps the selection in a new warp deformer.  It takes the selected drawables that have a mesh, every drawable inside a selected part, and the selected deformers, and it leaves out whatever a selected deformer already carries.  The operation strip then adjusts the number of rows and columns and the margin.  See :doc:`/rigging/deformers` and :doc:`/interface/operation_strip`.

The command works on the **selection**, not on the row you right-clicked, so select what you want to wrap first.  The entry is only in the menu in Object Mode, and it is dimmed when nothing in the selection can be wrapped.

Delete
------

Deletes the row, with no question asked.  Undo brings it back.

* Deleting a **part** keeps what is inside it, which moves up into the part's parent.
* Deleting a **deformer** moves the deformers nested directly in it, and the drawables that it moves, to its parent, keeping them where they rest.  If one of them cannot be kept where it was, Umamo tells you in a notice, and the log lists them.
* Deleting a **drawable** deletes the drawable.

Delete Hierarchy
----------------

Only for parts.  Deletes the part with everything inside it.

Each delete is one undo step.

Drag and Drop Reparenting
=========================

Press a row and hold it for a moment to pick it up, and drag it to another row.  A faded copy of the row stays where it was, and a label with its name follows the pointer.  The place where it will land is shown before you let go.

* Over the **top third** of a part or a deformer, a line along the top edge means *before*: the row goes in front of it, under the same parent.
* Over the **bottom third**, a line along the bottom edge means *after*.
* Over the **middle third**, the whole row is filled, which means *into*: the row becomes the last child of it.  The destination opens afterwards so that you see the row arrive.

A drawable cannot hold anything, so over a drawable the top half means *before* and the bottom half means *after*.  A drop onto a drawable is a way to put a part or another drawable next to it, among the parts and drawables of the same level.

Parts and drawables move only among the parts, and deformers only among the deformers, so a drawable cannot be dropped on a deformer.  Set the parent deformer of a drawable in the Properties editor instead.  See :doc:`/editors/properties/object_tab`.  A move that would put a row inside itself does nothing.

Press :kbd:`Escape` while you drag to cancel.  A drop is one undo step.

Keep in Place
=============

Moving a deformer under a different parent changes the chain of deformers that moves it, and so it would move on the screen.  After such a drop, the operation strip has a :guilabel:`Keep in Place` checkbox, which is on at first.  On, the deformer stays where it rests under its new parent, with its keyed motion.  Off, it keeps its numbers and follows the new parent.  If the new chain cannot map the deformer, Umamo tells you in a notice, and the deformer is moved without its place.  See :doc:`/interface/operation_strip`.

Moving a deformer in front of or behind a sibling, under the same parent, only changes the order and has no strip.  Moves among the parts change no space either.

Hover Preview and Dimmed Rows
=============================

Rest the pointer on a drawable row for a moment and a picture of its art pops up beside it, with its name.  It helps to tell ``ArtMesh12`` from ``ArtMesh13``.  A part row shows its art together, as one picture.  A deformer has none, and neither does a drawable or a part without art.

A row is dimmed when the object is hidden, and when it is a part marked as a guide image.  A dimmed row is still there and can be selected.  See :doc:`/editors/properties/data_tab` for the guide-image setting.

.. seealso::

	* :doc:`/modeling/parts_and_drawables`
	* :doc:`/rigging/deformers`
	* :doc:`/editors/properties/object_tab`
	* :doc:`/editors/history`
