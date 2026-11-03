**********
Parameters
**********

The Parameters editor has a control for every parameter of the rig.  You move the sliders to pose the model, you add and arrange the parameters, and you choose the parameter that the next key is made on.  A parameter that is linked with the one below it is shown as one 2D pad.  What a parameter is, and what it does to the rig, is in :doc:`/rigging/parameters`.

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: The Parameters editor with its header, and the list under it: a group that is open with two sliders and one 2D pad, a second group that is closed, and one slider outside any group.  One slider has key marks on its track, one has its range editor open, and one island has the accent outline.
	:Setup: Open a model that has parameter groups and one linked pair of parameters.  Click the grip of one parameter, and click the name of another to open its range.
	:Crop: The Parameters area, with its header.
	:Save as: ``images/editors/parameters.png``
	:Caption: The Parameters editor.

Row Types
=========

The list has three kinds of rows.

* A **group header** is a bar with an arrow and the name of a group.  It opens and closes the parameters under it.
* A **slider** is for one parameter.  It sits in a raised island with its name, its value, and a track.
* A **2D pad** is for two parameters that are linked.  It has a name and a value for each axis, over a square that moves both.

Every row has a grip at its left edge, for reordering.  A parameter whose range is empty, with a minimum that is not below its maximum, has nothing to move and is not listed.

Header
======

The header has these controls, left to right: the :guilabel:`Add Parameter` menu, the :guilabel:`New Group` button, the search field in the middle, the :guilabel:`Reset All` button, and the :guilabel:`Filters` button.  They do not show without a document.  In a header that is too narrow, the controls that do not fit move into a menu at the end of the header.

Add Parameter
-------------

The :guilabel:`Add Parameter` menu makes a new parameter of the kind you choose:

* :guilabel:`Add Key Form Parameter` makes a parameter for keyforms.  Its slider has a round thumb.
* :guilabel:`Add Blend Shape Parameter` makes a parameter that drives blend shapes.  Its slider has a square thumb.  The entry is only in the menu when the runtime target has blend-shape parameters, which is Cubism 4.2 and later.  See :doc:`/files/runtime_targets`.

The new parameter is called ``New Parameter``.  It goes from -1 to 1, with a default of 0, and is put at the top of the list.  Its name opens for editing at once, so type a name and press :kbd:`Enter`.  The step is one undo step, ``Add Parameter``.  See :doc:`/rigging/parameters`.

New Group
---------

The :guilabel:`New Group` button makes an empty group called ``New Group`` at the top of the list, open, with its name ready to edit.  Drag parameters into it.  See `Groups`_.

Search
------

Type part of a name to list only the parameters that match.  The text is also matched against the **ID** of the parameter, so ``ParamAngleX`` finds the axis however it was renamed.  The match ignores upper and lower case.

Every group opens while you search, so a match is never hidden in a closed group, and a group with no match is left out.  The text is not saved with the document.

Reset All
---------

The :guilabel:`Reset All` button puts every parameter back to its default, as one undo step.  It is the quick way back to the rest pose.  It does nothing in Edit Mode.  See `Edit Mode Lock`_.

Filters
-------

The :guilabel:`Filters` button opens a list with one checkbox:

:guilabel:`Only parameters the selection uses`
	Lists only the parameters that move the selected objects.  For a drawable, these are the parameters of its own keyforms and of every deformer above it.  For a deformer, they are its own and those of its parents.  For a part, they are its draw order and those of the drawables inside it.  With nothing selected the filter lists everything, so the editor is never empty by surprise.  It is off at first, and it is saved with the document.

The button has a different glyph while the filter is on.

Sliders
=======

A slider is for one parameter.  Click or drag anywhere on the track to set the value.  While you drag, the model follows in every viewport, and the release is one undo step, ``Adjust Parameter``.  The thumb is round for a key form parameter and square for a blend shape parameter.

Above the track is a line with the name of the parameter, a small reset button when the value is not the default, a field with the value, and, if the parameter can be linked, a link button at the end.  Double-click the name to rename the parameter, :kbd:`Enter` to keep the new name and :kbd:`Escape` to go back.  The context menu has :guilabel:`Rename` too.

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: Three sliders one over another: one at its default, with round key marks on its track; one away from its default, with its reset button showing; and one with its range editor open, with the Min, Default, and Max fields.
	:Setup: Open a model with keyed parameters.  Move one slider off its default, and click the name of another to open its range.
	:Crop: The three islands.
	:Save as: ``images/editors/parameters_sliders.png``
	:Caption: Sliders.

Range
-----

Click the name of a parameter, or the arrow before it, to open its range editor under the slider.  It has three fields, :guilabel:`Min`, :guilabel:`Default`, and :guilabel:`Max`.  Click the name again to close it.

* Any number of range editors can be open at once.  Which ones are open is saved with the document.
* The three values depend on each other, so a change is tidied after you make it.  The minimum is kept at or below the maximum, the default is brought into the range, and the value on the slider is brought into the range as well.
* A change is one undo step, ``Edit Parameter Range``.  It is a change to the document and works in any mode.

See :doc:`/rigging/parameters` for what the range of a parameter means.

Value Field
-----------

The field at the end of the line is a number field.  Click it and type a value, drag across it to scrub it, or use the arrows at its ends.  A value outside the range is moved to the nearest end.  Each entry is one undo step.  See :doc:`/editors/properties/index` for how number fields work.

When the value is not the default, a small button with a reset arrow shows before the field.  Click it to put this one parameter back to its default.

Key Marks
---------

The track shows a mark for every value that an object has a key at, so that you can see where the keys are and move onto one.

* A **circle** is a key of a keyform grid.
* A **square** is a key of a blend shape.

The marks are the keys of the whole model, from every object, and not only of what is selected.  A parameter that nothing is keyed on has none.  A mark is only a guide: the thumb does not snap to it.  See :doc:`/editors/keyform_sheet` for the keys of a single object.

The 2D Pad and Linking
======================

Two parameters that are **linked** show as one pad.  The pad has the two parameters as fields at the top, one over the other, and a square under them with a handle on a grid of nine points.  Click or drag anywhere in the square to set both values at once.  The horizontal axis is the upper parameter, and the vertical axis is the lower one, with its maximum at the top of the square.  A release is one undo step.

* The range of a pad is one range editor with a set of fields for each axis, which opens when you click either name.
* The **link button** is at the end of the upper axis.  Click it to unlink the pair into two sliders.

To link two sliders, click the link button on the first one.  It is only offered when the parameter right below it is a valid partner:

* The partner is the next parameter in the same group, with no group header in between.
* Neither of the two is in a link already.
* Both have a range to move in.

Linking and unlinking are one undo step each, ``Link Parameters`` and ``Unlink Parameters``.  They change only how the pair is shown, and the pose does not change.  They work in every mode.

Choosing the Parameter to Key
=============================

The editor also chooses the parameter that keys are made on.  This is the **targeted** parameter, and it is shared with the other areas, so a Keyform Sheet follows what you choose here.  The targeted parameter has a thick outline in the accent color.

* Click the **empty part of an island**, or click its **grip**, to target its parameter.  Click the grip of a pad and both of its axes are targeted, with the horizontal one as the main.
* Dragging a slider does not change the target, because moving a slider is a pose and not a choice.  The name and the value field do not either.
* Choosing is one undo step, ``Select Parameter``.
* A group header owns no parameter, and the grip of a group targets nothing.

The key that :kbd:`I` makes, in the Properties editor, the Keyform Sheet, or the viewport, is made on the targeted parameter, at the value it has now.  With two parameters targeted, for example after you click a pad, Umamo asks which of the two the key is for.  With none targeted, it says ``Select a parameter to key on.``  See :doc:`/rigging/keyforms`, :doc:`/editors/keyform_sheet`, and :doc:`/editors/properties/index`.

Groups
======

A group collects parameters under a name.  Its header is a bar with an arrow.

* **Click** the header to open or close the group.
* **Double-click** the name to rename it.  :kbd:`Enter` keeps the new name and :kbd:`Escape` goes back to the old one.
* A group that is open or closed when you save the document is open or closed when it is opened again.  A group you have not touched is as the file had it.
* A search opens all the groups and holds them open.  The arrows do nothing until it is cleared.

Groups are one level deep.  A group cannot be put inside another.  A model that was imported with nested groups shows them nested, and they can be opened, closed, and renamed.  To remove a group, see `Context Menus`_.

Reordering
==========

Drag the grip at the left of a row to move it.  The place where it will land is shown before you let go, and a label with its name follows the pointer.  Press :kbd:`Escape` while you drag to cancel.

* Over a **parameter**, the top half of the row means *before* and the bottom half means *after*.  A group that you drag is judged the same way, over a group header as well.
* Over a **group header**, with a parameter in hand, the top third means *before*, the bottom third means *after*, and the middle means *into*: the parameter goes to the end of that group.  The group opens afterwards.
* A **pad** moves as the pair it is, and its two parameters stay together.
* A **group** moves among the groups and parameters at the top level only.  It cannot be dropped inside a group, and it cannot be put inside another group.

A move is one undo step, ``Move Parameter``.  The order of the list is saved with the document.  The grip is also a place to click to target the row's parameter.  See `Choosing the Parameter to Key`_.

Context Menus
=============

Right-click a row, or an empty place in the list.

.. list-table::
	:header-rows: 1

	* - Where
	  - Entries
	* - A slider
	  - :guilabel:`Rename`, :guilabel:`Delete Parameter`, then :guilabel:`Add Key Form Parameter`, :guilabel:`Add Blend Shape Parameter`, :guilabel:`New Group`
	* - A pad
	  - :guilabel:`Rename` and :guilabel:`Delete Parameter`, each with a submenu that asks which axis, then the same three entries that make things
	* - A group header
	  - :guilabel:`New Group`, :guilabel:`Rename`, :guilabel:`Delete Group`
	* - An empty place
	  - :guilabel:`Add Key Form Parameter`, :guilabel:`Add Blend Shape Parameter`, :guilabel:`New Group`

:guilabel:`Add Blend Shape Parameter` follows the runtime target, as in the header.  The entries that make things are the way to make the first parameter or group of a model that has none.

:guilabel:`Delete Group` removes the group and keeps its parameters: they move up into the place of the group.  It is one undo step, ``Delete Group``.

Edit Mode Lock
==============

Edit Mode works on the mesh at rest, and it holds the pose still.  While you are in Edit Mode:

* The sliders and pads show every parameter at its default, which is the rest pose that the viewport shows.
* They cannot be moved, and :guilabel:`Reset All` does nothing.
* The pose that you had in Object Mode is kept, and it comes back when you leave Edit Mode.

Everything that changes the document and not the pose still works: ranges, links, names, new parameters and groups, deleting, and reordering.  Pose Mode does not lock the sliders, because the pose is what Pose Mode works with.  See :doc:`/modeling/modes`.

Deleting a Parameter
====================

:guilabel:`Delete Parameter` removes a parameter from the document and from the pose, with no question asked.  It is one undo step, ``Delete Parameter``, and Undo brings back the parameter and the pose.

Everything that was keyed on the parameter loses that axis.  A keyform grid becomes the slice at the default value of the parameter, so the rig keeps its neutral look and loses only the motion of that parameter.  When the default was not on a key, the nearest key is kept instead, and some objects look different at rest.  Umamo then tells you in a notice: ``Parameter deleted.  3 object(s) now look different at the default pose.``  See :doc:`/rigging/parameters`.

.. seealso::

	* :doc:`/rigging/parameters`
	* :doc:`/editors/keyform_sheet`
	* :doc:`/rigging/keyforms`
	* :doc:`/editors/history`
