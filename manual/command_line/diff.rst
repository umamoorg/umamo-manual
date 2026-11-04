****
diff
****

``diff`` imports two models and prints how they differ, one thing at a time.  It compares the model's contents, not how the files are formatted, so it works across formats: you can compare a CMO3 file with the MOC3 file that was exported from it.

Synopsis
========

.. code-block:: text

	diff <a> <b>

``a`` and ``b`` are CMO3 files, MOC3 files, or ``.model3.json`` manifests, in any combination.  ``diff`` takes no options.  For example:

.. code-block:: bash

	./gradlew -q :cli:run --args="diff before.cmo3 after.moc3"

Output Format
=============

Two models that match print:

.. code-block:: text

	identical

Otherwise ``diff`` prints one section for each type of data that differs, in this order: ``[parameters]``, ``[parameterGroups]``, ``[parts]``, ``[deformers]``, ``[drawables]``, ``[glues]``, and ``[document]``.  A type with no differences has no section.  Under a heading there is a line for each data item that differs, and the first character says how:

.. list-table::
	:header-rows: 1

	* - Line
	  - Meaning
	* - ``+ id``
	  - The data is only in ``b``.
	* - ``- id``
	  - The data is only in ``a``.
	* - ``~ id [FIELD, ...]``
	  - The data is in both, and the listed fields are different.

.. code-block:: text

	[parts]
	~ PartFace [GROUP_MODE]
	~ PartEye [GROUP_MODE, COMPOSITE]
	[document]
	~ [SOURCE_LAYER_DISPLAY]

The ``id`` is the id of the parameter, group, part, deformer, or drawable.  A glue has no id of its own, so it is named by the two drawables it joins and its number among the glues that join the same two, as in ``MeshA~MeshB#0``.  Under ``[document]`` there is no ``id``, because the differences are in the model as a whole.

A changed data item lists the names of what differs.  They are always listed in the same order, which is the order of the tables below.

.. list-table::
	:header-rows: 1

	* - Section
	  - Fields
	* - ``[parameters]``
	  - ``NAME``, ``RANGE``, ``KIND``
	* - ``[parameterGroups]``
	  - ``NAME``, ``INITIALLY_OPEN``, ``CHILDREN``
	* - ``[parts]``
	  - ``NAME``, ``VISIBLE``, ``SKETCH``, ``SELECTABLE``, ``GROUP_MODE``, ``DRAW_ORDER``, ``CHILDREN``, ``CHANNELS``, ``COMPOSITE``
	* - ``[deformers]``
	  - ``KIND``, ``NAME``, ``PARENT``, ``PART``, ``SELECTABLE``, ``LATTICE``, ``QUAD_TRANSFORM``, ``BASE_ANGLE``, ``GEOMETRY``, ``CHANNELS``, ``STATICS``, ``BLEND_SHAPES``
	* - ``[drawables]``
	  - ``NAME``, ``PARENT_DEFORMER``, ``BLEND_MODE``, ``ALPHA_BLEND_MODE``, ``MASKED_BY``, ``INVERT_MASK``, ``CULLING``, ``VISIBLE``, ``SELECTABLE``, ``TEXTURE_SOURCE``, ``ATLAS_TILE``, ``MESH_TOPOLOGY``, ``MESH_POSITIONS``, ``MESH_UVS``, ``GEOMETRY``, ``CHANNELS``, ``STATICS``, ``BLEND_SHAPES``
	* - ``[glues]``
	  - ``PAIRS``, ``CHANNELS``, ``INTENSITY``
	* - ``[document]``
	  - ``CANVAS_SIZE``, ``WORLD_ORIGIN``, ``RUNTIME_TARGET``, ``SOURCE_LAYER_DISPLAY``, ``PARAMETER_ORDER``, ``PARAMETER_LINKS``, ``PARAMETER_TREE``, ``ROOT_CHILDREN``, ``ATLAS_PAGES``, ``SOURCE_FILES``

Exit Code
=========

A difference is not a failure.  ``diff`` exits with 0 whether the models match or not, so read the output, and not the exit code, to find out which.  The exit codes 1 and 2 are for the usual problems: a file that cannot be read, or a file that is the wrong kind.  See :doc:`index`.

Inputs
======

Both files are imported the way the editor imports them, and are compared in the same canvas space.  A model in the CMO3 format and a model in the MOC3 format are comparable to each other.

Names, parameter groups, and linked parameters of a MOC3 model come from its ``.cdi3.json``.  Without one, those differ from a CMO3 model that has them, and a warning is generated.

``diff`` needs a rig, so an artwork file is a usage error.

.. seealso::

	* :doc:`/command_line/convert`
	* :doc:`/command_line/dump`
