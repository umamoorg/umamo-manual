**********
Navigation
**********

Navigating is changing what part of the canvas the viewport shows, and how large.  It never changes the model.  The mouse does it in the viewport itself, and a set of view commands does it from the keyboard, the palette, and the context menu.  The UV Editor navigates in the same way.

Mouse
=====

* **Wheel.**  Zooms in and out, toward the pointer, so the point under the pointer stays where it is.  Each notch zooms by the :guilabel:`Zoom Step`.  With :kbd:`Shift` held, each notch takes the larger :guilabel:`Coarse Zoom Step`.
* **Middle button.**  Drag with the middle button to pan.

The mouse navigates the area that the pointer is over, and navigation is not an undo step.  Zooming with some touchpads is known to be jumpy.  The commands below zoom in steady steps.

View Commands
=============

These commands act on the area under the pointer, which can be a 2D Viewport or a UV Editor.  See :doc:`/interface/window_system`.

Fit View
--------

.. admonition:: Reference
	:class: refbox

	:Menu: Command palette
	:Shortcut: :kbd:`Ctrl-0`

Frames the whole model in the area, centered.  In a UV Editor it frames the page or artwork that it shows, and widens to take in any mesh that reaches past it.

Frame All
---------

.. admonition:: Reference
	:class: refbox

	:Menu: Command palette
	:Shortcut: :kbd:`Home`

Frames everything that the editor under the pointer has.  Over a viewport or a UV Editor it is the same as :guilabel:`Fit View`.  Over the Keyform Sheet it frames all of its keys.  See :doc:`/editors/keyform_sheet`.

Frame Selected
--------------

.. admonition:: Reference
	:class: refbox

	:Menu: Context menu
	:Shortcut: :kbd:`NumpadDecimal`

Frames the selection.  In a 2D Viewport it frames what is selected, and in a UV Editor it frames the selected texture coordinates.  It does nothing when nothing is selected.

Actual Size (100%)
------------------

.. admonition:: Reference
	:class: refbox

	:Menu: Command palette
	:Shortcut: :kbd:`Ctrl-1`

Sets the zoom to 100%, where one pixel of the canvas is one pixel of the screen, with the view centered.

Zoom In
-------

.. admonition:: Reference
	:class: refbox

	:Menu: Command palette
	:Shortcut: :kbd:`Ctrl-Equals`

Zooms in one step about the center of the area.  :guilabel:`Zoom In (Large Step)` takes the coarse step, on :kbd:`Ctrl-Shift-Equals`.

Zoom Out
--------

.. admonition:: Reference
	:class: refbox

	:Menu: Command palette
	:Shortcut: :kbd:`Ctrl-Minus`

Zooms out one step about the center of the area.  :guilabel:`Zoom Out (Large Step)` takes the coarse step, on :kbd:`Ctrl-Shift-Minus`.

Zoom Region
-----------

.. admonition:: Reference
	:class: refbox

	:Menu: Command palette
	:Shortcut: :kbd:`Shift-B`

Arms the tool.  Then drag a box in the area, and the view zooms so that the box fills it.  :kbd:`Escape` puts the tool away without zooming.

Zoom Step Settings
==================

The size of a step is set in :menuselection:`Edit --> Settings…`, in the :guilabel:`Viewport` category:

:guilabel:`Zoom Step (%)`
	The step of one wheel notch, from 0.1 to 100 percent.  The default is 1.

:guilabel:`Coarse Zoom Step (%)`
	The step with :kbd:`Shift` held, and of the Large Step commands.  The default is 5.

See :doc:`/interface/settings`.

Per-Area Cameras and the Zoom Readout
=====================================

Every area has a view of its own, so two 2D Viewports can look at two parts of the model, one close and one far.  The first time that an area shows the model, it fits it.  After that the area keeps its view.

An area that you switch between a 2D Viewport and a UV Editor keeps a view for each, because the model's canvas and a texture page do not share coordinates.  The views are saved in the puppet file, so the file reopens with the same views.  See :doc:`/files/uma`.

The percentage at the bottom left of the area is the zoom of its view.  Hide it, with the other chips, by turning off :guilabel:`General Information` in the overlays.  See :doc:`/editors/viewport_2d/overlays`.

Navigation During a Transform
=============================

While a transform, a select tool, or Zoom Region is in progress in an area, that area does not pan or zoom, and the wheel and the middle button do something else there.  In an Edit Mode transform with proportional editing, the wheel changes the size of its influence.  In the Circle Select tool, it changes the size of the brush, and the middle button erases from the selection instead of panning.  Finish or cancel the operation to navigate again.

Another area is not affected.  You can pan and zoom a second viewport while a transform runs in the first.

Pen and Touch
=============

The view is panned with the middle button and zoomed with the wheel, which a pen or a finger does not have.  Pinch and two-finger gestures are not built yet.  Use the view commands from the menu or the palette instead.  See :doc:`/interface/pen_and_touch`.

.. seealso::

	* :doc:`/editors/viewport_2d/overlays`
	* :doc:`/editors/uv_editor/index`
	* :doc:`/interface/settings`
	* :doc:`/interface/pen_and_touch`
