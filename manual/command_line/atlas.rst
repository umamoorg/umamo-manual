*****
atlas
*****

``atlas`` packs the layers of an artwork file into texture atlas pages, the way a model's textures are built.  It writes the pages and a report of where every layer went, and then proves that the pages are right by reading each packed layer back out of its page and comparing it with the pixels it came from.

It is the packer on its own, with nothing else around it.  Inside the editor the same packer is behind :doc:`/artwork/atlas_packing`.

Synopsis
========

.. code-block:: text

	atlas <file> [<directory>] [options]

``file`` is a PSD, CLIP, or KRA file, or a flat image.  The command stops with a usage error for a model.  For example:

.. code-block:: bash

	./gradlew -q :cli:run --args="atlas art.psd out/ --preview"

This writes into ``out/art/``, a new folder named after the file.

Options
=======

.. list-table::
	:header-rows: 1

	* - Option
	  - Effect
	  - Default
	* - ``--page-size=N``
	  - The side of the square page to pack against, in pixels.
	  - 4096
	* - ``--gutter=N``
	  - The empty space kept around every tile and at the edge of the page, in pixels.
	  - 2
	* - ``--extrude=N``
	  - How many pixels of the gutter around each tile repeat the tile's edge colors, at no opacity.  This keeps the edges from fringing when the texture is filtered.
	  - 2, or the gutter if that is smaller
	* - ``--rotate``
	  - Lets a tile be turned a quarter turn when it packs tighter that way.
	  - Off
	* - ``--visible-only``
	  - Leaves out the layers that are hidden by their own eye or by the eye of a group that holds them.
	  - Off
	* - ``--no-shrink``
	  - Keeps every page at the full ``--page-size``.  Without it a page is cut down to the space that its tiles use.
	  - Off
	* - ``--preview``
	  - Also writes ``preview.png``.  See below.
	  - Off

The command does not offer the packer's other settings.  Pages are always square, and a page that is cut down rounds up to a power of two.  A pixel counts as art when it has any opacity.

Layers that carry no pixels, such as text and adjustment layers, are not packed.  The command prints a note with how many there were.

Output Files
============

``atlas`` writes these files into the new folder:

``page_00.png``, ``page_01.png``, ...
	The atlas pages, numbered from 0.

``placements.txt``
	The report of where every layer went, described below.

``preview.png``
	With ``--preview``: the whole canvas, put together again from the packed pages.  Layers are stacked with the top layer last, using plain alpha blending.  Blend modes and layer opacity are ignored, so a document that relies on them will not look the same as it does in its own application.  That is expected and is not a fault in the packing.  A canvas of more than 128 million pixels is too large for a preview, and the command says so and skips it.

The command prints a line for each file that it writes:

.. code-block:: text

	Packing 6 layer(s) of art.kra (1024x1024 canvas)
	Wrote out/art/page_00.png (1024x1024, 46% occupancy, 29074 bytes)
	Wrote out/art/placements.txt (6 placements, 0 skipped)
	Verified 6/6 tiles byte-exact

The occupancy is how much of the page the tiles fill.

placements.txt
--------------

``placements.txt`` is plain text.  Lines that start with ``#`` are comments, and the rest are separated by tabs.

.. code-block:: text

	#atlas placements for art.kra
	#options pageSize=4096 gutter=2 extrude=2 rotate=false shrink=true
	#page 0 1024x1024 46% occupancy
	#page	x	y	width	height	turns	trimX	trimY	key	name
	0	567	426	279	47	0	60	20	{5e7e171e-bbd2-41f2-a1db-012f9eea6e16}	Paint Layer 1
	0	2	2	586	132	0	9	62	{e08e67e5-5a4e-4cb7-96bd-5e543e28082a}	Paint Layer 2

After the comments there is a row for each layer that was packed:

.. list-table::
	:header-rows: 1

	* - Column
	  - Meaning
	* - ``page``
	  - The number of the page that the layer is on.
	* - ``x``, ``y``
	  - The position of the tile's top left corner on the page.  The gutter is not included.
	* - ``width``, ``height``
	  - The size of the tile on the page, after any turn.
	* - ``turns``
	  - 0 if the tile is upright, 1 if it was turned a quarter turn counter-clockwise.
	* - ``trimX``, ``trimY``
	  - Where the packed pixels start inside the layer.  A tile holds only the part of the layer that has any opacity, and these say how much was trimmed off the left and the top.
	* - ``key``, ``name``
	  - The layer's id and its name.

A layer that was not packed has a line of its own at the end, ``#skipped``, followed by the reason, the layer's key, and its name.

Skipped Layers
--------------

A layer that is not packed is reported and never dropped without a word.  The command prints a note for each reason, and ``placements.txt`` names each layer.  There are two reasons:

``NoOpaquePixels``
	Nothing in the layer has any opacity.

``LargerThanPage``
	The layer's art and its gutter do not fit on a page of this size, even by itself.  Try a larger ``--page-size``.

A file where every layer is skipped is not an error.  The command writes ``placements.txt`` and no pages.

Verification and Exit Codes
===========================

A page that does not reproduce the art it was built from is worthless however good it looks, so the check is the reason that the command exists.  Once the pages are written, ``atlas`` reads every packed tile back out of the page that it is on, undoing any turn, and compares it with the layer's pixels, byte for byte.

.. list-table::
	:header-rows: 1

	* - Code
	  - When
	* - 0
	  - Every tile matched.  The last line is ``Verified N/N tiles byte-exact``.
	* - 1
	  - At least one tile did not match.  The command prints ``VERIFY FAILED``, and the first ten tiles that differ, to standard error.
	* - 2
	  - A usage error.  The file is not artwork, an option is wrong, or the file has no layers of pixels at all.

.. seealso::

	* :doc:`/artwork/atlas_packing`
	* :doc:`/command_line/mesh`
