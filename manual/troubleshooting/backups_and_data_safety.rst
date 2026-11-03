***********************
Backups and Data Safety
***********************

Umamo is alpha level software.  A bug can damage a document, and Umamo does not save for you.  This page says what Umamo does to protect your work, what it leaves to you, and what to do when something has gone wrong.  :doc:`/files/uma` has the details of saving.

Umamo protects your work in these ways:

* It asks before it replaces or closes a document that has unsaved changes.
* It writes a file in a way that leaves the old file in place if the write fails.
* An import never changes the file you imported, and an export never changes the open document or the original file.
* A file that fails to open leaves the open document as it was, and an export that fails, including one that runs out of memory, does not cost you the document.
* It waits for a save or an export that is in progress before it quits or replaces the document.
* Each session writes a log, so a crash leaves a record.

No Autosave
===========

There is no autosave and no automatic backup.  Changes that are not saved are lost when Umamo closes, crashes, or is stopped.  So is the undo history, which is never saved.  The title of the window shows a ``*`` while there are unsaved changes.

Settings are different.  Umamo saves a change to a setting at once.

Making Your Own Backups
=======================

* **Keep the originals.**  Do not work on your only copy of a CMO3, MOC3, or artwork file.  An import and an export leave the file as it was, but a mistake with a file manager does not.  Work in UMA files.
* **Save a copy before something drastic.**  Use :menuselection:`File --> Save As…` before a repack of the atlas, a reload of all artwork, or generating meshes for a whole document, and keep working in the new file.  The old file is your way back.
* **Copy the file now and then.**  A UMA file is a single file.  Copy it in your file manager, or let your backup program do it.
* **Do not count on undo.**  The history is for the session, and it is gone once the document is closed.

Make second copies of your files to play with, and do not use the original copies.

After a Crash
=============

* The work since your last save is lost.  There is no recovery file.
* The file you saved last is as you saved it.  A save is written to a temporary file next to it, and only a finished file replaces the old one.  Open it with :menuselection:`File --> Open Recent`.
* An interrupted save can leave a hidden file beside the document, whose name starts with a dot and contains ``.tmp-``.  It is not finished and cannot be used as a backup.  The next save of the same document removes it.
* The log of the session that crashed is in the log folder.  It has the cause, if Umamo could write it down.  Please report the crash.  See :doc:`/troubleshooting/reporting_bugs`.

Unsaved-Changes Prompts
=======================

New, Open, the imports, and Exit ask first when the document has unsaved changes, and so do the close button of the window and the quit command of the operating system:

``The document has unsaved changes.  Save them first?``

:guilabel:`Save` saves and then goes on, :guilabel:`Don't Save` goes on without saving, and :guilabel:`Cancel` stays where you are.  When the question is about quitting, it reads ``Save them before quitting?``

Only changes to the model count.  Moving a parameter slider, selecting something, and moving the view do not, and neither does an export.  Undoing back to the saved point clears the ``*``.  See :doc:`/files/uma`.

Read-Only Documents
===================

A UMA file from a newer version of Umamo can hold something that this version cannot read.  When that something is needed to edit the document, Umamo opens the document read-only.  An alert says so when it opens, and the title ends with ``(read-only)``.  You can edit it, but Save and Save As are greyed out, so nothing can be saved over the newer file.  The prompt about unsaved changes offers :guilabel:`Discard` and :guilabel:`Cancel` only.

To keep your work, update Umamo to the version that made the file, or export what you did as a CMO3, a MOC3, or an image.  The file itself is never changed.  See :doc:`/getting_started/updating`.

What Saving to UMA Drops
========================

A UMA file keeps the rig, the atlas, the list of artwork files, and the state of the editor.  It does not keep:

* The undo history.
* Data that only Cubism knows about.  The first time that you save a document that came from a CMO3, the status bar says that the physics, guides, keyform notes, random pose, model state sets, user data, and other settings of the Cubism Editor are not in the file.  For a MOC3 it names the physics, motions, expressions, user data, and pose.
* The artwork files themselves.  Keep them where the document expects them.

The data that Cubism knows about is kept for as long as the document stays open, so a CMO3 that you export in the same session still has it.  A CMO3 that you export after you reopen the UMA file does not.  If you need that data, keep the original Cubism files, and export from the session that imported them.

.. seealso::

	* :doc:`/files/uma`
	* :doc:`/appendices/faq`
	* :doc:`/about/introduction`
