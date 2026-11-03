**********************
Watching Artwork Files
**********************

While you rig, the artist is often still painting.  Umamo can watch the artwork files of the document, so that a save in your art program reaches the model without you doing anything, or so that you are told when it is time to reload.  This page is about the watching.  What a reload does is in :doc:`/artwork/relinking_and_reloading`.

The watcher is the same for every document.  It watches the files that the document lists, at the path that the document recorded for each.  A file that the platform gives only as a handle with no path, as Android can, is not watched.

Watch Modes
===========

The mode is the :guilabel:`Watch Artwork Files` setting, in the :guilabel:`Import` category of :menuselection:`Edit --> Settings…`.  It takes effect as soon as you change it.  See :doc:`/interface/settings`.

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: The Import category of the Settings window, with the Watch Artwork Files list open and its three choices: Reload Automatically, Notify Only, and Off.
	:Setup: Open Settings and go to Import.
	:Crop: The Settings window.
	:Save as: ``images/artwork/watch_mode_setting.png``
	:Caption: The Watch Artwork Files setting.

Reload Automatically
--------------------

This is the default.  When a watched file has changed, Umamo waits until you are not in the middle of anything, and then reloads the file by itself.  The reload is a step like any other, called ``Reload Artwork``, and you can undo it.  The operation strip shows in the work surface you used last, as it does when you press the Reload button.  See :doc:`/interface/operation_strip`.

Umamo does not reload under your hand.  The reload waits while a transform is in progress, while a drag in a viewport or a circle select stroke is under way, while a select tool is armed, and while a pie menu is open.  It checks again every quarter of a second and goes ahead the moment you let go.

If you change the model after the reload was planned and before it landed, the reload is dropped, and Umamo tries again once the file is still.

Notify Only
-----------

Umamo tells you and does nothing else.  The status bar says ``2 artwork file(s) changed on disk.  Press Reload to take the changes.``, and the reload button of the Sources editor gets an alert mark.  The document stays as it is until you press the button, which reloads the files.  Use this mode when you would rather decide when new art comes in, for example in the middle of a delicate rig.

Off
---

Umamo watches nothing and says nothing.  Reload the files yourself, with the button or with :guilabel:`Reload Artwork` in the command palette.  The check at open, described below, is off too.

How Changes Are Detected
========================

The watcher asks the system about every watched file once a second: its size, the time it was last changed, and whether it is still there.  This is cheap, and it works the same on every system and for files on network drives.  A change of any one of them is a sign that the file was saved.

A sign is not yet a change.  Art programs save in several steps, and some write a temporary file and rename it.  So Umamo then:

#. **Waits** until the file has been still for three quarters of a second.  A file that cannot be read yet because it is still being written is waited for again, up to eight times.
#. **Reads the file and makes a hash of its contents**, and compares it with the hash that the document recorded when it last read the file.
#. If the two are the same, nothing happened: the save changed nothing, and the file is left alone.
#. If they differ, the file is **pending** and the mode decides what is next.

Only the contents count.  Touching a file or saving it with no change does not trigger a reload.  After a reload the document has the new hash, and the file is no longer pending.

When a file turns out to hold nothing the document records, for example a save that changed only something that Umamo does not read, a reload finds nothing to do and says so with ``The artwork file(s) have not changed.``  The file is then acknowledged, and the watcher leaves it alone until it changes again.

If a watched file goes away, the status bar says ``Name is no longer where the document read it.``, the log has a line for it, and the file is shown as missing in the Sources editor.  When it comes back, it is checked again, and if its contents differ it is pending as above.  See :doc:`/artwork/relinking_and_reloading`.

Files Changed While Closed
==========================

A file can change when the document is not open.  When Umamo starts watching the files of a document, which is when the document is opened, it checks each once against what the document recorded:

* By the hash, when the document has one.
* By the time the file was last changed, when it has no hash.  That is so for a model that came from a CMO3, which does not record hashes.

A file that differs is **pending**, and the status bar says ``2 artwork file(s) changed since they were last read.  Press Reload to take the changes.``

In both modes that watch, this check never reloads by itself.  The reload button gets its alert mark, and you press it when you are ready.  It is the safe way to open a document: you see what changed before the model does.

A file whose time changed but whose contents did not is cleared by the first reload, which finds nothing to change.

The Header Indicator
====================

The button with the circular arrow in the header of the Sources editor is the indicator.  Its glyph has an alert mark while any watched file is pending, and its tooltip then says ``Artwork files changed on disk.  Reload to take the changes.``  Press it to reload the pending files, and the other files with them.  The mark goes when the reload has taken the changes.

The indicator is in the Sources editor, so you see it only where that editor is open.  The Texture workspace has one, and the Modelling workspace does not.  The status bar notice is the sign you see anywhere, and it goes after a few seconds.  To keep the mark in view, add a Sources editor to the workspace.  See :doc:`/editors/sources`, :doc:`/interface/workspaces`, and :doc:`/interface/status_bar`.

.. seealso::

	* :doc:`/artwork/relinking_and_reloading`
	* :doc:`/interface/settings`
	* :doc:`/editors/sources`
