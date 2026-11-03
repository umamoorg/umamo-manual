***************
Operation Strip
***************

Many operations have a few numbers behind them, such as how far a grab moved or how fine a mesh is.  The operation strip shows them after the operation has run, and lets you change them.  Each change runs the operation again, from where it started, and replaces the result.  You can try a value, see what it does, and try another, without undoing and doing it over.

It works like the Adjust Last Operation panel of Blender.

What It Is
==========

The strip is a small card with the name of the operation as its title, such as ``Move Vertices`` or ``Generate Mesh from Art``.  Its rows are the settings of that operation.  Only the last operation has a strip, so there is never more than one.

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: The operation strip in the corner of the 2D Viewport, expanded, after a Grab in Edit Mode, with its title ``Move Vertices``, the Move X and Move Z rows, and the proportional editing rows.
	:Setup: Select a few vertices of a mesh in Edit Mode, turn on proportional editing, press G, move the pointer, and click.
	:Crop: The 2D Viewport area, with the strip at its bottom left.
	:Save as: ``images/interface/operation_strip.png``
	:Caption: The operation strip after a grab.

Where It Appears
================

The strip is in the bottom left corner of the area in which the operation ran, over the editor.  Only the work surfaces have one: the 2D Viewport and the UV Editor.  The strip keeps the pointer from reaching the editor under it, so its gaps do not click through.

An operation that you start from a panel, such as :guilabel:`Create Warp Deformer` in the Outliner's menu, or :guilabel:`Import Artwork` in the Sources editor, shows its strip in the work surface that the pointer touched last.  If the workspace has none, the strip has nowhere to show.

The strip is closed when it first appears, and shows only its title.  Click the title to open it, or press :kbd:`F9`.  Once you have opened it, it stays open for the next operations, until you close it.  Close it the same way.

If you switch to a workspace in which the area is not on screen, the strip is hidden.  It comes back when the area does.

Using It
========

Each row is a field like those of the Properties editor.  Drag across a number to change it, or type a value.  A checkbox toggles, and a list picks one choice.  Hold the pointer over a label for a description of what it does.

Two numbers that go together, such as the two factors of a scale or the rows and columns of a lattice, are drawn as a pair with a lock between them.  With the lock on, changing one changes the other in the same proportion.

A number is applied when you let go of it, or confirm what you typed.  Each applied value runs the operation again from the state it started from.  Only one step is added to the History for the operation, whatever the number of changes.  See :doc:`/editors/history`.

The strip belongs to the newest step in the History, and goes as soon as there is another.  Another operation takes it over, and so does a change of the selection, because selecting is a step too.  An undo, a redo, or a jump in the History ends it as well.  So adjust an operation before you select something else.

Adjust Last Operation
---------------------

.. admonition:: Reference
	:class: refbox

	:Menu: Command palette
	:Shortcut: :kbd:`F9`

Opens or closes the strip.  It is not available when the last operation has no strip.

Operations That Offer a Strip
=============================

These are the operations with a strip, and the rows of each.  The rows with a unit show it after the number: pixels, degrees, or percent.

Transform
---------

The title is the name of the step: ``Move Vertices``, ``Rotate Lattice Points``, ``Scale Objects``, ``Move UVs``, and so on.  See :doc:`/modeling/transforming`.

.. list-table::
	:header-rows: 1

	* - Row
	  - After
	  - What it sets
	* - :guilabel:`Move X`, :guilabel:`Move Z`
	  - A grab
	  - How far the selection moved, right and up, in pixels.  In the UV Editor the second row is :guilabel:`Move Y` and runs down the page.
	* - :guilabel:`Angle`
	  - A rotation
	  - How far the selection turned, in degrees.
	* - :guilabel:`Scale X`, :guilabel:`Scale Z`
	  - A scale
	  - How much the selection was scaled across and up.  1 is no change.  In the UV Editor the second row is :guilabel:`Scale Y`.
	* - :guilabel:`Proportional Editing`
	  - Any, with proportional editing in use
	  - Also moves the unselected vertices near the selection, less the farther away they are.
	* - :guilabel:`Falloff`
	  - Same
	  - The curve of that influence: Smooth, Sphere, Root, Inverse Square, Sharp, Linear, Constant, or Random.
	* - :guilabel:`Proportional Size`
	  - Same
	  - How far the influence reaches, in pixels.
	* - :guilabel:`Connected Only`
	  - Same
	  - Limits the influence to vertices joined to the selection by edges.

See :doc:`/modeling/proportional_editing`.

Slide Vertex
------------

One row, :guilabel:`Factor`.  It says where along its edge the vertex landed: 0 is where it started, and 1 is the neighboring vertex.

Merge
-----

One row, :guilabel:`Merge At`, with three choices: :guilabel:`Center` merges the vertices at the middle of them, and :guilabel:`First` and :guilabel:`Last` merge them onto the first or last vertex that you selected.  See :doc:`/modeling/meshes`.

Generate Mesh from Art
----------------------

The strip of :guilabel:`Generate Mesh from Art` has the settings of the mesher.  :guilabel:`Preset` chooses :guilabel:`Standard`, :guilabel:`Fine`, or :guilabel:`Coarse`, and fills in most of the other rows.  Changing a row afterwards leaves the others as they are.

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: The operation strip after Generate Mesh from Art, open, showing the title and the rows from Preset to Deformation Tolerance.
	:Setup: Select a drawable that has art, and run Generate Mesh from Art.
	:Crop: The 2D Viewport area, with the strip.
	:Save as: ``images/interface/operation_strip_mesh.png``
	:Caption: The strip of Generate Mesh from Art.

.. list-table::
	:header-rows: 1

	* - Row
	  - What it sets
	* - :guilabel:`Preset`
	  - The set of values that the rows below start from.
	* - :guilabel:`Alpha Threshold`
	  - How opaque a pixel must be to count as art.
	* - :guilabel:`Outline Spacing`, :guilabel:`Interior Spacing`
	  - The distance to aim for between vertices along the outline and inside it, in pixels.
	* - :guilabel:`Outer Margin`, :guilabel:`Inner Margin`, :guilabel:`Minimum Margin`
	  - How far outside the art the outline runs, how far inside the edge the inner ring runs, and the closest the outline may come to the art.
	* - :guilabel:`Minimum Outline Points`
	  - The fewest vertices one outline ring may have.
	* - :guilabel:`Minimum Angle`
	  - Adds vertices to break up thin triangles until each is at least this many degrees at its narrowest corner.
	* - :guilabel:`Vertex Budget`
	  - The most vertices one mesh should have.
	* - :guilabel:`Interior Thinning Limit`
	  - How far the interior thins before the outline thins with it, when the art needs more vertices than the budget.
	* - :guilabel:`Fill Holes`
	  - Meshes over holes in the art as one sheet, instead of cutting them out.
	* - :guilabel:`Strand Rungs`, :guilabel:`Strand Width`
	  - Meshes thin art as a strip of rungs, and how thin counts as thin.
	* - :guilabel:`Deformation Tolerance`
	  - How far the new mesh may stray from the shapes the rig gives the old one.  Where it would stray further, the old vertices that hold those shapes are kept.

:guilabel:`Generate Quad Mesh` has one row, :guilabel:`Margin`, which says how far the quad reaches past the art.  These are the same settings as the ``mesh`` command of the command line tool.  See :doc:`/modeling/generate_mesh`.

Create Warp Deformer
--------------------

.. list-table::
	:header-rows: 1

	* - Row
	  - What it sets
	* - :guilabel:`Rows`, :guilabel:`Columns`
	  - How many cells the new warp has, from top to bottom and from left to right.  They are drawn as a pair.
	* - :guilabel:`Margin`
	  - The room between the selection and the edge of the warp, in percent of the selection's larger side.
	* - :guilabel:`Bilinear (Quad)`
	  - Whether the warp bends each cell smoothly between its four corners.  It is only shown when the Runtime Target allows the new warp method.

See :doc:`/rigging/deformers` and :doc:`/files/runtime_targets`.

Subdivide Lattice
-----------------

:guilabel:`Row Splits` and :guilabel:`Column Splits`: how many cells each row of cells and each column of cells is split into.  Changing the :guilabel:`Rows` and :guilabel:`Columns` of a lattice in the Properties editor shows a strip titled ``Lattice Resolution`` with those two rows instead.

Keep in Place
-------------

One checkbox, :guilabel:`Keep in Place`, which is on at first.  It appears after you move an object to a new parent in the Outliner, or in the Relations of the Properties editor.  On, the object keeps the place where it rests under its new parent, its keyed motion included.  Off, it keeps its numbers and follows the new parent.

Import Artwork
--------------

.. list-table::
	:header-rows: 1

	* - Row
	  - What it sets
	* - :guilabel:`Align`
	  - Where the added file's canvas sits on the document's canvas: Top Left, Top, Top Right, Left, Center, Right, Bottom Left, Bottom, or Bottom Right.
	* - :guilabel:`Offset X`, :guilabel:`Offset Z`
	  - Moves the art right and up from where Align puts it, in pixels.
	* - :guilabel:`Alpha Threshold`
	  - How opaque a pixel must be to count as art when the first mesh of a layer is made.
	* - :guilabel:`Birth Mesh Margin`
	  - How far a layer's first quad reaches past its art, in pixels.

:guilabel:`Align` and the two offsets are only there when the document already had artwork.  The first artwork sets the canvas.  See :doc:`/artwork/importing`.

Match Artwork
-------------

:guilabel:`Match Threshold`: how sure a match must be, as a percentage, before a lost layer is relinked to it by itself.  Weaker matches are left for review in the Sources editor.  The strip also has :guilabel:`Alpha Threshold` and :guilabel:`Birth Mesh Margin`, as the import has, for layers that are added.

The strip of :guilabel:`Reload Artwork`, :guilabel:`Match Artwork Automatically`, and :guilabel:`Replace Artwork…` has these rows.  The strip of :guilabel:`Relink Art` has only the last two.  See :doc:`/artwork/relinking_and_reloading`.

Repack Atlas
------------

.. list-table::
	:header-rows: 1

	* - Row
	  - What it sets
	* - :guilabel:`Max Page Size`
	  - The largest page the pack may use, in pixels.
	* - :guilabel:`Gutter`
	  - Empty space around each piece of art and along the page edge, in pixels.
	* - :guilabel:`Extrude`
	  - How many pixels of each piece's edge color are copied outward into the gutter.  It cannot be wider than the gutter.
	* - :guilabel:`Allow Rotation`
	  - Lets the pack turn art a quarter turn to fit more onto a page.
	* - :guilabel:`Keep Pinned Tiles`
	  - Leaves pinned art where it is and packs the rest around it.
	* - :guilabel:`Power-of-Two Pages`
	  - Rounds each page's width and height up to a power of two.
	* - :guilabel:`Square Pages`
	  - Makes every page square.
	* - :guilabel:`Shrink Pages`
	  - Sizes each page to the art it holds, instead of the largest size.
	* - :guilabel:`Alpha Threshold`
	  - How opaque a pixel must be to count as art when the empty border of each piece is trimmed.

The same options are in the ``atlas`` command of the command line tool.  See :doc:`/artwork/atlas_packing`.

UV Art Placement
----------------

The strip after you move, turn, or scale art on its atlas page in the UV Editor: :guilabel:`Move X` and :guilabel:`Move Y` in page pixels, with Y running down the page, :guilabel:`Angle`, and :guilabel:`Scale X` and :guilabel:`Scale Y`.  See :doc:`/editors/uv_editor/placement`.

.. seealso::

	* :doc:`/modeling/transforming`
	* :doc:`/modeling/generate_mesh`
	* :doc:`/rigging/deformers`
	* :doc:`/artwork/importing`
	* :doc:`/artwork/atlas_packing`
	* :doc:`/editors/history`
