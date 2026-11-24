****
Logs
****

The Logs editor shows the messages that Umamo writes about what it is doing: which file it opened, which export it ran, what it could not do and why.  It is for finding out what happened when something does not work as you expect.  It is also there for people who start Umamo from a shortcut and have no terminal to read the messages in.

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: A Logs editor in an area, with about a dozen lines, the Copy to Clipboard and Export to File buttons at the right of its header, and at least one warning line and one error line, so the colors can be told apart.
	:Setup: Start Umamo, open a model, try to import a file that is not a model (an error), and switch an area to Logs.
	:Crop: The Logs area, with its header.
	:Save as: ``images/editors/logs.png``
	:Caption: The Logs editor.

Reading the Log
===============

The log lists the lines in the order they were written, oldest at the top.  A long line wraps, so it can be read whole.  Each line is colored by its severity:

* **Information** is dimmed.  It says what Umamo did.
* **Warnings** are in the normal text color.  They say that something was not as expected but the work went on, such as a file that could not be read for an optional part.
* **Errors** are in the accent color.  They say that something failed.

The first lines of every session say which version of Umamo is running, on which Java and operating system, how Umamo was started, and how much memory it may use.  They are the lines to quote in a bug report.  See :doc:`/troubleshooting/reporting_bugs`.

While you are at the bottom of the list, new lines scroll into view as they arrive.  Scroll up and the list stays where you put it.  An empty log says ``No log output yet``.

The editor keeps the last 2000 lines.  Older lines are dropped from the editor, but the log file of the session still has them.  See `Session Log Files`_.

Two buttons are at the right end of the header.

Copy to Clipboard
=================

The first button copies every line in the editor to the clipboard as plain text, one line for each entry.  Paste it into a message or an issue.

It copies what the editor shows.  The error lines have the short cause that follows the message, and not the full report with all of its steps.  For a crash, attach the log file instead.

Exporting to a File
===================

The second button, :guilabel:`Export to File…`, writes the same lines to a text file.  A file dialog asks where, and suggests the name ``umamo-log.txt``.  It writes the log as it is when you confirm the dialog.  The command is also in the command palette as :guilabel:`Export to File…`.

Session Log Files
=================

Besides the editor, Umamo writes every session to a file of its own, with a time and a severity on each line, and the full report of each error.  That is the file to attach to a bug report.  The folder is opened by :menuselection:`Help --> Open Log Folder…`.  Umamo keeps the last ten sessions.  See :doc:`/getting_started/configuration` for where the folder is, and :doc:`/troubleshooting/reporting_bugs` for how to use it.

The editor and the file are the same log: the editor is the latest 2000 lines of it, without the times.

.. seealso::

	* :doc:`/getting_started/configuration`
	* :doc:`/troubleshooting/reporting_bugs`
