*****************************
Pose Mode and Keying Lattices
*****************************

Pose Mode is how a warp deformer is made to move.  You set the parameters to a pose, you shape the lattice of the warp so that the art looks right at that pose, and you key it.  After the key, the warp has that shape there, and Umamo blends between that key and the others as the parameter moves.  This page is the whole path, from entering the mode to the key.  The mode itself is in :doc:`/modeling/modes`, and the keys are in :doc:`/rigging/keyforms`.

Entering Pose Mode
==================

Press :kbd:`Ctrl-Tab` over the 2D Viewport, or choose :guilabel:`Pose Mode` in the mode list of its header.  On macOS the chord is the real :kbd:`Control` key and not :kbd:`Cmd`.  Pose Mode opens on the selected warp deformers that the pose draws.  With none selected it opens on the warp you posed last, or the first warp that is drawn, and selects it.  If the document has no deformer at all, it refuses: ``Pose mode needs a deformer to pose.``

Unlike Edit Mode, Pose Mode does not hold the pose still.  The sliders in the Parameters editor work, the viewport shows the model at the pose they give, and the lattice that you open is the lattice **as posed**: skewed, not at rest.  Only the warps that were opened can be shaped.  The others are drawn idle if the :guilabel:`Deformers` overlay is on, and they are only for looking at.

To pose another warp without leaving the mode, put the pointer over it and press :kbd:`Alt-Q`.  When two or more lattices are under the pointer, a list opens to pick one.  :kbd:`Tab` goes to Edit Mode on the same warp, at rest, and :kbd:`Tab` again comes back to Pose Mode at the pose.  :kbd:`Ctrl-Tab` leaves for Object Mode.

Posing a Lattice
================

The lattice is edited like a mesh in Edit Mode.  The select modes :kbd:`1`, :kbd:`2`, and :kbd:`3` choose points, grid lines, or cells.  Click, box, and circle select, :guilabel:`Select All`, :guilabel:`Invert Selection`, and :guilabel:`Select Linked` all work.  A click on empty canvas clears the points, and not the object selection.

Then move them.  :kbd:`G`, :kbd:`R`, and :kbd:`S` grab, rotate, and scale; :kbd:`Shift-V` slides a point along its grid line; the pivots, proportional editing, the snaps, and the :guilabel:`Vertex` and :guilabel:`Median` fields of the sidebar all work.  Select every point and press :kbd:`G` to move the whole lattice at the pose.  See :doc:`/modeling/transforming`, :doc:`/modeling/proportional_editing`, and :doc:`/modeling/snapping`.

Two things are different from Edit Mode:

* **The art follows live.**  In Edit Mode the art does not move while you shape the lattice.  Here that is the point: you see what the warp does to the art at this pose.  The art of a warp inside the one you shape, and of the warps nested in that, follows as well.
* **The shape is for this pose.**  What you do is stored for the value that the parameters have now, and not for the rest.

Each confirmed edit is one undo step, called ``Pose: Move Lattice Points``, ``Pose: Scale Lattice Points``, ``Pose: Rotate Lattice Points``, or ``Pose: Slide Lattice Point``.  The operation strip shows its numbers and runs the edit again from where it started.  See :doc:`/interface/operation_strip`.

Pending (Unkeyed) Edits
=======================

A shape that you made is **pending** until it is keyed.  It is shown, it is not stored in the warp, and Umamo makes sure you can see that.

* The lines of the cage turn **orange**.
* The Keyform Sheet shows an orange ring on the warp's :guilabel:`Geometry` track at the playhead.  If the warp was not keyed on the targeted parameter, its row appears for the ring.
* The :guilabel:`Lattice` row in the Data tab of the Properties editor turns orange.
* A pending shape does not mark the document as changed.

A pending shape also shows in Object Mode, in orange, with the art posed.  In Edit Mode it is not shown: Edit Mode is the rest.  It comes back when you return to Pose Mode.

It is **lost** when the pose changes, which means a slider moved, a value typed, or a click on a key mark in the Keyform Sheet.  Umamo then says so near the pointer, ``Moving the pose discarded 1 unkeyed lattice edit(s).  Undo to bring them back.``, and Undo brings back both the pose and the shape.  It is also lost, without a notice, when something else rewrites that warp: moving it in Object Mode, reshaping it in Edit Mode, resizing it, keying it, re-parenting it, or deleting it.

A pending shape is **not saved**.  A UMA file that is saved with one held reopens in Pose Mode on the same warps with nothing held.  Key it first.

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: Pose Mode on a warp with a shape that is not keyed: the cage in orange over the art, the Keyform Sheet with the orange ring on the warp's Geometry track at the playhead, and the Lattice row of the Properties editor in orange.
	:Setup: Open a model with a keyed head or body warp, target a parameter such as Angle X, set it between two keys, press Ctrl-Tab, select the top row of points, and press G and confirm.
	:Crop: The 2D Viewport, the Keyform Sheet, and the Properties editor.
	:Save as: ``images/rigging/pose_pending.png``
	:Caption: A shape that has been made and not keyed.

Keying the Pose
===============

Target the parameter that the key should be on, and key the shape.

* Press :kbd:`I` over the 2D Viewport.  It keys the lattice of every posed warp, and also any opacity or color of those warps that you edited and have not keyed.  A key appears on the Geometry track at the playhead, the orange goes, and the art keeps its shape.  It is one step, ``Insert Keyframe``.
* Press :kbd:`K` for the Insert Key pie, to key the lattice, the opacity, the colors, or all of them.  See :doc:`/rigging/keyforms`.
* Press :kbd:`I` over the :guilabel:`Lattice` row of the Properties editor, or over the warp's Geometry track in the Keyform Sheet.  The shape is keyed at the playhead wherever the pointer is on the track.
* Press :kbd:`Alt-I` over the viewport to take the key at the pose away again, together with the keys of any values still held on the posed warps.  A warp's last axis is never dropped, so a key that would do it is refused.

A warp that was not keyed on the targeted parameter **gains it**: three keys appear at the minimum, the default, and the maximum, each holding the shape the warp had, so that nothing changes elsewhere, and the key at the pose holds your shape.  A warp that is keyed on several parameters stores the shape in the one cell where the pose sits.

With no parameter targeted, the notice is ``Select a parameter to key on.``  With a linked pad targeted, Umamo asks which axis at the pointer before it writes.  Keying with several warps posed keys them all in one step.

A key stores the shape that you see **minus the blend shapes** the warp has at the pose, so that a blend shape is not keyed into the lattice by accident.  See :doc:`/rigging/blend_shapes`.

Clearing Pose Edits
===================

.. admonition:: Reference
	:class: refbox

	:Mode: Pose Mode
	:Menu: Context menu

:guilabel:`Clear Pose Edits` drops every edit that is not keyed, the shapes of the lattices and any opacity or color you typed, as one undo step.  It is in the command palette too and has no shortcut.  It is greyed when nothing is held.  Undo brings the edits back.

Moving Parameters While Posing
==============================

Pose Mode lets the sliders move, because choosing the pose is part of the work.  The order that works is: **pose first, then shape, then key**, and then go on to the next pose.  If you move the parameter after you have shaped and before you have keyed, you lose the shape.

To check a key, move the slider away and back to it, or click its mark in the Keyform Sheet, which also puts the parameter exactly on the key.  At the keys the shape is the one that you keyed, and between two keys it is a blend.

Rotation Deformers Are Not Poseable
===================================

Pose Mode shapes the lattices of warp deformers, and nothing else.  A rotation deformer is not opened, even when it is selected.  Its opacity, colors, and flips can still be keyed from the Properties editor, from Object Mode or Pose Mode.  See :doc:`/rigging/deformers`.

.. seealso::

	* :doc:`/modeling/modes`
	* :doc:`/rigging/keyforms`
	* :doc:`/rigging/deformers`
	* :doc:`/editors/keyform_sheet`
