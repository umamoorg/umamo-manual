*************
Keyform Sheet
*************

The Keyform Sheet shows where things are keyed on a parameter.  For each parameter that you target in the Parameters editor, it draws the range of the parameter from left to right, and a track for every property of every object that has keys on it.  Use it to see the keys of a rig, to select them, to move them, and to add and remove them.  What a key is, and what the keys of a rig do, is in :doc:`/rigging/keyforms`.

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: The Keyform Sheet with a section for one parameter: its ruler with a playhead, a collapsed owner row with summary marks, and an open owner row with a Geometry track and an Opacity track, with a few round marks.  One mark selected, and an orange ring on a track that holds an edit that is not keyed.
	:Setup: Open a model with keyed warp deformers, target a parameter such as Angle X in the Parameters editor, and type an opacity in the Properties editor of a keyed deformer without pressing I.
	:Crop: The Keyform Sheet area, with its header.
	:Save as: ``images/editors/keyform_sheet.png``
	:Caption: The Keyform Sheet.

Concept
=======

A timeline has time across the top.  The sheet has the **value of one parameter**.  The ruler runs from the minimum to the maximum of the parameter, and a key stands at the value that it was made at.  The line on the ruler is the **playhead**, which is the value that the parameter has now.  When you move the slider in the Parameters editor, the playhead follows.

The sheet has no controls for the parameters.  It shows the ones that are **targeted**, which you choose by clicking a parameter in the Parameters editor.  With none targeted the sheet is empty.  With a linked pair targeted, such as the two axes of a 2D pad, it has a section for each axis, in the order of the Parameters editor, one under the other.  Click the heading of a section to fold it away.  See :doc:`/editors/parameters`.

The range of each section is the full range of its own parameter, and the sections share one zoom, so a pair of axes with unlike ranges still move together on the screen.

An empty section says ``Nothing is keyed on this parameter yet.``  When the filters hide every track, it says ``All tracks hidden by filters.``

Reading the Sheet
=================

Owner Rows
----------

Tracks hang under **owner rows**, one for each item that has keys on the parameter: a part, a deformer, a drawable, or a glue.  The row has the icon and the name of the item, and under the name what it is, such as ``Warp Deformer``.  Owners are listed parts first, then deformers, then drawables, then glues.  An item with nothing keyed on the parameter has no row.

Click the arrow of an owner row to open it or close it.  A fresh sheet opens every owner.  A glue is named for the two drawables it joins, such as ``Hair Front ↔ Hair Back``.

Track Kinds
-----------

An owner row has these tracks under it.  The name of the track is on the left, and its keys are marks on the right.

:guilabel:`Geometry`
	The form of the item as it changes with the parameter: the mesh of a drawable, the lattice of a warp, or the form of a rotation deformer itself.  The marks are round.

Property tracks
	One for each property that is keyed, named for it: :guilabel:`Draw Order`, :guilabel:`Opacity`, :guilabel:`Multiply`, :guilabel:`Screen`, :guilabel:`Flip X`, :guilabel:`Flip Y`, or :guilabel:`Glue Intensity`.  The marks are round.  An item can key opacity on a parameter that its shape does not use, and then it has the one track and not the other.

:guilabel:`Blend Shape`
	A blend shape that this parameter drives.  The marks are square.  They are only for reading: a blend shape is not a keyform, so these keys cannot be selected, moved, or removed here.

Summary Marks
-------------

A closed owner row still shows where its keys are.  The marks on it are **summary marks**, one for each value where any of its tracks has a key.  A summary mark stands for all the keys under it:

* Click it to select all of them.
* Drag it to move all of them.
* Right-click it and choose :guilabel:`Delete Keyframe` to remove all of them.  There is no insert for a closed row, because it cannot say on which of its tracks a new key belongs.

Blend-shape keys are not part of a summary, because they cannot be moved.

Pending Circle
--------------

An orange ring on a track says that the item holds an **edit that is not keyed**: a value that you typed in the Properties editor on a keyed field, or a lattice that you shaped in Pose Mode.  The viewport shows the edit, and it is lost when you move the parameter.  The ring is at the playhead, which is where a key made on that track would store it.

An owner row that holds an edit opens by itself so that you can see the ring.  Press :kbd:`I` over the track and the edit becomes a key.  See `Inserting and Removing Keys`_, and :doc:`/editors/properties/index` for the fields that can hold an edit.

Header Filters
==============

The header has one control, the :guilabel:`Filters` button.  It lists three checkboxes, one for each kind of track:

* :guilabel:`Deformation Tracks` are the :guilabel:`Geometry` tracks.
* :guilabel:`Property Tracks` are the opacity, color, draw order, flip, and glue tracks.
* :guilabel:`Blend Shape Tracks` are the blend shapes.

All three are on at first.  A track that is filtered out is not in the sheet at all, so an owner with nothing left loses its row, and a summary mark never stands for a key that you cannot see.  The button has another glyph while a kind is hidden.  The filters are saved with the puppet file.

Selecting Keys
==============

The key selection is shared by every Keyform Sheet, and it is part of the undo history, so Undo takes a selection back.

* **Click** a mark to select it.  The parameter is also moved to the mark, so the pose lands exactly on the key.  The click is one undo step, ``Select Keyframe``.
* :kbd:`Shift`-click a mark to add it to the selection, or to take it out if it is in.  This does not move the parameter.
* **Click** or **drag** on an empty part of a track to move the parameter to that value, as the ruler of a timeline does.  The press also clears the selection.  :kbd:`Shift` keeps it.  The release is one undo step.
* **Box Select**: press :kbd:`B` over the sheet and drag a box.  Every mark in the box is selected.  :kbd:`Shift` adds to the selection.  :kbd:`Escape` before you drag puts the box away.
* A selected mark is drawn in the accent color.

The Select entry of an owner row's menu selects the item in the rig, and does not select keys.  See `Context Menus`_.

Inserting and Removing Keys
===========================

Point at a track, or at a property in the Properties editor, and press the key.  Over a track of the sheet, the key is made on the parameter of that section.  Over a property in the Properties editor, it is made on the parameter that is targeted in the Parameters editor, and if two are targeted, Umamo asks which.  See :doc:`/editors/parameters`.

Insert Keyframe
---------------

.. admonition:: Reference
	:class: refbox

	:Mode: Object Mode, Pose Mode
	:Menu: Context menu
	:Shortcut: :kbd:`I`

Over a track of the sheet, makes a key **at the spot you point at**.  The new key keeps the shape of the track as it was, so inserting does not change anything on its own.  Then you move the parameter to the new key and edit.

Over a property in the Properties editor, or when the pointer is over nothing in particular, makes a key **at the pose**.  If you edited the property and have not keyed it, the edit is what the key stores.  If you have not edited it, the key stores what the property is now, which pins what is on the screen before you go on to edit.  In Pose Mode, over a 2D Viewport, it keys the lattices of the posed warps.  See :doc:`/rigging/posing_warps`.

If the pointer is over nothing that can be keyed, a notice says ``Point at a keyable property to insert a keyframe.``  Insert is one undo step.

Delete Keyframe
---------------

.. admonition:: Reference
	:class: refbox

	:Mode: Object Mode, Pose Mode
	:Menu: Context menu
	:Shortcut: :kbd:`Alt-I`

Removes the key under the pointer.  Pointing at a track but not at a key removes nothing, so it can never take a key that you were not pointing at.  Over a Properties field it removes the key at the pose.

:guilabel:`Delete Selected Keys` removes every selected key in one step.  It is :kbd:`Delete` in the Default keymap, and it is in the command palette.

Insert Key by Type
------------------

.. admonition:: Reference
	:class: refbox

	:Mode: Pose Mode
	:Menu: Context menu
	:Shortcut: :kbd:`K`

Opens the Insert Key pie over a 2D Viewport, which chooses what to key on the posed warps: the lattice, the opacity, the colors, or all of them.  The choices work without the pie, too, as :guilabel:`Insert Lattice Key`, :guilabel:`Insert Opacity Key`, :guilabel:`Insert Color Keys`, and :guilabel:`Insert All Keys`.  :guilabel:`Clear Pose Edits` drops the edits that you have not keyed.  See :doc:`/interface/pie_menus` and :doc:`/rigging/posing_warps`.

Moving Keys
===========

Drag a mark left or right to move its key to a new value.  A key moves along its own track.

* Dragging a selected mark moves the whole selection by the same fraction of each key's own range, so keys of two axes with unlike ranges stay together on the screen.
* Dragging a mark that is not selected selects it first.
* A key stops at the ends of the range, and a group stops when its first key reaches an end.  The preview does not run past the point where the drag will stop.
* A key can be moved past its neighbors.  The keys are numbered again, and the selection follows the keys that you moved.
* :kbd:`Left` and :kbd:`Right` nudge the selected keys by one hundredth of their range.  :guilabel:`Nudge Keyframe Left` and :guilabel:`Nudge Keyframe Right` are the commands.
* The drag, the nudge, and the selection that goes with them are one undo step.

Window Controls
===============

The sheet shows the whole range at first.  To look closer at a part of it:

* :kbd:`Ctrl`-wheel zooms in and out about the pointer.
* :kbd:`Shift`-wheel, or a sideways wheel, pans.
* Drag with the middle button to pan.
* A thin bar under the sheet shows which part of the range is on the screen.  Drag its thumb to pan.  It is hidden while the whole range shows.
* :guilabel:`Frame All Keys`, which is :kbd:`Home` over the sheet, frames the whole range again.
* Drag the separator between the names and the tracks to change the width of the names.

The plain wheel scrolls the list of tracks up and down.  The window, the width of the names, the open owners, the folded sections, and the filters are saved with the puppet file.

Context Menus
=============

Right-click a track or a name.

.. list-table::
	:header-rows: 1

	* - Where
	  - Entry
	* - On a mark
	  - :guilabel:`Delete Keyframe`, with its shortcut
	* - On an empty part of a track
	  - :guilabel:`Insert Keyframe`, with its shortcut, at the spot that you clicked
	* - On a summary mark
	  - :guilabel:`Delete Keyframe`, for every key under it
	* - On the name of an owner
	  - :guilabel:`Select Drawable`, :guilabel:`Select Part`, :guilabel:`Select Warp Deformer`, or :guilabel:`Select Rotation Deformer`, which selects the item in the rig
	* - On any other name
	  - Nothing

A glue has no entry on its name, because a glue is not an item that can be selected.  A blend-shape track has no menu on its lane.

Edit Mode Restriction
=====================

Edit Mode does not change keys.  In Edit Mode, a mark can still be selected, but it cannot be dragged, the entries of the lane menu are dimmed, and the commands for inserting, deleting, and nudging keys are not available.  Switch to Object Mode or Pose Mode to edit keys.  See :doc:`/modeling/modes`.

.. seealso::

	* :doc:`/rigging/keyforms`
	* :doc:`/rigging/posing_warps`
	* :doc:`/editors/parameters`
	* :doc:`/editors/properties/index`
