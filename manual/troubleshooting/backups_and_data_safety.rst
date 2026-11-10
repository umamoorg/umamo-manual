***********************
Backups and Data Safety
***********************

Umamo is in alpha and should not be trusted blindly.  A bug can damage a puppet file (a UMA, MOC3, or CMO3 file), and Umamo does not save for you.  This page highlights what Umamo does to protect your work, what it leaves to you, and what to do when something has gone wrong.  :doc:`/files/uma` has the details of saving.

Umamo protects your work in these ways:

* It asks before it replaces or closes a puppet file that has unsaved changes.
* It leaves the old file in place if the save fails.
* An import never changes the file you imported, and an export never changes the open puppet file or the original file.
* A file that fails to open leaves the currently open puppet file as is, and an export that fails, including one that runs out of memory, does not cost you the file.
* It waits for a save or an export that is in progress before it quits or replaces the puppet file.
* Each session writes a log, so a crash leaves a record.

No Autosave
===========

There is no autosave and no automatic backup.  Changes that are not saved are lost when Umamo closes, crashes, or is stopped.  So is the undo history, which is never saved.  The title bar shows a ``*`` while there are unsaved changes.

Settings are different.  Umamo saves a change to a setting at once.

Making Your Own Backups
=======================

* **Keep the originals.**  Do not work on your only copy of a CMO3, MOC3, or artwork file.  An import and an export leave the file as it was, but a mistake with a file manager does not.  Work in UMA files.
* **Save a copy before something drastic.**  Use :menuselection:`File --> Save As…` before a repack of the atlas, a reload of all artwork, or generating meshes for the entire puppet file, and keep working in the new file.  The old file is your way back.
* **Copy the file now and then.**  A UMA file is a single file.  Copy it in your file manager, or let your backup program do it.
* **Do not count on undo.**  The history is for the session, and it is gone once the puppet file is closed.

Make second copies of your files to play with, and do not use the original copies.

After a Crash
=============

* The work since your last save is lost.  There is no recovery file.
* The file is as you last saved it.  A save is written to a temporary file next to it, and only a finished file replaces the old one.  Open it with :menuselection:`File --> Open Recent`.
* An interrupted save can leave a hidden file, whose name starts with a dot and contains ``.tmp-``.  It is not finished and cannot be used as a backup.  The next save of the same puppet file removes it.
* The log of the session that crashed is in the log folder.  It has the cause, if Umamo could write it down.  Please report the crash.  See :doc:`/troubleshooting/reporting_bugs`.

Unsaved-Changes Prompts
=======================

New, Open, the imports, and Exit ask first when the puppet file has unsaved changes, and so do the close button of the window and the quit command of the operating system:

``The puppet has unsaved changes.  Save them first?``

:guilabel:`Save` saves your work, :guilabel:`Don't Save` goes on without saving, and :guilabel:`Cancel` stays where you are.

Only changes to the model count.  Moving a parameter slider, selecting something, and moving the view do not, and neither does an export.  Undoing back to the saved point clears the ``*``.  See :doc:`/files/uma`.

Read-Only Puppet Files
======================

An UMA file from a newer version of Umamo can hold extra fields that may not be read by older versions.  To enforce read-compatibility, Umamo opens it as read-only.  An alert says so when it opens, and the title ends with ``(read-only)``.  You can edit it, but Save and Save As are greyed out, so nothing can be saved over the newer file.

To save edits, update Umamo to the version that created the file, or export the UMA file as a CMO3, a MOC3, or an image.  See :doc:`/getting_started/updating`.

What Saving to UMA Removes
==========================

An UMA file keeps the rig, the atlas, the list of artwork files, and the state of the editor.  It does not keep:

* The undo history.
* Cubism-specific data.  The first time you save a UMA file that came from a CMO3, the status bar says that the physics, guides, keyform notes, random pose, model state sets, user data, and other settings of the Cubism Editor are not in the UMA file.  For a MOC3 it names the physics, motions, expressions, user data, and pose.
* The artwork files themselves.  Keep them where the puppet file expects them.

Cubism specific data is kept for as long as the CMO3 or MOC3 puppet file stays open, so a CMO3 that you export in the same session still has it.  A CMO3 that you export after you reopen the UMA file does not.  If you need that data, keep the original Cubism files, and export from the session that imported them.

.. seealso::

	* :doc:`/files/uma`
	* :doc:`/appendices/faq`
	* :doc:`/about/introduction`