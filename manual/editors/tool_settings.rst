*************
Tool Settings
*************

.. admonition:: Not yet available
	:class: caution

	This feature is not available in Umamo yet.  This page records its current status.

The Tool Settings editor is set aside for the settings of the active tool, to be shown while the tool is in use.  It is in the editor type list so that it is ready, but it has nothing in it yet.

Current Status
==============

An area switched to :guilabel:`Tool Settings` shows its own name in the middle and nothing else.  It reads no settings and offers no controls.  It can be added to a workspace, and a workspace that has one keeps it, but it does no work.

The settings that such an editor would hold are shown in two other places today.

Where Tool Settings Live Today
==============================

Operation Strip
---------------

After an operation has run, its settings are in the operation strip at the bottom left of the 2D Viewport or the UV Editor: how far a grab moved, how fine a generated mesh is, and so on.  Changing a setting runs the operation again.  This covers most of what other programs keep in a tool settings panel.  See :doc:`/interface/operation_strip`.

Sidebar Tool Tab
----------------

The :guilabel:`Tool` tab of the sidebar of a work surface has one panel, :guilabel:`Active Tool`.  While a tool is armed in the area, or a transform is running, it names it: ``Grab``, ``Rotate``, ``Scale``, ``Box Select``, ``Circle Select``, or ``Zoom Region``.  The rest of the time it says ``Tool settings will appear here.``  A tool that is active in another area is that area's, so it is not named.  See :doc:`/editors/viewport_2d/sidebar`.

.. seealso::

	* :doc:`/interface/operation_strip`
	* :doc:`/editors/viewport_2d/sidebar`
