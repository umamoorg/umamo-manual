**********
Object Tab
**********

The Object tab is about the item as a whole: where it is, and what it is bound to.  It has two sections, :guilabel:`Transform` and :guilabel:`Relations`.  What is inside depends on the kind of item.  See :doc:`/editors/properties/index` for which item the tab shows.

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: The Object tab of a drawable in Object Mode: the Transform section with the Position X and Position Z pair and the Size X and Size Z pair with its padlock, and the Relations section with the Parent Part and Parent Deformer fields, each with its clear button and dropper.
	:Setup: Open a model whose drawable sits under a warp deformer, select the drawable, and open the Object tab.
	:Crop: The Properties area, with its header.
	:Save as: ``images/editors/properties_object.png``
	:Caption: The Object tab of a drawable.

Transform
=========

The rows of :guilabel:`Transform` measure the item where it is **in the viewport**, at the pose that is shown, and not where it is in its own deformer.  Positions are measured from the world axes, in pixels, and a Z value measures up.  See :doc:`/editors/properties/document_tab` for the axes.  The names are the ones the sidebar uses, and the sidebar shows the same rows in Object Mode.  See :doc:`/editors/viewport_2d/sidebar`.

Which rows an item has:

.. list-table::
	:header-rows: 1

	* - Item
	  - Rows
	  - Can be edited
	* - Drawable
	  - :guilabel:`Position X`, :guilabel:`Position Z`, :guilabel:`Size X`, :guilabel:`Size Z`
	  - Yes
	* - Warp deformer
	  - :guilabel:`Position X`, :guilabel:`Position Z`, :guilabel:`Size X`, :guilabel:`Size Z`
	  - Yes
	* - Rotation deformer
	  - :guilabel:`Position X`, :guilabel:`Position Z`, :guilabel:`Angle`, :guilabel:`Scale`, :guilabel:`Base Angle`
	  - :guilabel:`Base Angle` only
	* - Part
	  - :guilabel:`Position X`, :guilabel:`Position Z`, :guilabel:`Size X`, :guilabel:`Size Z`
	  - No

Drawable
--------

:guilabel:`Position X` and :guilabel:`Position Z` are the center of the box around the mesh, and :guilabel:`Size X` and :guilabel:`Size Z` are its width and its height, all as the mesh appears in the viewport, with its deformers applied.

Typing a position moves the mesh there.  Typing a size scales the mesh about its center.  The padlock beside the two size fields keeps the proportions: while it is on, a change to one field scales the other by the same factor.  Each edit is one undo step, and a scrub shows in the viewport while you drag.

Right after you commit a value, an operation strip shows the edit as a Grab, with :guilabel:`Move X` and :guilabel:`Move Z`, or as a Scale, with :guilabel:`Scale X` and :guilabel:`Scale Z`, so that you can adjust it by number.  See :doc:`/interface/operation_strip`.

A drawable without a mesh has no place, and the section is left out.

Warp Deformer
-------------

The rows measure the box of the lattice.  Editing them moves or resizes the **whole** deformer, every form it carries, and everything it moves follows.  A committed edit shows the same operation strip as a drawable does.  If the pose does not draw the warp, the section says ``This item has no placement to show.``

Rotation Deformer
-----------------

* :guilabel:`Position X` and :guilabel:`Position Z` are the pivot of the deformer.  They show the pivot and cannot be edited here yet.
* :guilabel:`Angle` is the angle of the deformer at the shown pose, in degrees: its base angle plus what its keyforms and blend shapes add.  :guilabel:`Scale` is its scale at the pose.  Both are read-only.
* :guilabel:`Base Angle` is the one row that can be edited.  It is the rotation of the deformer at rest, in degrees, and the angle that each keyform sets is added to it.  A scrub turns the deformer in the viewport.  The same field is in the Data tab.  See :doc:`/editors/properties/data_tab`.

Part
----

The rows are the center and the size of everything the part holds.  They are read-only.  To move a part, move what is inside it.  See :doc:`/modeling/transforming`.

Relations
=========

The :guilabel:`Relations` section binds the item to the part and the deformer that it belongs to.  Each is a search box with two buttons.  Type to find a name in the list, or use the dropper to pick the item on the screen.

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: A Parent Deformer field being used: the field focused with part of a name typed, and its list of matches open beneath it with one highlighted and a deformer icon beside each.
	:Setup: Select a drawable under a warp deformer, open the Object tab, click the Parent Deformer field, and type a few letters.
	:Crop: The Relations section.
	:Save as: ``images/editors/properties_relations.png``
	:Caption: Binding a drawable to a deformer.

Parent Part
-----------

The part that the item is in.  Every kind of item has it.

* For a **drawable**, it is the part that holds the drawable.  Changing it moves the drawable to the end of the new part, which changes its place in the draw order of that part, as it does in Cubism.
* For a **part**, it is the part that holds it.  A top-level part shows no parent.  Clear the field to move a nested part out to the top level.  The part itself and the parts inside it are not in the list.
* For a **deformer**, it is the part that the deformer belongs to in the organization of the rig.  That is separate from the deformers it hangs on, which :guilabel:`Parent Deformer` sets.

Clearing the field of a drawable moves it out of every part.  The same moves can be made in the Outliner by dragging.  See :doc:`/editors/outliner`.

Parent Deformer
---------------

The deformer that the item is attached to.  The item follows it as it moves, bends, or turns.  Drawables and deformers have it.  A part does not.

* For a **drawable**, it is the deformer that moves the drawable.
* For a **deformer**, it is the deformer that holds it.  The deformer itself and the deformers inside it are not in the list, because they would make a loop.

A change keeps the item where it rests, with its keyed motion, and shows the :guilabel:`Keep in Place` strip.  Clear the strip's checkbox and the item keeps its numbers and follows its new parent instead.  See :doc:`/interface/operation_strip`.

Picking and Clearing
--------------------

The field is a search box.  Click it, type part of a name, and use :kbd:`Up` and :kbd:`Down` to move through the matches, then :kbd:`Enter` to take the one that is highlighted.  :kbd:`Escape` leaves the field as it was.  The list marks each part and each kind of deformer with its own icon.

* The **x** at the end of the field clears the relation.
* The **dropper** beside it picks the item from the screen.  Click it, and then click the item you want.  A label near the pointer names what a click would take, such as ``Deformer: Body Warp``.

A **part** can be taken from a drawable in the 2D Viewport, which gives the part that holds it, or from a row of the Outliner.  A **deformer** is taken from a row of the Outliner.  A pick can take an item that cannot be selected in the viewport.  :kbd:`Escape` or a right-click ends the pick without taking anything.  While a pick is on, a click on something that the field does not accept is ignored and the selection stays as it is, so the Properties editor does not change under you.

Edit-Mode Behavior
==================

The rows of :guilabel:`Transform` change things as whole objects, so they work in Object Mode only.

* In **Edit Mode** and **Pose Mode** they are dimmed and show the item.  In Edit Mode they show it at rest, because Edit Mode pins the pose.
* In **Object Mode** they are dimmed too while any parameter is away from its default.  A written value has to be worked back through the chain of the item's deformers, and that is exact only at the default pose.  Set the parameters back, for example with :guilabel:`Reset All` in the Parameters editor, and the rows can be edited again.  See :doc:`/editors/parameters`.

:guilabel:`Relations` and :guilabel:`Base Angle` have no such rule.

.. seealso::

	* :doc:`/editors/viewport_2d/sidebar`
	* :doc:`/editors/outliner`
	* :doc:`/modeling/transforming`
	* :doc:`/editors/properties/data_tab`
