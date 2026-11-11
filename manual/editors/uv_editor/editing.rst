***********
Editing UVs
***********

In Edit Mode the UV Editor changes the **texture coordinates** of a mesh: the UVs that say which part of the picture each vertex shows.  Moving a vertex here does not move it in the 2D Viewport.  It changes which pixels the vertex shows, so the art slides, turns, or stretches under the mesh.  Use it to fit a mesh to its art, and to make two meshes show one piece of art, such as both eyes from one eye texture.

Edit Mode is shared by all the editors.  Enter it on a drawable that has a mesh with :kbd:`Tab` in the 2D Viewport, and the UV Editor shows the meshes you are editing.  See :doc:`/modeling/modes` and :doc:`/editors/uv_editor/index`.

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: The UV Editor in Edit Mode, with the wireframe of two meshes over an atlas page, some vertices selected in the accent color, the UV cursor, and the badge at the top while a Grab is in progress with the proportional circle shown.
	:Setup: Enter Edit Mode on two drawables, select some vertices, turn on proportional editing, and press G over the UV Editor.
	:Crop: The UV Editor area, with its header.
	:Save as: ``images/editors/uv_editing.png``
	:Caption: Editing UVs.

Selecting and Editing Elements
==============================

The selection is **one selection** for the UV Editor and the 2D Viewport.  A vertex selected in one is selected in the other, and the select mode is shared too: choose :guilabel:`Face Select Mode` in the UV Editor and the 2D Viewport switches with it.  The mode buttons are in the header of the UV Editor in Edit Mode.

* **Click**, **box select** (:kbd:`B`), **circle select** (:kbd:`C`), and **select linked** (:kbd:`L` under the pointer, :kbd:`Ctrl-L` for the selection) work as they do over a mesh.  See :doc:`/modeling/selecting`.  A UV island is a part of the mesh that is joined together, so select linked takes the whole island.
* :kbd:`G`, :kbd:`R`, and :kbd:`S` move, turn, and scale the selected texture coordinates in a modal gesture.  An axis lock and the pivot work as they do in the viewport.  Confirm with a click or :kbd:`Enter`, cancel with :kbd:`Escape` or a right-click.  The gesture streams to the 2D Viewport, so you see the art slide as you move.  See :doc:`/modeling/transforming`.
* :kbd:`Shift`-right-click puts the **UV cursor** on the page.  It is a marker in texture space, the twin of the 2D cursor.  It is one point on the art wherever it is seen, on a page or on a source layer.  The :guilabel:`2D Cursor` row of the overlays hides the marker, and the pivot and the snaps go on using it.
* The header's :guilabel:`Pivot Point` and its snap menu are the shared ones.  See :doc:`/interface/pie_menus`.

Each confirmed gesture is one undo step: ``Move UVs``, ``Rotate UVs``, or ``Scale UVs``.  It also shows an operation strip with the numbers.  See :doc:`/interface/operation_strip`.

Only the meshes that are **on the shown picture** can be edited.  Over a page, these are the meshes drawn from that page.  Over a source layer, these are the drawables that share that layer.  If none of the meshes you are editing is on it, the commands say ``Nothing to edit here.  None of the meshes you are editing are on the page or layer being shown.``  Pick the page of the mesh with the texture selector.  See :doc:`/editors/uv_editor/texture_selector`.

If the selection has no texture coordinates to edit, a gesture says ``The selection has no editable UVs.``

Mirroring
=========

A mirror reflects the selected texture coordinates about the pivot, in one undo step, ``Mirror UVs``.  It makes a flipped copy of a region: copy a mesh, mirror its UVs, and it shows the same art the other way round.  Both commands are in the palette and in the context menu of the UV Editor as :guilabel:`Mirror X` and :guilabel:`Mirror Y`.  They have no shortcut, because a flip you do by hand is :kbd:`S`, an axis, and a drag through the pivot.  You can give them one in :guilabel:`Keybindings`.  See :doc:`/interface/keymap`.

The axis is the axis of the picture you are looking at.  Over a source layer that is rotated or mirrored on its page, the page's axes and the layer's axes differ, and the mirror follows what you see.  Only the meshes on the shown picture are mirrored, because a mesh on another page is measured in another space.

With nothing selected, a notice says ``Nothing is selected to mirror.``

Mirror UVs Horizontally
-----------------------

.. admonition:: Reference
	:class: refbox

	:Mode: Edit Mode
	:Menu: Command palette

Reflects the selection left to right, about the pivot.  In the context menu it is :guilabel:`Mirror X`.

Mirror UVs Vertically
---------------------

.. admonition:: Reference
	:class: refbox

	:Mode: Edit Mode
	:Menu: Command palette

Reflects the selection top to bottom, about the pivot.  In the context menu it is :guilabel:`Mirror Y`.

Snapping
========

The :kbd:`Shift-S` pie, and the snap menu in the header, move things to exact places.  In Edit Mode they act on the selected texture coordinates and on the UV cursor:

* :guilabel:`Selection to Pixels` and :guilabel:`Cursor to Pixels` land on the pixels of the shown picture, which are texels of the page, or of the artwork over a source layer.
* :guilabel:`Selection to Grid` and :guilabel:`Cursor to Grid` round to the nearest line of the area's grid, the minor lines that the grid draws.  The grid is set in :guilabel:`Viewport Overlays`, in texels.  See :doc:`/editors/viewport_2d/overlays`.
* :guilabel:`Selection to Cursor` puts every selected coordinate on the cursor.  :guilabel:`Selection to Cursor (Keep Offset)` moves them together, so that their median lands on the cursor and they keep their shape.
* :guilabel:`Cursor to Selected` puts the cursor on the median of the selection.

A snap of the selection is one undo step.  The seven choices are listed in :doc:`/interface/pie_menus`, and :doc:`/modeling/snapping` says more.  In Object Mode the same choices move the art on its page instead.  See :doc:`/editors/uv_editor/placement`.

Proportional Editing
====================

Proportional editing moves the texture coordinates near the selection a little, by distance.  It works in Edit Mode, in the UV Editor as it does in the 2D Viewport: :kbd:`O` turns it on and off, and :kbd:`Alt-O` switches :guilabel:`Connected Only`.  The falloff curve and :guilabel:`Connected Only` are shared with the viewport.  See :doc:`/modeling/proportional_editing`.

The **size** of the influence is the one thing the UV Editor keeps for itself, because the viewport measures it in world units and a texture in texels.  It is in texels, in the :guilabel:`Proportional Size` row of the header, and the wheel changes it during a gesture.  Each picture keeps its own size: going to another page, or to a source layer, brings back the size that you left there.  The size is not saved with the puppet file.

View-Only in Pose Mode
======================

In Pose Mode the UV Editor only shows.  Posing has nothing to do with texture, so nothing here can be selected or moved, the element controls leave the header, and no gesture, snap, or pie opens.  You can still change the picture and navigate.  See :doc:`/modeling/modes`.

.. seealso::

	* :doc:`/editors/uv_editor/index`
	* :doc:`/modeling/snapping`
	* :doc:`/modeling/proportional_editing`
	* :doc:`/interface/pie_menus`
