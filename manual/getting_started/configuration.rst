*************
Configuration
*************

Umamo keeps what you choose in one settings file, and it writes its log files to a folder of their own.  Both are in your user folders and not in the installation, so they survive an upgrade and an uninstall.  This page says where they are, what is in them, and how to start again from the defaults.

Settings File
=============

The settings are in a file called ``settings.json``, in this folder:

.. list-table::
	:header-rows: 1

	* - System
	  - Folder
	* - Windows
	  - ``%APPDATA%\umamo``
	* - macOS
	  - ``~/Library/Application Support/umamo``
	* - Linux
	  - ``~/.config/umamo``, or ``$XDG_CONFIG_HOME/umamo`` when that variable is set

Umamo does not have a menu row for this folder, so open it in your file manager.  :menuselection:`Help --> Open Log Folder…` opens the folder for the logs.

You do not need to look in the file.  Every setting that has a control is changed in :menuselection:`Edit --> Settings…`, and the change is saved at once.  See :doc:`/interface/settings`.

The file does not hold every setting.  Umamo has its defaults built in, and the file holds only the settings that have been written to it, which are your choices and what Umamo remembers for you.  A setting that is not in the file has its default value.  The file is created the first time Umamo starts.

Every build on a computer reads and writes this same file: the installed copy, a portable copy, a ``.jar``, and different versions.  The file is plain text in JSON.  If you edit it by hand:

* Close Umamo first.  Umamo keeps the settings in memory and writes the whole file whenever one changes, so your edit would be overwritten.
* Keep it valid JSON.  A file that Umamo cannot read is ignored, and the defaults are used.  The next setting that you change then replaces the file, and what was in it is lost.  Keep a copy.

What It Stores
==============

.. list-table::
	:header-rows: 1

	* - Settings
	  - What is in them
	* - ``localization``
	  - The language of the interface.
	* - ``input.keybinding``
	  - The keyboard shortcut preset that you chose, and the shortcuts that you changed.
	* - ``interface``
	  - The theme, the number of undo steps, the layout of the workspaces, and the size and place of the window.
	* - ``viewport``
	  - The zoom steps, the grids, the quality of the drawing, whether the toolbar and sidebar start open, and the colors of the selection, the mesh editing, and the deformers.
	* - ``import``
	  - How artwork is added: the parameter template, where it is placed, the initial mesh, whether the files are watched, and the Sources editor's options.
	* - ``meshGeneration``
	  - The preset for Generate Mesh from Art.
	* - ``app``
	  - The recent files, whether to check for updates and when it last did, the update that you skipped, and whether to show the low-memory alert.

Most of these have a control in Settings.  The shortcuts and the colors are in the :guilabel:`Keybindings` and :guilabel:`Colors` categories.  Settings that belong to one document, such as the view of each area, are saved in the document and not here.  See :doc:`/files/uma`.

Log Files
=========

Umamo writes a log file for each session, in a ``logs`` folder:

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

:menuselection:`Help --> Open Log Folder…` opens it.  Umamo keeps the last ten sessions.  The newest file is the one to attach to a bug report.  See :doc:`/troubleshooting/reporting_bugs` and :doc:`/editors/logs`.

Resetting Settings
==================

To go back to the defaults for everything:

#. Quit Umamo.
#. Delete ``settings.json``, or rename it if you want to keep it.
#. Start Umamo.

Umamo then starts as it did the first time: Quick Setup opens, the language is matched to your system again, and the workspaces, the window, and the recent files are back to their start.  Your documents and your log files are not touched.  See :doc:`/getting_started/first_launch`.

To reset one part, you do not need to delete the file:

* :guilabel:`Reset to Preset` in the :guilabel:`Keybindings` category of Settings undoes your changed shortcuts.
* :menuselection:`Workspace --> Reset Workspace` puts the workspace that you are in back to its default layout.

Window and Layout Persistence
=============================

**The window.**  When you close the window, Umamo saves its size, its place on the screen, and whether it is maximized or full screen.  The next start opens it the same way.  A maximized window remembers the size it had before, and goes back to it when you un-maximize.  The first time, it is 1280 by 800 pixels.

**The layout.**  The workspaces are saved as you change them: which workspace is active, the tabs and their names, the order of the tabs, how each is split into areas, the size of the areas, and which editor each area shows.  The save follows a moment after you stop, and waits while you are dragging a splitter.  See :doc:`/interface/workspaces`.

**Moving a layout.**  A layout is a part of ``settings.json``, and it can also go to a file of its own, to share it or to carry it to another computer:

* :menuselection:`Workspace --> Export This Workspace…` saves the active workspace.
* :menuselection:`Workspace --> Export All Workspaces…` saves all of them.
* :menuselection:`Workspace --> Import Workspace…` reads such a file.  A file with one workspace adds it as a new tab.  A file with all of them replaces every workspace you have, after Umamo asks ``Replace all workspaces with the imported file?``  A file that is neither is refused, and the log says so.

Which parts of a workspace a document remembers, such as the pan and zoom of a viewport, is a different matter.  That is saved in the UMA file.  See :doc:`/files/uma`.

.. seealso::

	* :doc:`/interface/settings`
	* :doc:`/interface/workspaces`
	* :doc:`/troubleshooting/reporting_bugs`
