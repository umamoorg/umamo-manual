*************
Configuration
*************

Umamo stores your choices in a single settings file and writes its log files to a separate folder.  Both are in your user folders and not in the installation, so they are kept when you upgrade or uninstall.  This page describes where they are, what they contain, and how to start again from the defaults.

Settings File
=============

The settings are in a file called ``settings.json``, in this folder:

.. list-table::
	:header-rows: 1

	* - System
	  - Folder
	* - Windows
	  - ``%APPDATA%\umamo``
	* - MacOS
	  - ``~/Library/Application Support/umamo``
	* - Linux
	  - ``~/.config/umamo``, or ``$XDG_CONFIG_HOME/umamo`` when that variable is set

Umamo does not have a menu row for this folder so open it in your file manager.  :menuselection:`Help --> Open Log Folder…` opens the folder for the logs.

You do not need to open the file.  Every setting that has a control can be changed in :menuselection:`Edit --> Settings…` and the change is saved immediately.  See :doc:`/interface/settings`.

The file does not contain every setting.  Umamo has its defaults built in and the file only holds the settings that have been written to it, which are your choices and what Umamo remembers for you.  A setting that is not in the file uses its default value.  The file is created the first time Umamo starts.

Every build on a computer reads and writes this same file, including installed copies, portable copies, ``.jar`` builds, and different versions.  The file is plain text in JSON format.  If you edit it by hand:

* Close Umamo first.  Umamo keeps the settings in memory and rewrites the whole file whenever one changes, so your edit would be overwritten.
* Keep the file valid JSON.  A file that Umamo cannot read is ignored and the defaults will be used.  The next setting that you change will then replace the file and its previous contents are lost, so keep a copy.

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

Most of these have a control in Settings, and the shortcuts and colors are in the :guilabel:`Keybindings` and :guilabel:`Colors` categories.  Settings that belong to one document, such as the view of each area, are saved in the UMA file and not here.  See :doc:`/files/uma`.

Log Files
=========

Umamo writes a log file for each session to a ``logs`` folder:

.. list-table::
	:header-rows: 1

	* - System
	  - Folder
	* - Windows
	  - ``%LOCALAPPDATA%\umamo\logs``
	* - MacOS
	  - ``~/Library/Application Support/umamo/logs``
	* - Linux
	  - ``~/.local/share/umamo/logs``, or ``$XDG_DATA_HOME/umamo/logs`` when that variable is set

:menuselection:`Help --> Open Log Folder…` opens this folder.  Umamo keeps the logs of the last ten sessions.  Attach the newest file when you report a bug.  See :doc:`/troubleshooting/reporting_bugs` and :doc:`/editors/logs`.

Resetting Settings
==================

To go back to the defaults for everything:

#. Quit Umamo.
#. Delete ``settings.json``, or rename it if you want to keep it.
#. Start Umamo.

Umamo will then start as it did the first time.  Quick Setup opens, the language is matched to your system again, and the workspaces, window, and recent files are back to their defaults.  Your documents and log files are not touched.  See :doc:`/getting_started/first_launch`.

To reset only one part, you do not need to delete the file:

* :guilabel:`Reset to Preset` in the :guilabel:`Keybindings` category of Settings undoes your changed shortcuts.
* :menuselection:`Workspace --> Reset Workspace` puts the workspace that you are in back to its default layout.

Window and Layout Persistence
=============================

**The window.**  When you close the window Umamo saves its size, its position on the screen, and whether it is maximized or full screen.  The next start opens it the same way.  A maximized window remembers the size it had before and returns to it when you un-maximize it.  The first time Umamo starts the window is 1280 by 800 pixels.

**The layout.**  The workspaces are saved as you change them.  This includes which workspace is active, the tabs and their names, the order of the tabs, how each is split into areas, the size of the areas, and which editor each area shows.  See :doc:`/interface/workspaces`.

**Moving a layout.**  A layout is part of ``settings.json`` and can also be exported to a file of its own to share it or to move it to another computer:

* :menuselection:`Workspace --> Export This Workspace…` saves the active workspace.
* :menuselection:`Workspace --> Export All Workspaces…` saves all of them.
* :menuselection:`Workspace --> Import Workspace…` imports such a file.  A file with one workspace adds it as a new tab.  A file with all workspaces replaces every workspace you have after Umamo asks ``Replace all workspaces with the imported file?``  Any other file is refused and the reason is written to the log.

What a document remembers about a workspace, such as the pan and zoom of a viewport, is saved in the UMA file and not here.  See :doc:`/files/uma`.

.. seealso::

	* :doc:`/interface/settings`
	* :doc:`/interface/workspaces`
	* :doc:`/troubleshooting/reporting_bugs`
