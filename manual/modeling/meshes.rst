******
Meshes
******

A mesh is the shape that a drawable's art is stretched over.  Editing a mesh is how you decide where the art bends, and how finely.  This page is about editing a mesh by hand.  Making a mesh from the art, which is where most meshes begin, is in :doc:`/modeling/generate_mesh`.

What a Drawable Mesh Is
=======================

A mesh is a set of **vertices** joined into **triangles**.  Umamo meshes have triangles and nothing else: there are no quads or larger faces.  Each vertex has:

* A **position**, where it sits at rest.
* A **texture coordinate**, which says what point of the art the vertex shows.  Moving a vertex in the viewport moves the vertex and leaves the point of the art it shows, so the art stretches.  Moving the texture coordinate in the UV Editor does the opposite.  See :doc:`/editors/uv_editor/editing`.
* A **motion at every key**, for a mesh that is keyed, and one for each blend shape it has.  A mesh is drawn from these, so the shape that you see is the position, moved by the keys that the parameters pick out.

A drawable can have no mesh.  It has no shape to select or edit, and the transforms skip it.  The Data tab of the Properties editor says ``No mesh``, or counts the vertices and the triangles, as the status bar does with ``Verts`` and ``Tris``.  See :doc:`/editors/properties/data_tab`.

The mesh is what an edit operates on, and the **topology** is how its vertices are joined.  An operation can move the vertices, which leaves the topology as it is, or change the topology, which adds, removes, or joins vertices.  All of the operators below change the topology.  When they do, the motion at every key and in every blend shape is carried along with each vertex, so a rig that is already keyed is not undone by editing the mesh.

The mesh that you are editing is always drawn over the art.  The :guilabel:`Wireframe` overlay draws the meshes of the other drawables as well.  See :doc:`/editors/viewport_2d/overlays`.

Mesh Editing Operators
======================

Select the vertices in Edit Mode, with the select mode that the operator wants, and run it.  Each is one undo step.  After it has run, the result is what is selected.

Duplicate
---------

.. admonition:: Reference
	:class: refbox

	:Mode: Object Mode, Edit Mode
	:Menu: Context menu
	:Shortcut: :kbd:`Shift-D`

In **Edit Mode** it copies the selected elements into the same mesh.  The copies are selected, and a Grab starts on them if the pointer is over a viewport, so you can set them down at once.  The Grab does not use proportional editing, because it would pull the originals as well.

Because a mesh has only triangles, what a copy carries is: every selected vertex, and every triangle whose three corners are all selected.  An edge that is not a side of a selected triangle has no form of its own, so it is not carried.  Two selected neighbors come out as two points that are not joined.  Select the triangles to copy them whole.

In **Object Mode** it copies whole objects: every selected drawable that has a mesh, and every selected warp deformer.  Parts and rotation deformers are not copied.

* The copy is named like the original with a number, ``.001``, ``.002``, and so on, and its id too.
* It sits right after the original in the Outliner, in the same part and under the same parent deformer.
* It carries the keyforms and the blend shapes of the original.  The two share them until you edit one, and then only that one changes.
* It draws the same art as the original, from the same place on the atlas.  See :doc:`/modeling/parts_and_drawables`.
* It joins no glue, so it is not welded to anything.  Glue cannot be made in this version.
* If a warp deformer and a drawable inside it are both selected, the copy of the drawable goes inside the copy of the warp.

The copies are selected, and a Grab starts on them if the pointer is over a viewport.  Copying is one undo step and the grab is another.

Pose Mode has no Duplicate.

Merge Vertices
--------------

.. admonition:: Reference
	:class: refbox

	:Mode: Edit Mode
	:Menu: Context menu
	:Shortcut: :kbd:`M`

Joins the selected vertices into one.  :kbd:`M` opens the Merge pie, and the context menu has the same three choices in a submenu.

.. list-table::
	:header-rows: 1

	* - Choice
	  - The one vertex lands
	* - :guilabel:`Merge at Center`
	  - At the middle of the vertices.  The motions at its keys and its texture coordinate are the average of theirs.
	* - :guilabel:`Merge at First`
	  - On the vertex you selected first, unchanged.
	* - :guilabel:`Merge at Last`
	  - On the vertex you selected last, unchanged.

The result is selected.  Any triangle that had two of the merged vertices for corners is removed, because it has nothing left of it.  The strip that follows has one row, :guilabel:`Merge At`, with the choices Center, First, and Last, to choose again.  See :doc:`/interface/operation_strip` and :doc:`/interface/pie_menus`.

Merge needs two or more vertices, and the select mode to be vertex.  Otherwise the notice is ``Merge needs two or more selected vertices (vertex mode).``

Connect Vertices
----------------

.. admonition:: Reference
	:class: refbox

	:Mode: Edit Mode
	:Menu: Context menu
	:Shortcut: :kbd:`J`

Cuts a line between exactly two selected vertices.  Every edge that the line crosses is split where it crosses, and the triangles it passes through are divided again so that the line becomes real edges.  The new line is selected.

Connect is strict.  If the two vertices are already joined, if the line crosses nothing, or if the crossing is one that the splitting does not cover, nothing is changed and the notice is ``Can't connect: The cut crosses nothing, or the geometry is degenerate.``  It also needs exactly two vertices, in vertex mode: ``Connect needs exactly two selected vertices (vertex mode).``

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: A mesh in Edit Mode, before and after Connect Vertices, side by side: two vertices across a face selected, and then the same mesh with the cut made, the crossed edges split, and the new line selected.
	:Setup: Open a model, enter Edit Mode on a drawable with a generated mesh, select two vertices on opposite sides of a few triangles, and press J.
	:Crop: The mesh, in two pictures put side by side.
	:Save as: ``images/modeling/connect.png``
	:Caption: Connect Vertices cuts a line between two vertices.

Rip
---

.. admonition:: Reference
	:class: refbox

	:Mode: Edit Mode
	:Menu: Command palette
	:Shortcut: :kbd:`V`

Tears the mesh open at the selected vertices.  A vertex where several triangles meet is split in two, and the triangles on the side of the pointer are moved to the copy.  A Grab starts at once, without proportional editing, and when you pull the copy away a seam opens.

Rip depends on where the pointer is, so it works from the key over the viewport, and it is not in the context menu.  It is not available in the face select mode.  If a selected vertex does not sit between triangles that can be separated, the notice is ``Nothing to rip here: The selection has no fan to split.``

The Viewport Context Menu
=========================

A right-click in the viewport opens the commands of the mode.  In Edit Mode the menu has :guilabel:`Merge Vertices`, as a submenu, :guilabel:`Connect Vertices`, :guilabel:`Duplicate`, :guilabel:`Select All`, :guilabel:`Invert Selection`, :guilabel:`Select Linked`, :guilabel:`Snap`, :guilabel:`Generate Mesh from Art`, :guilabel:`Generate Quad Mesh`, :guilabel:`Subdivide Lattice`, and :guilabel:`Frame Selected`.  A row that cannot be used is greyed.  See :doc:`/editors/viewport_2d/index`.

Rip and Vertex Slide are left out of the menu because they need the pointer.  Use their keys, or the command palette.

Lattices Are Meshes Too
=======================

The lattice of a warp deformer is edited in Edit Mode, with the same tools as a mesh: the same select modes, box and circle selects, grab, rotate, and scale, proportional editing, and snaps.  Its points are its vertices, and its cells make a grid.  See :doc:`/rigging/deformers`.

The one difference is that its topology is **fixed**.  You can reshape a lattice, moving its points where you like, but you cannot change how they are joined.  Merge, Connect, Rip, and Duplicate on a lattice are refused with the notice ``Lattice topology can be reshaped, but it can not be destructively changed.``  To change the number of rows and columns, use the :guilabel:`Rows` and :guilabel:`Columns` fields of the Data tab, or :guilabel:`Subdivide Lattice`.

Current Limitations
===================

* A mesh is triangles only.  An operator never makes a quad, and a selected face is a triangle.
* There are no commands to delete a selected vertex or face.  To change the shape of a mesh to lose some of it, generate the mesh again, with other settings.
* Vertex Slide, Rip, and the grab that follows a Duplicate need the pointer over the viewport.
* The mesh is edited at rest.  Pose Mode shapes the lattices of warp deformers, and not the vertices of a mesh.
* The Cubism keymap preset does not bind :kbd:`Shift-D`, :kbd:`M`, :kbd:`J`, :kbd:`V`, or :kbd:`Shift-V`.  The context menu and the command palette have the commands.  See :doc:`/interface/keymap`.

.. seealso::

	* :doc:`/modeling/selecting`
	* :doc:`/modeling/transforming`
	* :doc:`/modeling/generate_mesh`
	* :doc:`/rigging/deformers`
	* :doc:`/editors/uv_editor/editing`
