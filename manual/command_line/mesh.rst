****
mesh
****

``mesh`` runs the art mesher over the layers of an artwork file and previews the meshes: for each layer, the number of vertices and triangles for each mesh, the quality of the triangles, and duration.
It is the mesher on its own, so it is the place to experiment with different settings on your artwork before you commit to them in the editor.  The editor's :doc:`/modeling/generate_mesh` command uses the same mesher.


Synopsis
========

.. code-block:: text

	mesh <file> [<directory>] [options]

``file`` is a PSD, CLIP, or KRA file, or a flat image.  The command stops with a usage error for a model.  For example:

.. code-block:: bash

	./gradlew -q :cli:run --args="mesh art.psd out/ --preset=fine --preview"

This writes into ``out/art-mesh/``, a new folder named after the file with ``-mesh`` added.

Only layers of pixels are meshed.  Layers are taken from the top of the stack down.

Options
=======

.. list-table::
	:header-rows: 1

	* - Option
	  - Effect
	  - Default
	* - ``--layer=NAME``
	  - Meshes only the layer that has exactly this name.  Put a name that contains spaces in quotes.  It throws a usage error when the file has no such layer.
	  - Every layer
	* - ``--preset=NAME``
	  - ``standard``, ``fine``, or ``coarse``.  This are settings that the overrides below start from.  The name is not case sensitive.
	  - ``standard``
	* - ``--visible-only``
	  - Leaves out the layers that are hidden by their own eye or by the eye of a group that holds them.
	  - Off
	* - ``--fill-holes``
	  - Meshes over the holes in the art, such as lace or a spider web, so that each piece is one solid sheet, instead of cutting the holes out.
	  - Off
	* - ``--no-strand-rungs``
	  - Meshes thin strands from their outline alone, and not as strips of rungs that pair up the two sides.
	  - Off
	* - ``--preview``
	  - Also writes a picture of each mesh over its layer.  See `Preview Colors`_.
	  - Off
	* - ``--scale=N``
	  - Magnifies the pictures by a whole number of times, at least 1.
	  - 1

``--fill-holes`` and ``--no-strand-rungs`` do not come from a preset.  A preset never turns them on or off.

Setting Overrides
=================

A preset is a set of settings.  Each of the following options replaces one of its values and leaves the rest alone.  Distances are in the pixels of the layer.

.. list-table::
	:header-rows: 1

	* - Option
	  - Sets
	  - Standard
	  - Fine
	  - Coarse
	  - Allowed
	* - ``--alpha-threshold=N``
	  - The least opacity, from 1 to 255, that counts as art.  Fainter pixels, such as stray eraser marks, are not meshed.
	  - 16
	  - 16
	  - 16
	  - 1 to 255
	* - ``--outline-spacing=N``
	  - The distance between the outline's vertices.
	  - 32
	  - 20
	  - 48
	  - More than 0
	* - ``--interior-spacing=N``
	  - The distance between the vertices of the inner ring and the lattice.
	  - 48
	  - 28
	  - 72
	  - More than 0
	* - ``--outer-margin=N``
	  - How far outside the art the outline runs.
	  - 4
	  - 3
	  - 6
	  - 0 or more
	* - ``--inner-margin=N``
	  - How far inside the edge of the art the inner ring runs.  0 for none.
	  - 8
	  - 6
	  - 12
	  - 0 or more
	* - ``--minimum-margin=N``
	  - The closest the outline may come to any art pixel.
	  - 2
	  - 1.5
	  - 3
	  - 0.5 or more
	* - ``--minimum-outline-points=N``
	  - The fewest vertices that one outline ring may have.
	  - 6
	  - 8
	  - 4
	  - 3 or more
	* - ``--vertex-budget=N``
	  - The most vertices that one mesh may have.
	  - 1024
	  - 1024
	  - 1024
	  - At least ``--minimum-outline-points``
	* - ``--minimum-angle=N``
	  - The angle, in degrees, that refinement brings every triangle up to by adding vertices.  0 turns refinement off.
	  - 20
	  - 24
	  - 15
	  - 0 to 33
	* - ``--interior-thinning-limit=N``
	  - When a mesh is over the vertex budget, how far the interior may thin, in outline spacings, before the outline thins with it.
	  - 4
	  - 4
	  - 4
	  - 1 or more
	* - ``--strand-width=N``
	  - The width of art below which it is a strand, meshed as rungs.
	  - 40
	  - 26
	  - 60
	  - More than 0

The alpha threshold, the least outline points, and the vertex budget are whole numbers.  The others can have a decimal point.  A value that is out of range stops the command with a usage error that names the setting.

The Report
==========

``mesh`` prints a line for each layer as it goes, then a summary, and writes the same results to ``mesh.txt`` in the new folder.  The first line says which settings are in effect, including those that the options cannot change.

.. code-block:: text

	Meshing 6 layer(s) of art.kra with ArtMeshSettings(alphaThreshold=16, outlineSpacing=32.0, ...)
	L 0 Paint Layer 8 576x192 60 77 1/41 0 5 0/0 0 1/18/16 3 21.03 0 0 0 0 93 -
	L 1 Paint Layer 5 512x320 84 115 1/50 0 7 2/14 0 2/14/12 8 21.03 0 0 0 0 33 -
	...
	smallest angles: [0, 5) 0, [5, 10) 0, [10, 15) 0, [15, 20) 0, [20, 25) 23, [25, 30) 29, ...
	Wrote out/art-mesh/mesh.txt
	Meshed 6/6 layer(s): 359 vertices, largest 84, smallest angle 21.03 degrees, 182 ms

On the screen the columns of a layer are separated by single spaces after an ``L``, so a layer name that contains spaces runs into its neighbors.  In ``mesh.txt`` the columns are separated by tabs.  It also has comment lines that start with ``#`` for the file and the settings, and the names of the columns.

.. list-table::
	:header-rows: 1

	* - Column
	  - Meaning
	* - ``order``, ``name``, ``raster``
	  - The layer's order, counted from the top of the stack where 0 is the top-most layer, its name, and the size of its pixels.
	* - ``vertices``, ``triangles``
	  - The size of the mesh.
	* - ``outline``
	  - The outline rings and the number of vertices in them, as ``rings/vertices``.  There is a ring for each island of art and a ring for each hole that is cut out.
	* - ``meshedOver``
	  - The outline rings that were left out because they were holes too small for the outline spacing, and any ring inside one.  These holes are meshed over.  It is always 0 with ``--fill-holes``.
	* - ``refined``
	  - Outline chords that were split because they came too close to the art or cut it off.
	* - ``inner``
	  - The inner rings and their vertices, as ``rings/vertices``.
	* - ``lattice``
	  - The vertices of the interior lattice.
	* - ``strands``
	  - The thin strands that were meshed as strips, the rungs in them, and the vertices on their centerlines, as ``strands/rungs/centerline``.
	* - ``steiner``
	  - The vertices that refinement added to reach the minimum angle.  They are the last vertices of the mesh.
	* - ``minAngle``
	  - The smallest angle of any triangle in the mesh, in degrees.
	* - ``under5``, ``under10``, ``under20``
	  - How many triangles have a smallest angle of less than 5, 10, and 20 degrees.
	* - ``unfixable``
	  - The triangles that are still under the minimum angle and that refinement could not help, because the outline itself makes the angle or the spot is too tight to split.
	* - ``milliseconds``
	  - The time that the layer took.
	* - ``notices``
	  - What the mesher adjusted or could not do, separated by commas, or ``-`` for nothing.

A layer that got no mesh has ``-`` in the columns that need one.  The line that starts with ``smallest angles`` counts the triangles of all of the layers by their smallest angle, in buckets of 5 degrees.  A triangle with a larger smallest angle is better shaped, so the further to the right the counts sit, the better.

Notices
-------

.. list-table::
	:header-rows: 1

	* - Notice
	  - Meaning
	* - ``NothingOpaque``
	  - No pixel reached the alpha threshold, so there is nothing to mesh.  There is no mesh.
	* - ``OverBudget``
	  - No mesh within the vertex budget exists at these settings.  A layer of many separate specks does this, because each needs an outline ring of the smallest size.  There is no mesh.
	* - ``StructureCheckFailed``
	  - The mesh failed its final check and was withheld rather than risk leaving art uncovered.  There is no mesh.
	* - ``SpacingCoarsened``
	  - The mesh would have gone over the vertex budget, so the spacing was made larger.  The interior thins first, and only when the outline fills the budget by itself is the interior left to refinement.
	* - ``WorkingGridCoarsened``
	  - The layer was too large for the mesher's working grid at the cell size that the margins asked for.  A coarser cell was used, and the outline sits a little further out to keep its guarantee.
	* - ``InnerRingEdgesDropped``
	  - Some edges of the inner ring crossed the outline and were left out.  The inner ring only shapes the interior, so coverage is not affected.
	* - ``OutlineDensified``
	  - Outline rings crossed one another after they were simplified, so some stretches were kept at their full density.
	* - ``RefinementBudgetReached``
	  - The vertex budget ran out before every triangle reached the minimum angle.  The mesh is valid, and only some triangles are narrower than asked.

Preview Colors
==============

With ``--preview`` the command writes a picture for each mesh that was made.  The file is named from the layer's order, padded to three digits, and its name, in which every run of characters other than letters, digits, ``.``, ``_`` and ``-`` is replaced with an underscore, as in ``005-Paint_Layer_1.png``.

The layer is drawn on a checkerboard so that you can see where it is transparent, and the picture is larger than the layer wherever the outline runs outside of the art.

Magenta
	The outline: the edges on the boundary of the mesh.

Blue
	The interior edges.

Yellow
	The vertices.

Green
	The vertices that refinement added.

Orange
	A tint over each triangle with an angle smaller than the minimum angle.

A picture that would be larger than 128 million pixels, after ``--scale``, is skipped with a note.

Exit Codes
==========

.. list-table::
	:header-rows: 1

	* - Code
	  - When
	* - 0
	  - The command ran.  Layers that got no mesh because they have nothing opaque or are over the vertex budget do not change this.  Read the ``notices`` column.
	* - 1
	  - A mesh was withheld because it failed its final structural check.  The command prints ``FAILED`` and how many, to standard error.  The report is written anyway.
	* - 2
	  - A usage error: the file is not artwork, an option or a setting is wrong or out of range, the layer named by ``--layer`` is not there, or the file has no layers of pixels.

.. seealso::

	* :doc:`/modeling/generate_mesh`
	* :doc:`/command_line/atlas`
