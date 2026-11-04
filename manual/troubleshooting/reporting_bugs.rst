**************
Reporting Bugs
**************

A good report lets the developer see the problem you saw.  This page says what to check first, how to find the log file, and what to include in a bug report.  Umamo is early alpha software, so reports are welcome and bugs are expected.

Before Reporting
================

#. **Look it up.**  Some things are not built yet.  The pages for those features say so at the top, and a page for a feature that works only in part ends with a Current Limitations section.  The release notes list what has changed in each version.  See :doc:`/appendices/release_notes`.
#. **Search the issues.**  The `issue list <https://github.com/umamoorg/umamo/issues>`__ may have your problem already.  Add what you know to the issue that is there, rather than opening a second one.
#. **Use the newest release.**  The problem may be fixed.  :menuselection:`Help --> Check for Updates…` tells you.  See :doc:`/getting_started/updating`.
#. **Try again.**  Restart Umamo and repeat the steps.  A problem that happens every time is much easier to find than one that happened once.
#. **Protect your work.**  Save a copy of your puppet file under a new name before you try anything else.  See :doc:`/troubleshooting/backups_and_data_safety`.

Collecting Information
======================

Version
-------

:menuselection:`Help --> About Umamo…` shows the version.  The log records it as well, together with the version of Java, the operating system, and how Umamo was started.

The Log File
------------

Every time Umamo starts it opens a new log file, and writes each warning and error to it as they happen, with a full report of the cause.  The file is complete even if Umamo crashes.  This is what to attach to a report.

:menuselection:`Help --> Open Log Folder…` opens the folder that holds the log files in your file manager.  If it cannot, an alert tells you where the folder is.  The folders are:

.. list-table::
	:header-rows: 1

	* - System
	  - Folder
	* - Windows
	  - ``%LOCALAPPDATA%\umamo\logs``
	* - macOS
	  - ``~/Library/Application Support/umamo/logs``
	* - Linux
	  - ``~/.local/share/umamo/logs``, or ``$XDG_DATA_HOME/umamo/logs`` when that variable is set

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: The Help menu open, with Open Log Folder… and About Umamo… readable.
	:Setup: Launch Umamo and open the Help menu.
	:Crop: The menu bar and the open menu only.
	:Save as: ``images/troubleshooting/help_menu.png``
	:Caption: The Help menu.

Each session has a file of its own, named for the time it started, such as ``session-2026-09-24T03-12-45Z-7f3a.log``.  Attach the newest one.  Umamo keeps the last ten sessions and removes the older files.  When you run two copies of Umamo at the same time, each one writes its own file.

A log file is capped at 2 MB, after which only errors are written, and at 3 MB, after which nothing is.  A line in the file says when that happens.

The :doc:`Logs editor </editors/logs>` shows the same lines while Umamo runs, and can copy them or export them to a file.  It does not keep the reports of the causes of errors, so attach the file from the folder and not the copy.

.. warning::

	The log names the files that you opened, saved, and exported, with their folders.  Read it before you post it where everyone can see it, and remove what you do not want to share.

Checking an Installation
------------------------

If Umamo will not start, or a part of it does not work at all, ask it to check itself.  Start it from a terminal with ``--self-check``, using the launcher of your installation (``umamo/bin/umamo`` for the Linux archive, ``Umamo.exe`` on Windows) or the ``.jar``.  It opens no window.  It tests the Java runtime, the libraries that Umamo needs for images, graphics, and file formats, the bundled files, and the storage folders, and prints one line for each.

.. code-block:: text

	umamo --self-check
	java -jar umamo-<target>-<version>.jar --self-check

A line reads ``name: OK`` with a detail, or ``name: FAILED`` with the reason.  The last line says whether every check passed, and the exit code is 0 when they did.  The checks end by themselves after 60 seconds.

On Windows the launcher does not print to a terminal.  Give it the name of a file, and it writes the report there:

.. code-block:: text

	Umamo.exe --self-check report.txt

Include the report in your issue when a check fails.

A Sample File
-------------

A problem with a file format is hard to find without the file.  Attach a file that shows the problem, as small as you can make it, such as one drawable with the same trouble, and name the program and version that made it.  Only attach files that you may share.

What to Include
===============

* **A short title** that says what went wrong, such as ``Export MOC3 stops with an alert when a part has no drawables``.
* **What you did**, step by step, from a document that is open.  Say which menu rows, editors, and settings you used.
* **What you expected**, and **what happened instead**.  An exact message is better than a description of it.  The text of an alert can be selected and copied.
* **Your version**, your operating system, and whether you use an installer, a portable archive, or the ``.jar``.
* **The log file** of the session in which it happened.
* **A sample file**, for a problem with a format or with one particular model.
* **The export report**, for a problem with an export.  Copy its text, and say which format and which Runtime Target the document had.  See :doc:`/files/export_notices`.
* **A screenshot or recording**, for a problem that you can see.

Does it also happen in a new document, or with the settings reset to their defaults?  Say so, either way.  The settings file is described in :doc:`/getting_started/configuration`.

Where to Report
---------------

* Bugs and format requests go to `GitHub Issues <https://github.com/umamoorg/umamo/issues>`__.  `Open a new issue <https://github.com/umamoorg/umamo/issues/new>`__ when no issue has your problem already.
* Questions, and talk about how to do something, go to the `Umamo Discord <https://discord.gg/TRAhW5Uc2t>`__.

Requesting Format Support or Features
=====================================

Umamo does not know a newer version of a Cubism, Krita, or Clip Studio Paint file until someone shows it one.  If a file does not open, or opens wrongly, report it as a bug with the file attached.  Say which program and which version saved it.  The developer can only add support for a format by looking at files that it writes.

For a feature, explain what you are trying to do and where it gets in your way, and not only the way you think it should work.  Several things are known to be missing: animation, physics, and pen pressure and tilt.  Search the issues before you add a request.  See :doc:`/about/introduction`.

Contribution Provenance Rule
============================

Umamo's CMO3, MOC3, and CLIP support is a clean-room implementation.  It was built by observing what the files contain and from documentation that others wrote independently, and not from the code of the official Live2D software.  Anyone who contributes to Umamo affirms that:

#. They used no official Live2D or Cubism source code, and no decompiled binaries, as a basis.  What they know comes from looking at files and from public, independently written documentation.
#. They are not bound by an agreement with Live2D that their contribution would break, and they will say so before they contribute if they are.
#. They are not, and have not been, an employee of Live2D or Cybernoids.

If you have seen the source code of Live2D software, or decompiled binaries, please do not contribute to Umamo.  The same care applies to a report: describe what you can see in the files and in the program, and do not paste code from official software.

See :doc:`/appendices/legal` for the whole statement.

.. seealso::

	* :doc:`/editors/logs`
	* :doc:`/getting_started/configuration`
	* :doc:`/appendices/legal`
