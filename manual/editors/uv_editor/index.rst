*********
UV Editor
*********

The UV Editor shows the texture of the model, and how the meshes lie on it.  It draws a page of the atlas, or a piece of the source artwork, and over it the outline of every mesh whose texture coordinates address that picture.  Use it to fit a mesh to its art, and in Object Mode to place the art on its page.

.. toctree::
	:maxdepth: 1

	texture_selector
	placement
	editing

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: The UV Editor in Object Mode with an atlas page, the islands of several meshes drawn over it with one selected, the header with the texture selector, the Find by Artwork button, the pivot, snap, and overlay controls, and the zoom readout.
	:Setup: Open a model that has been packed into an atlas, select a drawable, and open the Texture workspace.
	:Crop: The UV Editor area, with its header.
	:Save as: ``images/editors/uv_editor.png``
	:Caption: The UV Editor.

What It Shows
=============

The picture is one of two things, and you choose which with the texture selector.

* A **page** of the atlas: the sheet that the renderer samples.  By default the editor shows the page of the drawable you are working on.
* The **source layer**: the artwork of that drawable as it was before it was packed.

The meshes are drawn over the picture as **islands**, the outlines of their triangles.  The picture and the islands are drawn by the same renderer as the 2D Viewport.  Zoom and pan with the wheel and the middle button, and use the view commands, as in the viewport.  The view belongs to the area, and the editor keeps a view for each page and layer, so a page you come back to is as you left it.  The grid is in texels, and it is set in the overlays.  See :doc:`/editors/viewport_2d/navigation` and :doc:`/editors/viewport_2d/overlays`.

The selection is shared with everything else.  A vertex or a drawable selected in the UV Editor is selected in the 2D Viewport and in the Outliner, because texture coordinates belong to the vertices, one for each.  Two UV Editors can be open at once, each with its own picture.

Header Controls
===============

The header has, left to right:

Texture selector
	Chooses the picture: :guilabel:`Follow Selection`, :guilabel:`Source Layer`, or a page.  See :doc:`/editors/uv_editor/texture_selector`.

:guilabel:`Find by Artwork`
	A magnifier button that finds a drawable by the layer it is drawn from.  It is there only when the document keeps its source artwork.

Select mode buttons
	Vertex, edge, and face select mode.  They are only there in Edit Mode, and they are the shared ones: choosing one here chooses it in the 2D Viewport too.

:guilabel:`Pivot Point`
	The pivot for turns and scales.  Shared with the viewport.  See :doc:`/interface/pie_menus`.

:guilabel:`Snap`
	The UV snap menu, with the choices of the :kbd:`Shift-S` pie.  See :doc:`/editors/uv_editor/editing`.

Proportional editing
	The toggle, the falloff, and the :guilabel:`Proportional Size` in texels.  Only in Edit Mode.  See :doc:`/modeling/proportional_editing`.

:guilabel:`Show Overlays` and :guilabel:`Viewport Overlays`
	The overlays of this area, the same control as in the 2D Viewport, with fewer rows.  See :doc:`/editors/viewport_2d/overlays`.

The pivot, the select mode, and the proportional editing are the session's, so the viewport and the UV Editor agree.  The picture, the proportional size, and the overlays are the area's.

Object Mode and Edit Mode
=========================

The mode is the mode of the whole editor, and the UV Editor works differently in each.

In **Object Mode** the islands of every visible mesh on the picture are drawn, and each is a click target for its drawable.  With a page shown, the art can be moved, turned, scaled, and pinned.  See :doc:`/editors/uv_editor/placement`.

In **Edit Mode** only the meshes that you are editing are drawn, with their vertices, edges, and faces, because those are the ones whose coordinates can move.  You select elements and transform them.  See :doc:`/editors/uv_editor/editing`.

In **Pose Mode** the editor only shows.  Posing has nothing to do with the texture.  You can change the picture and navigate, and nothing else.

A mesh that is hidden is neither drawn nor picked in Object Mode.  A mesh without texture coordinates is never shown.

Context Menu
============

A right-click on the picture, when no gesture is in progress, opens a menu of the operations of this editor:

* :guilabel:`Mirror X` and :guilabel:`Mirror Y`, which are dimmed outside Edit Mode.
* :guilabel:`Generate Mesh from Art` and :guilabel:`Generate Quad Mesh`, in either mode, each dimmed when its command is not available.  They show their shortcut when they have one.

The menu has only the operations of the editor.  The right-click menu of the area itself, with the layout commands, is on the header.  See :doc:`/interface/window_system` and :doc:`/modeling/generate_mesh`.

Sidebar
=======

:kbd:`N` opens the sidebar of the area under the pointer.  Its :guilabel:`Item` tab shows the selected texture coordinates in Edit Mode, and the placement of the art in Object Mode.  Its :guilabel:`View` tab has the UV cursor.  See :doc:`/editors/viewport_2d/sidebar`.

.. seealso::

	* :doc:`/editors/uv_editor/texture_selector`
	* :doc:`/editors/uv_editor/placement`
	* :doc:`/editors/uv_editor/editing`
	* :doc:`/artwork/atlas_packing`
