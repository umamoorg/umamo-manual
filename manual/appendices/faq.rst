***
FAQ
***

Frequently Asked Questions and associated documentation, if you want more detailed answers.

Project and Support
===================

Is Umamo free?
	Yes.  Umamo is free and open source, and it is licensed under the GPLv3.  See :doc:`/about/license`.

Can I support the project financially?
	Yes, but you do not have to.  See :ref:`supporting-the-project`.

Is Umamo made by Live2D?
	No.  Umamo is an independent, community-developed project, and it is not affiliated with, authorized by, endorsed by, or sponsored by Live2D Inc.  See :doc:`/appendices/legal`.

Is Umamo finished?
	No.  Umamo is in early development, and it is alpha level software that is available for testing.  A project can be damaged or lost, so make regular backups.  See :doc:`/about/introduction` and :doc:`/troubleshooting/backups_and_data_safety`.

Where can I ask for help?
	In this manual, on the Umamo Discord, and in the GitHub issues.  See :doc:`/about/introduction`.

How do I report a bug?
	Open an issue on GitHub, and attach the newest log file.  See :doc:`/troubleshooting/reporting_bugs`.

Can I contribute?
	Small fixes are welcome.  Large code contributions from outside are not being accepted at the moment, because development moves quickly.  Human translations are wanted.  See :doc:`/about/contribute/index` and :doc:`/about/contribute/translations`.

Features and Roadmap
====================

Does Umamo do animation yet?
	Not yet.  It is a long term goal.  The modelling tools, the UV editor, and the physics interface come first.

Does Umamo have physics?
	Not yet.  Umamo does not edit or play physics.  It keeps the physics of a model that has them, and writes them back when you export.  See :doc:`/rigging/physics`.

Does Umamo support pen pressure and tilt?
	Not yet.  A pen that your operating system turns into mouse input drives Umamo like a mouse.  See :doc:`/interface/pen_and_touch`.

Is there an Android or an iPad version?
	Not yet.  See :doc:`/about/introduction`.

Can I make rotation deformers, glue, or blend shapes?
	Not yet.  Umamo can carry them, play them, and write them back, and it can make warp deformers.  See :doc:`/rigging/index`.

Why are some controls missing?
	The Runtime Target of the document hides the controls of the features that the target version of Cubism cannot play.  Nothing is removed from the document.  Set the target to :guilabel:`No Target (All Features)` to see all of them.  See :doc:`/files/runtime_targets`.

Files and Formats
=================

Which files can Umamo open and save?
	It opens and saves its own UMA files, imports and exports CMO3 and MOC3 files, and reads artwork from PSD, CLIP, KRA, and flat image files.  See :doc:`/files/format_support`.

Can I open my Cubism project?
	Yes.  Choose :menuselection:`File --> Import --> CMO3…`.  Umamo is tested with the Cubism Editor 4.2 to 5.4.  See :doc:`/files/cubism_interchange`.

Will a CMO3 that Umamo writes open in the Cubism Editor?
	It is made to.  The report that follows an export lists what could not be carried over.  See :doc:`/files/export_notices`.

Can I edit a MOC3?
	You can import one and edit its rig.  A MOC3 has no layers, so there is no artwork to edit, and adding artwork to it is refused.  To add artwork, export the document as a CMO3, import that, and add the artwork there.  See :doc:`/files/cubism_interchange`.

Does Umamo change my artwork files?
	No.  PSD, CLIP, and KRA files are only read, and an import never changes the file that you imported.  See :doc:`/artwork/importing`.

Umamo does not read a newer version of a file format.  Can you add it?
	Yes, please.  Search the GitHub issues, and if nobody has reported it, open a new issue that describes the problem and attach a sample file.  See :doc:`/troubleshooting/reporting_bugs`.

Can Umamo open UMA files from an older version?
	Yes, with one exception: UMA files that hold meshes and were saved by version 0.4.0 cannot be read by 0.5.0.  A file from a newer version opens read-only if it needs something that your version lacks.  See :doc:`/files/uma`.

Data Safety
===========

Umamo lost my work.  What can I do?
	Look for the file you saved last, and open it with :menuselection:`File --> Open Recent`.  Work since the last save is lost, because Umamo does not save for you and keeps no recovery file.  Keep your originals, work on copies, and save often.  See :doc:`/troubleshooting/backups_and_data_safety`.

Does Umamo save automatically?
	No.  There is no autosave and no automatic backup.  See :doc:`/troubleshooting/backups_and_data_safety`.

Does Umamo warn me about unsaved changes?
	Yes.  It asks before it replaces or closes a document that has unsaved changes.  The title of the window shows a ``*`` while there are some.

What does a UMA file not keep?
	The undo history, the data that only Cubism knows, such as physics, and the artwork files themselves.  See :doc:`/files/uma`.

Settings and Logs
=================

Where are my settings, and how do I reset them?
	In the ``settings.json`` file of your user folder.  Quit Umamo and delete it to go back to the defaults.  See :doc:`/getting_started/configuration`.

Where are the log files?
	:menuselection:`Help --> Open Log Folder…` opens the folder.  The newest file is the one to attach to a bug report.  See :doc:`/editors/logs`.

How do I change the language?
	Open :menuselection:`Edit --> Settings…`, choose the :guilabel:`Interface` category, and set :guilabel:`Language`.  See :doc:`/interface/settings`.

How do I change a shortcut, or choose another set of shortcuts?
	In the :guilabel:`Keybindings` category of Settings.  See :doc:`/interface/keymap`, and :doc:`/appendices/default_shortcuts` for the lists.

How do I put the windows back where they were?
	Choose :menuselection:`Workspace --> Reset Workspace`.  See :doc:`/interface/workspaces`.

How do I turn off the check for updates?
	Clear :guilabel:`Check for updates when Umamo starts`, in the :guilabel:`Interface` category of Settings.  See :doc:`/getting_started/updating`.

Platforms
=========

Which systems does Umamo run on?
	Windows 10 and 11, macOS, and Linux.  See :doc:`/getting_started/system_requirements`.

Do I need Java?
	Not for the installers and the portable archives, which carry their own.  The ``.jar`` needs Java 21 or newer.  See :doc:`/getting_started/system_requirements`.

Windows says ``Windows protected your PC``.  Is the download safe?
	The Windows builds are not signed yet, so Windows warns about them.  You can check that a download is the one that was published.  See :doc:`/troubleshooting/platform_notes` and :doc:`/getting_started/verifying_downloads`.

Umamo is slow, or it ran out of memory.
	A whole model is kept in memory, so large models and large artwork need much of it.  See :doc:`/troubleshooting/performance_and_memory`.

Does Umamo run on WSL2?
	Yes, but use the native Windows build when you can.  See :doc:`/troubleshooting/platform_notes`.

.. seealso::

	* :doc:`/about/introduction`
	* :doc:`/troubleshooting/backups_and_data_safety`
	* :doc:`/files/format_support`
