********************
Proportional Editing
********************

Proportional editing moves, turns, or scales the vertices **near** the selection along with it, less the farther they are.  Move one vertex of a cheek and the skin around it follows in a smooth swell, where without it the vertex would be pulled out of the surface on its own.  It is a tool for shaping, and for any change that must blend into what is around it.

It works in Edit Mode and in Pose Mode, with Grab, Rotate, and Scale, on vertices and on lattice points.  It is not offered in Object Mode.  The UV Editor has it too; see :doc:`/editors/uv_editor/editing`.

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: A mesh in the middle of a grab with proportional editing on: one vertex pulled away, the vertices around it following by less, the circle of the reach drawn, and the badge at the top reading Proportional Smooth.
	:Setup: Open a model, enter Edit Mode on a drawable with a fine mesh, select one vertex, press O, press G, and move the pointer.
	:Crop: The viewport.
	:Save as: ``images/modeling/proportional.png``
	:Caption: Proportional editing during a grab.

Enabling It
===========

* Press :kbd:`O` over the viewport to turn proportional editing on and off.
* Or click the glyph in the proportional control of the header, which is in two halves.  The glyph toggles it, and the arrow opens a panel with the :guilabel:`Connected Only` check, the list of falloff curves, and :guilabel:`Proportional Size`.
* Or run :guilabel:`Toggle Proportional Editing` from the command palette.

A notice confirms the change: ``Proportional editing on.`` or ``Proportional editing off.``  While a transform is running, the badge at the top of the viewport adds the falloff and the size, such as ``Proportional Smooth · 200``.

The panel is dimmed while the tool is off, but it works, so you can set the falloff and the size before you turn it on.  The last setup is remembered when you turn it off and on, it is not an undo step, and it is saved with the document.  Turning it on or off does not change anything in the model by itself: it changes what the next transform does.

Falloff Curves
==============

The **falloff** is how the influence fades from full, at the selection, to nothing, at the edge of the reach.  Eight curves are offered.  Choose one in the panel of the header, with :guilabel:`Falloff` in the operation strip, or with a command of the palette, :guilabel:`Proportional Falloff: Smooth` and its seven companions.  :guilabel:`Smooth` is the first choice.

The table gives the influence half way between the selection and the edge of the reach.  The closer it is to 1, the more the vertices keep moving as far out as the edge.

.. list-table::
	:header-rows: 1

	* - Falloff
	  - Influence half way out
	  - Shape
	* - :guilabel:`Smooth`
	  - 0.5
	  - An S curve: soft at the selection and soft at the edge.
	* - :guilabel:`Sphere`
	  - 0.87
	  - Stays high, and falls away quickly at the edge, like a dome.
	* - :guilabel:`Root`
	  - 0.71
	  - Falls gently at first and steeply at the edge, and stays fuller than a straight line.
	* - :guilabel:`Inverse Square`
	  - 0.75
	  - Flat at the selection, and falling faster toward the edge.
	* - :guilabel:`Sharp`
	  - 0.25
	  - Falls steeply near the selection and flattens at the edge.  A narrow peak.
	* - :guilabel:`Linear`
	  - 0.5
	  - A straight line down to the edge.
	* - :guilabel:`Constant`
	  - 1
	  - No fade.  Everything inside the reach moves as much as the selection does.
	* - :guilabel:`Random`
	  - Between 0 and 0.5
	  - The linear fade, scaled by a number between 0 and 1 that each vertex has of its own.  It is the same every time for the same vertex.

Proportional Size
=================

The **size** is the reach: how far from the selection the influence goes before it is nothing.  It is a distance in pixels of the canvas, from 1 to 100000, and it starts at 200.

* Turn the **mouse wheel** while a transform is running to change it.  Each step makes it 1.1 times larger or smaller, so a step is a fair fraction of the size at any scale.  A circle shows the reach.
* Type it in the :guilabel:`Proportional Size` field of the panel in the header.
* Change it after the transform in the operation strip; see `Adjusting After the Fact`_.

The UV Editor keeps its own size, in texels, because a texture is measured in texels.  See :doc:`/editors/uv_editor/editing`.

Connected Only
==============

By default the reach is a distance in a straight line, so a vertex of the other cheek, or of a neighboring piece of art, can be moved because it is near in space.  :guilabel:`Connected Only` measures the distance **along the edges of the mesh** instead, so the influence spreads through the geometry that is joined to the selection and never jumps a gap.  Use it for a finger that is close to the next one.

Press :kbd:`Alt-O` to turn it on and off, tick it in the panel of the header, or run :guilabel:`Toggle Proportional Connected Only`.  The notices are ``Proportional editing: Connected only.`` and ``Proportional editing: All within radius.``

Adjusting After the Fact
========================

When a transform is confirmed, the operation strip lists its numbers and, below them, four rows for proportional editing: :guilabel:`Proportional Editing`, :guilabel:`Falloff`, :guilabel:`Proportional Size`, and :guilabel:`Connected Only`.  Change one and the transform is run again from where it started, so you can try the curves and sizes, and watch the mesh.  The change is part of the same undo step.  Open the strip with :kbd:`F9`, or click its title.  See :doc:`/interface/operation_strip`.

Current Limitations
===================

* Proportional editing does not apply to :guilabel:`Duplicate`, :guilabel:`Rip`, and :guilabel:`Vertex Slide`.  Duplicate and Rip begin with a Grab that ignores it, and Vertex Slide moves one vertex along an edge.
* The Cubism keymap preset does not bind :kbd:`O` or :kbd:`Alt-O`.  Use the header.  See :doc:`/interface/keymap`.

.. seealso::

	* :doc:`/modeling/transforming`
	* :doc:`/interface/operation_strip`
	* :doc:`/editors/uv_editor/editing`
