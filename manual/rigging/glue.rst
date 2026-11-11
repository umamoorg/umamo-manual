****
Glue
****

.. admonition:: Not yet available
	:class: caution

	This feature is not available in Umamo yet.  This page records its current status.

Glue is a Cubism feature that welds two meshes together along a seam.  Umamo can carry glue, play it, and write it back, and it cannot make or edit it yet.

What Glue Does
==============

When two pieces of art meet along an edge, such as the two strips of a ponytail or the seam of a sleeve, each is deformed on its own, and the seam can come apart as they move.  A **glue** joins them.  It is a list of pairs of vertices, one from each mesh, that sit along the seam.  After both meshes are deformed, each vertex of a pair is pulled toward the other, by a weight that each side has, scaled by the glue's **intensity**.

The intensity is from 0, which welds nothing, to 1, which welds fully.  It can be keyed on a parameter, so that a seam can be glued at one pose and free at another.  A glue that was never animated has the intensity 1.

A glue belongs to neither a part nor a deformer, and it is not an object that you select.  It is named for the two drawables it joins, such as ``Hair Front ↔ Hair Back``.

What You Can Do Today
=====================

An imported model keeps its glue, and Umamo uses it.

* **Import and export.**  A CMO3 and a MOC3 bring their glue in, and Export CMO3 and Export MOC3 write it back.  A glue that names a drawable left out of the export is dropped, and the export report says so.  See :doc:`/files/cubism_interchange` and :doc:`/files/export_notices`.
* **See it work.**  The viewport welds the seams as the model moves, and the weld stays after the meshes it joins are regenerated, keyed, or re-parented.
* **Key its intensity.**  The Keyform Sheet has an owner row for each glue that is keyed, and its keys can be inserted, moved, and removed there like any other.  See :doc:`/editors/keyform_sheet`.
* **Regenerate the meshes.**  :guilabel:`Generate Mesh from Art` keeps the vertices that a glue names, so that the weld stays.  A mesh that glue holds most of is skipped, with a notice, because regenerating it would change how it follows the mesh it is glued to.  :guilabel:`Generate Quad Mesh` reaches past any glued vertex.  See :doc:`/modeling/generate_mesh`.
* **Delete a drawable.**  Deleting a glued drawable removes its glue.

What cannot be done: a glue cannot be made, selected, deleted by itself, or edited, and its intensity has no field in the Properties editor.  A copy made with Duplicate joins no glue, so the copy is not welded to anything.

Planned
=======

The project's notes list editing glue among the things that are set aside for later.

* Tools to make a glue between two meshes, and to edit its pairs and weights.
* A place in the interface to select a glue and to edit its intensity.  It is not decided where a glue should sit in the Outliner, since it belongs to neither a part nor a deformer.
* Better handling of a vertex that is in more than one glue.  The renderer today welds one pair for each vertex.

.. seealso::

	* :doc:`/modeling/meshes`
	* :doc:`/modeling/generate_mesh`
	* :doc:`/files/cubism_interchange`
