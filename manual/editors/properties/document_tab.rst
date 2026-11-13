**********
Puppet Tab
**********

The Puppet tab has the settings of the puppet as a whole: the size of the canvas and the place of the world axes, whether the model is drawn from the packed atlas or from its source artwork, and the runtime that the model is made for.  It is the one tab that is there with nothing selected.

Each change is one undo step, and is saved with the puppet file.  See :doc:`/editors/history`.

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: The Puppet tab with its three sections open: Canvas with the Width, Height, Origin X, and Origin Z fields, Display with the Show source artwork checkbox, and Runtime with the Target list.
	:Setup: Open a model with nothing selected.
	:Crop: The Properties area, with its header.
	:Save as: ``images/editors/properties_puppet.png``
	:Caption: The Puppet tab.

Canvas
======

The canvas is the page that the model is drawn on.  The :guilabel:`Canvas` section has two pairs of fields.

:guilabel:`Width` and :guilabel:`Height`
	The size of the canvas, in whole pixels, at least 1.  Changing the width moves only the right edge, and changing the height moves only the bottom edge, so the art stays where it is on the page.  The world axes stay where they are, too, and :guilabel:`Origin Z` changes by the same amount as the height.  History labels the step ``Set Canvas Size``.

:guilabel:`Origin X` and :guilabel:`Origin Z`
	Where the world axes cross.  :guilabel:`Origin X` is measured from the left edge of the canvas, and :guilabel:`Origin Z` is measured up from its bottom edge.  The :guilabel:`Position` fields of an item are measured from these axes.  History labels the step ``Set World Origin``.

The origin is the only value here that is measured from a corner of the canvas.  The positions of items, in the Properties editor and in the sidebar, are measured from the origin.  See :doc:`/editors/viewport_2d/overlays` for the X/Z axis lines that show it in the viewport.

Display
=======

:guilabel:`Show source artwork`
	Draws each mesh in the viewports from its original artwork layer, instead of from the packed atlas.  A mesh whose layer the puppet does not keep is still drawn from the atlas.  History labels the step ``Change Texture Display``.  The command palette has the same switch as :guilabel:`Toggle Source Artwork Display`, which has no shortcut.

This is a property of the puppet and not a preference of the application.  It is saved with the file and it round-trips through a CMO3, and the checkbox is there for every open puppet, even one that has no source artwork to draw from.  The setting then records what you want, and it takes effect when the artwork is there.  A model opened from a MOC3 keeps no source artwork.

The setting is about what the model is drawn from.  It does not change what the UV Editor shows, which has a choice of its own for each area.  See :doc:`/editors/uv_editor/texture_selector`.

Runtime
=======

:guilabel:`Target`
	The Cubism runtime that the model is made for.  The list has :guilabel:`No Target (All Features)`, Ayagami, and the Cubism versions from 3.0 to 5.3.  Changing it is one undo step, and History labels it ``Set Runtime Target``.

Under the list, Umamo says which features the target restricts, or ``All features are available.``  A feature that your puppet already uses is followed by ``CURRENTLY IN USE``, so that you can see what a MOC3 export would leave out.

The target hides and limits the controls of the other tabs.  It removes nothing from the puppet.  See :doc:`/editors/properties/index` for how the controls follow the target, and :doc:`/files/runtime_targets` for the targets, the features, and what each one changes.

.. seealso::

	* :doc:`/files/runtime_targets`
	* :doc:`/editors/uv_editor/texture_selector`
	* :doc:`/files/exporting`
