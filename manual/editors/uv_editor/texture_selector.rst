****************
Texture Selector
****************

The UV Editor draws the texture coordinates of the meshes over a picture: a page of the atlas, or the artwork the page was packed from.  Two controls at the left of its header choose the picture.  The **texture selector** chooses by kind, and **Find by Artwork** chooses by looking for a layer by name.  The choice belongs to each UV Editor, so two of them can show two pages side by side.

.. figure:: /images/editors/uv_texture_selector.png

	The texture selector.

Pages and Source Layers
=======================

The selector is a button that names what the area shows now: :guilabel:`Follow Selection`, ``Page 2``, or :guilabel:`Source Layer`.  Click it to open the list.

:guilabel:`Follow Selection`
	Shows the page of the drawable you are working on.  See `Follow Selection`_.

:guilabel:`Source Layer`
	Shows the artwork layer of the drawable you are working on, as it was before it was packed.  The row is only in the list when the puppet keeps its source artwork, which a model opened from a MOC3 does not.

``Page 1 · 2048 × 2048 · 14 meshes``
	One row for every page of the atlas, with its size in pixels and the number of meshes that are drawn from it.  Choosing a page **pins** it: the area keeps showing that page whatever you select.

A pinned page, and the source layer, are saved with the puppet file.

Follow Selection
================

This is the default.  The page changes by itself to the page of the drawable you work on, so that clicking another part in the viewport brings its texture up.  The drawable is chosen in this order:

#. The active mesh of Edit Mode.
#. The active drawable of the selection.
#. The first drawable with a mesh, so that the area is not blank over a puppet with art.

A drawable that has no place on any page has no picture to show.  The area then shows an empty unit square, and the wireframe of its mesh is drawn over the grid.

The **Source Layer** view follows in the same way, and shows the artwork of the same drawable.

What is drawn over the picture depends on the mode.  In Object Mode, it is the islands of every visible mesh whose art is on the page, because those are the things you click.  In Edit Mode, it is only the meshes you are editing, because those are the ones whose texture coordinates can move.  A hidden mesh is neither drawn nor picked.  See :doc:`/editors/uv_editor/index`.

Find by Artwork
===============

The button with the magnifier opens a list of the layers of the source artwork, and selects the drawable that uses the one you choose.  It is there only when the puppet keeps source artwork.  It is a way to find a drawable by its picture, when you know the layer and not the name of the drawable.

* Type in the search box to narrow the list.  The search ranks the layers with the same rules as the command palette, so ``eye`` finds the eye layers as it finds the eye commands.  See :doc:`/interface/command_palette`.
* A row names the layer, its size in pixels, and how many meshes use it, such as ``Eye L · 256 × 256 · 2 meshes``.  Duplicated art is common, and the count shows that a row selects one of several.
* A row selects the first drawable that uses the layer.  It replaces the selection, so the selection and the picture follow it everywhere, in the viewport and in the Outliner too.
* A layer that no drawable uses is dimmed, because it selects nothing.
* ``No artwork matches`` means that the search found nothing.  ``This puppet has no source artwork.`` means that the list has no layers.

Texture Page Commands
=====================

Three commands in the command palette change the picture without the header.  They act on the UV Editor under the pointer, work in every mode, and have no shortcut.

:guilabel:`Next Texture Page`, :guilabel:`Previous Texture Page`
	Pin the page after, or before, the page now shown.  They wrap around from the last page to the first.

:guilabel:`Texture Page: Follow Selection`
	Takes the pin off.

See :doc:`/interface/command_palette`, and :doc:`/interface/keymap` to give them a shortcut.

Atlas Display versus Source Artwork
===================================

The two pictures hold the same art, in different places.

* The **page** is the atlas, the sheet that the renderer reads.  The meshes address it, and what you move here is what the model samples.  Art is packed on a page, and can be moved, turned, scaled, and pinned on it.  See :doc:`/editors/uv_editor/placement`.
* The **source layer** is the artwork as it came from the file, before it was packed.  Umamo works out where the mesh lies on it from the place of the art on its page, so the picture is the whole layer, at its size.

You can edit the texture coordinates over either.  An edit on the source layer is converted back through the place of the art on its page.  You cannot move the art over a source layer, because the layer is not a page: the editor says ``Show an atlas page in the UV editor to move placements.``  Show a page to move art.

The :guilabel:`Show source artwork` setting of the puppet is a different thing.  It decides what the viewports draw the model from, and has no effect on the UV Editor.  See :doc:`/editors/properties/document_tab`.

Pinned Selections That No Longer Exist
======================================

A pin can name a page that is not there any more, for example after a repack that needed fewer pages, or in a file saved by another version.  The area then behaves as :guilabel:`Follow Selection`, and the selector is labeled that way.  The pin is not thrown away, so a later repack that brings the page back finds it still set.  In the same way, :guilabel:`Source Layer` falls back to the page view when the drawable has no layer, and to :guilabel:`Follow Selection` when the puppet has no source artwork, so nothing goes blank.

.. seealso::

	* :doc:`/editors/uv_editor/index`
	* :doc:`/artwork/atlas_packing`
	* :doc:`/editors/properties/document_tab`
