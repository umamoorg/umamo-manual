**************************
Generating Meshes from Art
**************************

Most meshes begin as a command, not as a drawing of vertices.  Umamo looks at the pixels of a drawable's art and builds a mesh that follows its shape, with the vertices spaced evenly enough to bend.  There are two commands: :guilabel:`Generate Mesh from Art`, which makes a mesh that follows the art, and :guilabel:`Generate Quad Mesh`, which makes a rectangle.  Both can be run on a drawable that already has a mesh, again and again, and the rig that is built on that mesh is kept.

Generate Mesh from Art
======================

.. admonition:: Reference
	:class: refbox

	:Mode: Object Mode, Edit Mode
	:Menu: Context menu
	:Shortcut: :kbd:`Shift-M`

Makes a new mesh from the art of each selected drawable.  The old mesh is replaced.  You can also run it from the :guilabel:`Generate Mesh from Art` button in the Data tab of the Properties editor, or from the command palette.  See :doc:`/editors/properties/data_tab`.

The command works on the selected drawables **and on every drawable that shares their art**.  A copy made with Duplicate draws from the same place on the atlas as the original, so the two get a new mesh together.

It is available when the document has art on an atlas and the mode is not Pose Mode.  The status bar says ``Generating meshes…`` while it works, and the whole run is one undo step, called ``Generate Mesh from Art`` in History.  If nothing selected can be meshed, the notice is ``Select a drawable with a mesh to generate one from its art.``

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: A drawable in the 2D Viewport before and after Generate Mesh from Art, as two pictures side by side, with the wireframe on: a plain quad on the left and a mesh that follows the outline of a strand of hair on the right.
	:Setup: Add a layered file whose Initial Mesh setting is Quad, select a hair layer, turn the Wireframe overlay on, and press Shift-M.
	:Crop: The drawable, at the same zoom in both pictures.
	:Save as: ``images/modeling/generate_mesh.png``
	:Caption: A plain quad, and the mesh that Generate Mesh from Art makes.

Presets
=======

A **preset** is a set of values to start from.  The :guilabel:`Preset` row of the operation strip picks one, and fills in the spacings, margins, outline points, minimum angle, and strand width.  It leaves the other rows alone.  A new run starts from the preset in :guilabel:`Mesh Generation Preset` in the Settings, which is :guilabel:`Standard` at first.  See :doc:`/interface/settings`.

.. list-table::
	:header-rows: 1

	* - Setting
	  - Standard
	  - Fine
	  - Coarse
	* - :guilabel:`Outline Spacing`
	  - 32
	  - 20
	  - 48
	* - :guilabel:`Interior Spacing`
	  - 48
	  - 28
	  - 72
	* - :guilabel:`Outer Margin`
	  - 4
	  - 3
	  - 6
	* - :guilabel:`Inner Margin`
	  - 8
	  - 6
	  - 12
	* - :guilabel:`Minimum Margin`
	  - 2
	  - 1.5
	  - 3
	* - :guilabel:`Minimum Outline Points`
	  - 6
	  - 8
	  - 4
	* - :guilabel:`Minimum Angle`
	  - 20
	  - 24
	  - 15
	* - :guilabel:`Strand Width`
	  - 40
	  - 26
	  - 60

Standard
--------

The default.  A balance between a mesh that follows the art closely and a mesh that is light to draw and easy to rig.

Fine
----

Closer vertices, thinner margins, and a higher minimum angle.  The mesh follows the art more closely and has more vertices, and so it bends more smoothly and costs more to draw and to rig.

Coarse
------

Wider vertex spacing and a lower minimum angle.  The mesh has fewer vertices.  It is for art that will not bend much.

Settings
========

The mesh has three kinds of vertices.  An **outline** runs around the art, a little outside its edge.  An **inner ring** runs inside the edge.  An even grid of **interior** vertices fills the rest.  The settings below say how far apart these are, and how far from the art.  Very thin art, such as a lock of hair, is meshed as a strip of **rungs**, which pair up the two sides of the strand.

After the first pass, the mesher adds vertices to break up triangles that are thin slivers, so that the mesh bends smoothly, up to the vertex budget.

Each row of the operation strip is one setting.  A distance is in pixels of the art, which are the pixels of the layer.  The editor takes the value to be between the limits in the table, and a value outside them is brought to the nearest limit.  The command-line tool offers the same settings by their option names; see :doc:`/command_line/mesh`.

.. list-table::
	:header-rows: 1

	* - Row
	  - Allowed
	  - What it sets
	* - :guilabel:`Preset`
	  - Standard, Fine, Coarse
	  - The values to start from.
	* - :guilabel:`Alpha Threshold`
	  - The atlas's own to 255
	  - How opaque a pixel must be to count as art.  Fainter pixels, such as stray marks of an eraser, are not meshed.  It cannot be lower than the alpha threshold the atlas was packed with, which is 1 unless you changed it in :guilabel:`Repack Atlas`.  See :doc:`/artwork/atlas_packing`.
	* - :guilabel:`Outline Spacing`
	  - 1 to 512
	  - The distance to aim for between vertices along the outline.
	* - :guilabel:`Interior Spacing`
	  - 1 to 512
	  - The distance to aim for between the vertices of the inner ring and the grid.
	* - :guilabel:`Outer Margin`
	  - 0 to 64
	  - How far outside the art the outline runs, where the shape allows.
	* - :guilabel:`Inner Margin`
	  - 0 to 256
	  - How far inside the edge of the art the inner ring runs.  0 means no inner ring.
	* - :guilabel:`Minimum Margin`
	  - 0.5 to 64
	  - The closest that the outline may come to any pixel of art.
	* - :guilabel:`Minimum Outline Points`
	  - 3 to 256
	  - The fewest vertices that one outline ring may have, however small its piece of art is.
	* - :guilabel:`Minimum Angle`
	  - 0 to 33
	  - Adds vertices to break up thin triangles until each is at least this many degrees at its narrowest corner.  A higher value gives more even triangles that bend more smoothly, with more vertices.  A corner that the outline itself makes, such as the tip of a lock of hair, cannot be widened.  0 adds none.
	* - :guilabel:`Vertex Budget`
	  - 16 to 4096
	  - The most vertices that one mesh should have.  See `Results and Skipped Meshes`_ for what happens to art that does not fit.
	* - :guilabel:`Interior Thinning Limit`
	  - 1 to 64
	  - When the art needs more vertices than the budget, the interior thins first, to at most this many times the outline spacing.  Past that the outline thins with it.  A higher value keeps the detail of the outline longer, and a lower value keeps the interior even.
	* - :guilabel:`Fill Holes`
	  - On or off
	  - See `Fill Holes and Strand Rungs`_.
	* - :guilabel:`Strand Rungs`
	  - On or off
	  - See `Fill Holes and Strand Rungs`_.
	* - :guilabel:`Strand Width`
	  - 1 to 256
	  - Art narrower than this is a strand, when :guilabel:`Strand Rungs` is on.
	* - :guilabel:`Deformation Tolerance`
	  - 0.1 to 64
	  - See `Deformation Tolerance`_.

Deformation Tolerance
=====================

A drawable that is already rigged has a mesh with keys on it, and perhaps blend shapes.  Replacing the mesh must not undo the rig, so the new mesh takes the old one's motion.

* A new vertex that is **inside** the old mesh takes the motion of the three corners of the triangle it falls in, blended by how near it is to each.  Its texture coordinate and the motion of its blend shapes are blended the same way.
* A new vertex that is **outside** the old mesh takes the motion at the nearest point of the old boundary, and never more than that, so the motion is not amplified.
* A vertex that holds a place in **glue**, which can come from an imported file, is copied exactly, together with the glue.
* The triangles keep their winding, so a mirrored drawable stays on the side it was on.

Blending this way is only close, and the **Deformation Tolerance** says how close it must be.  It is how far in pixels the new mesh may stray from the shapes that the rig gives the old one, at rest and at every key.  Where it would stray further, the old vertices that hold those shapes are **kept** in the new mesh.  A smaller tolerance keeps more of the old vertices, and the new mesh is less clean.  A larger one gives a cleaner mesh, and the motion may differ more.  It starts at 0.5.

Fill Holes and Strand Rungs
===========================

:guilabel:`Fill Holes` is off at first.  An opening in the art, such as the gaps of a lace or a web, is cut out of the mesh.  Turned on, the mesher meshes over the holes, and each piece of art becomes one sheet.  A hole smaller than the outline spacing is always meshed over.

:guilabel:`Strand Rungs` is on at first.  Art narrower than :guilabel:`Strand Width` is meshed as an even strip with a single run down its center, instead of being outlined.  Raise :guilabel:`Strand Width` to mesh wider straps and locks as strips too, and lower it to give more of them an inner ring.  The presets set it to where an inner ring stops fitting.

Generate Quad Mesh
==================

.. admonition:: Reference
	:class: refbox

	:Mode: Object Mode, Edit Mode
	:Menu: Context menu

Replaces the mesh of each selected drawable with a single rectangle, two triangles, around its art.  It is for art that does not need to bend inside itself, and it is the mesh with the fewest vertices that still covers the drawable.  It is the same as the other command in every other way: it works on the drawables that share art with the selection, it is one undo step called ``Generate Quad Mesh``, and it keeps the rig.  It has the button of that name in the Data tab.  It has no key.

It has two settings.

:guilabel:`Margin`
	How far the rectangle reaches past the visible art, and past any vertex that is held by glue, on every side, in pixels.  From 0 to 64.  It starts at 2.

:guilabel:`Alpha Threshold`
	How opaque a pixel must be to count as visible art, with the same floor as above.

Initial Mesh on Import
======================

You do not have to run these commands to get a mesh.  When artwork is added to a document, each drawable starts with one.  The :guilabel:`Initial Mesh` setting in the :guilabel:`Import` category of the Settings chooses which: :guilabel:`Generated from Art`, the default, runs the mesher with the preset of :guilabel:`Mesh Generation Preset`, and :guilabel:`Quad` makes the rectangle with the :guilabel:`Birth Mesh Margin`, 2 at first.  A layer that cannot be meshed from its art starts as a quad.  See :doc:`/artwork/importing`.

Results and Skipped Meshes
==========================

When a run is over, a notice says how many meshes were made.  Some drawables can be skipped, or made differently than you asked.  The log, in the Logs editor, has a line for each.  See :doc:`/editors/logs`.

.. list-table::
	:header-rows: 1

	* - Notice
	  - What it means
	* - Generated *N* mesh(es) from art.
	  - All went well.
	* - Generated *N* mesh(es) from art; *M* skipped.  See the log.
	  - Some drawables were not meshed.  For example, nothing in the layer reaches the alpha threshold.
	* - Generated *N* mesh(es) from art; *M* built coarser than asked to stay within the Vertex Budget.  See the log.
	  - The art needed more vertices than the budget, so the interior, and then the outline, were thinned.
	* - Generated *N* mesh(es) from art; *M* needed a higher Vertex Budget or Fill Holes to fit.  See the log.
	  - The art could not fit the budget even when thinned, so the mesher tried a higher budget, up to 4096, and then filling the holes.
	* - Generated *N* mesh(es); *M* skipped because pinned art has no room to grow.  Unpin the art or lower the margin.
	  - A new mesh reaches past the art, and the art is pinned on its page with no room around it.  Unpin it in the UV Editor, or lower the margin.  See :doc:`/editors/uv_editor/placement`.
	* - Generated *N* mesh(es); *M* skipped because they need more than 4096 vertices even with holes filled.  Raise the Alpha Threshold or lower the Minimum Outline Points.
	  - The art is too intricate for any mesh the renderer can hold.
	* - Generated *N* mesh(es); *M* skipped because glue holds most of their vertices, and regenerating them would change how they follow what they are glued to.
	  - A mesh that is held by glue throughout is left as it is.
	* - No mesh was generated.  See the log.
	  - Nothing was meshed.
	* - Nothing was generated: The atlas has no room for the larger meshes.
	  - The pages have no room for the larger meshes.  A mesh keeps clear the room that it reaches, so smaller margins need less.  See :doc:`/artwork/atlas_packing`.
	* - The document changed while the meshes were being generated; nothing was applied.
	  - You edited the model during the run.  Run it again.

A skipped drawable keeps its old mesh.

Adjusting After the Run
=======================

When a run has finished, the operation strip has the settings it used.  It is closed at first: click its title, or press :kbd:`F9`.  Change a row and the run is done again from the same starting model, so you can try the presets and the settings and watch the wireframe.  It is still one undo step.  For Generate Quad Mesh the strip has :guilabel:`Margin` and :guilabel:`Alpha Threshold`.  See :doc:`/interface/operation_strip`.

The first run starts from the preset in the Settings.  Later runs start from the values of the last one, as long as the application is open.  They are not saved, and the next time that Umamo starts, a run starts from the preset again.  A run that makes nothing, but that skipped drawables that a row could help, still opens the strip.

.. seealso::

	* :doc:`/modeling/meshes`
	* :doc:`/artwork/importing`
	* :doc:`/interface/operation_strip`
	* :doc:`/command_line/mesh`
	* :doc:`/interface/settings`
