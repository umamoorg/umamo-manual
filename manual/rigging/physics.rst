*******
Physics
*******

.. admonition:: Not yet available
	:class: caution

	This feature is not available in Umamo yet.  This page records its current status.

Physics is what makes hair sway and a skirt swing: a simulation that moves parameters by itself, in answer to the movement of the head and the body.  Cubism has an editor for it, and a file for its settings.  Umamo does not edit or play physics yet, and it takes care of the physics that a model comes with.

Current Status
==============

* There is no physics editor.  The workspace named :guilabel:`Physics` is a single 2D Viewport, held for the physics tools that are to come.  See :doc:`/interface/workspaces`.
* Umamo does not simulate.  The viewport shows the pose that the parameters give it, and nothing moves a parameter by itself.  A model that swayed in Cubism will hold still here until you move its parameters.
* Physics settings cannot be made, changed, or looked at.
* The same is true of motions and expressions: Umamo does not edit or play them.  Animation is a long term goal of the project.  See :doc:`/about/introduction`.

What Is Preserved
=================

A model that has physics keeps it through Umamo in these ways:

* **MOC3.**  The physics file of the model (``.physics3.json``), which the manifest names, is read when you import, and :guilabel:`Export MOC3` writes it out again unchanged.  The :guilabel:`Physics settings (physics3.json)` option is unticked and greyed when the model had none.  See :doc:`/files/exporting`.
* **CMO3.**  The physics settings inside a CMO3 are kept while the document is open, and :guilabel:`Export CMO3` writes them back.  They are not part of a UMA file, so if you save the document, close it, and open the UMA file, a CMO3 exported from it has no physics.  The first save says so in the status bar.  Keep the CMO3 or the MOC3 that it came from.  See :doc:`/files/uma`.
* **A UMA file** does not carry physics, motions, or expressions.

The files name parameters by their IDs.  If you delete a parameter, or its ID is shortened by an export, the physics file still names it.  Umamo does not change the file, and the export report lists the settings that now point at a parameter that is gone, so that you can fix them in the Cubism Editor.  See :doc:`/files/export_notices`.

Planned
=======

The project's notes name a physics interface among the first things to get right, before animation.  The notes give no date.  See :doc:`/about/introduction`.

.. seealso::

	* :doc:`/interface/workspaces`
	* :doc:`/files/uma`
	* :doc:`/files/exporting`
