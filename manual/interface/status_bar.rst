**********************
Status Bar and Notices
**********************

The status bar is the strip along the bottom of the window.  It is always there, and it has the shortcuts that suit where the pointer is, the item you have selected, and the size of the model.  It is also where Umamo tells you, briefly, what it just did, and how far along a long task is.

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: The status bar across the full width of the window, with shortcut hints at the left, a notice in the middle, the selected item, and the model counts at the right.
	:Setup: Select one drawable in the Outliner, point at the 2D Viewport, and save the document so that the ``Saved`` notice is showing.
	:Crop: The bottom of the window, about 60 pixels high.
	:Save as: ``images/interface/status_bar.png``
	:Caption: The status bar.

The Four Zones
==============

From left to right the bar has four zones:

#. **Shortcut hints**, at the left.
#. **The middle**, which is empty until Umamo has something to say, and then shows a notice or a progress bar.
#. **The selected item.**
#. **The model stats**, at the right.

Shortcut Hints
==============

The left zone suggests shortcuts for the editor under the pointer.  Each hint is a key and a word, such as ``Tab Edit Mode``, separated by bars.  Move the pointer to another editor and the hints change.  The hints are the first six of the commands that are worth suggesting there: the ones made for that editor come first, and the ones that work everywhere follow.

The keys are those of your keymap.  A hint is left out when you have taken its key away.  See :doc:`/interface/keymap`.

While a transform is in progress, such as a grab, the hints are replaced by the two that matter:

``LMB / Enter: Confirm | RMB / Esc: Cancel``

Selected Item
=============

In Object Mode this is the name of the object that is active, such as a drawable, a part, or a deformer.  With more than one object selected it is the number, such as ``3 selected``.  Nothing shows when nothing is selected.

In Edit Mode and Pose Mode it counts the selected elements against all of the elements in the meshes that you are editing: ``3/120 vertices``, ``edges``, or ``faces``, according to the select mode.  When you are editing a warp deformer's lattice, it counts ``points``, ``grid lines``, or ``cells``.

Model Stats
===========

A line of counts for the model that is open:

``Parts: 14 | Drawables: 120 | Parameters: 27 | Deformers: 18 | Glues: 0 | Verts: 0/3400 | Tris: 0/6200``

The last two are the vertices and triangles of every mesh.  When something is selected, the first number is how many of them the selection holds.  In Edit Mode they count only the meshes that you are editing.

Notices
=======

A notice is a short message in the middle of the bar that disappears by itself after about four seconds.  It reports something that has just happened, such as ``Saved name.uma.`` or ``Artwork added.``, or says that a command did nothing and why.  A notice is not recorded in the History and is not an undo step.  If you missed one, repeat what you did.

Some notices, for a gesture that did not work, appear in a small label next to the pointer instead, where you are looking.  Those last about three seconds.

The notices are listed in :doc:`/troubleshooting/common_messages`.

Progress
========

A task that takes a while shows in the middle of the bar, while it runs: opening a document, adding artwork, reloading artwork, meshing the art, generating meshes, and packing the atlas.  The bar shows the name of the task, such as ``Opening name…``, a small progress bar, and a count such as ``3 / 12`` when the task knows how many steps it has.  When it does not, the bar just shows that work is going on.

When more than one task runs, the bar shows the newest and then ``+1 more``.  A task outranks a notice, so a notice that arrives while one runs waits, and is shown in full once the task is done.

You can keep working while a task runs.  The window does not freeze.  Some commands wait for a task to end instead of starting, and tell you so in a notice.  See :doc:`/files/uma`.

Modal Dialogs and Alerts
========================

Some messages cannot be a notice, because they need an answer or are too important to miss.  They open in the middle of the window, over everything, and dim what is behind them.  Nothing else in the window can be used until you answer, and no shortcut fires behind them.

Questions
	A message and two or three buttons, such as ``The document has unsaved changes.  Save them first?``  :kbd:`Enter` presses the main button, which is the default, and :kbd:`Escape` presses :guilabel:`Cancel`.

Alerts
	A message and an :guilabel:`Okay` button, for a failure or a result that you must see: a file that cannot be opened, a save that failed, the report after an export, a repack that was refused.  :kbd:`Enter` or :kbd:`Escape` dismisses it.  You can select the text of an alert and copy it with the copy shortcut of your system, to paste it into a bug report.

An alert for a startup problem, such as the low-memory alert, can also have a :guilabel:`Don't Show Again` button.

If several arrive at once, they show one after another, each after the one in front has been answered.  An :kbd:`Enter` that was already held down when the dialog opened is ignored until you press it again, so a held key cannot answer a dialog you have not read.

.. seealso::

	* :doc:`/interface/operation_strip`
	* :doc:`/editors/logs`
	* :doc:`/troubleshooting/common_messages`
