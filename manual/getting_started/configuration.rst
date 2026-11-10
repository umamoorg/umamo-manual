*************
Configuration
*************

Umamo stores your choices in a single settings file and writes its log files to a separate folder.  Both are in your user folders and not in the installation folder so they are kept when you upgrade or uninstall the application.  This page describes where they are, what they contain, and how to start again from the defaults.

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

Since Umamo does not have a menu row to open the settings folder you will need to open it in your file manager.

Every setting that has a control can be changed in :menuselection:`Edit --> Settings…` and the change is saved immediately.  See :doc:`/interface/settings`.

Every build on a computer reads and writes this same file, including installed copies, portable copies, ``.jar`` builds, and different versions.  The file is plain text in JSON format.  If you edit the file by hand:

* Close Umamo first.  Umamo keeps the settings in memory and rewrites the whole file with the settings from memory whenever one changes.
* Keep the file valid JSON.  If the JSON is invalid Umamo will discard it and write out new settings.

What It Stores
==============

.. list-table::
	:header-rows: 1

	* - Settings
	  - What is in them
	* - ``localization``
	  - The language of the interface.
	* - ``input.keybinding``
	  - The keyboard shortcut preset and changed shortcuts.
	* - ``interface``
	  - The theme, the number of undo steps, the layout of the workspaces, and the size and place of the window.
	* - ``viewport``
	  - The zoom steps, the grids, colors, and others.
	* - ``import``
	  - Default import options for importing artwork and models.
	* - ``meshGeneration``
	  - The preset for Generate Mesh from Art.
	* - ``app``
	  - The recent files, the last update check, and others.

Most of these have a control in Settings.  The shortcuts and colors are in the :guilabel:`Keybindings` and :guilabel:`Colors` categories.  Settings that belong to one puppet, such as the view of each area, are saved in its UMA file.  See :doc:`/files/uma`.

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

:menuselection:`Help --> Open Log Folder…` opens this folder.  Umamo keeps the logs of the last ten sessions.  When reporting bugs please attach the newest file.  Note, log folders may contain personal information such as your user profile folder name.  See :doc:`/troubleshooting/reporting_bugs` and :doc:`/editors/logs`.

Resetting Settings
==================

To go back to the defaults for everything:

#. Quit Umamo.
#. Delete ``settings.json`` or rename it if you want to keep it.
#. Start Umamo.

Umamo will then start up with default settings.  See :doc:`/getting_started/first_launch`.

Some settings can be reset in the application:

* :guilabel:`Reset to Preset` in the :guilabel:`Keybindings` category of Settings to reset your changed shortcuts.
* :menuselection:`Workspace --> Reset Workspace` resets the active workspace to its default layout.

Window and Layout Persistence
=============================

**The window.**  When you close the window Umamo saves its size, its position on the screen, and whether it is maximized.  A maximized window remembers the size it had before and returns to it when you unmaximize it.

**The layout.**  The workspaces are saved as you change them.  This includes which workspace is active, the tab names, the order of the tabs, how each is split into areas, the size of the areas, and which editor each area shows.  See :doc:`/interface/workspaces`.

**Moving a layout.**  A layout is part of ``settings.json`` which can be exported to a file of its own to share it or to move it to another computer:

* :menuselection:`Workspace --> Export This Workspace…` saves the active workspace.
* :menuselection:`Workspace --> Export All Workspaces…` saves all workspaces.
* :menuselection:`Workspace --> Import Workspace…` imports workspaces from a file.  A file with one workspace adds it as a new tab.  A file with all workspaces replaces every workspace you have after Umamo asks ``Replace all workspaces with the imported file?``

What a puppet remembers about a workspace, such as the pan and zoom of a viewport, is saved in its UMA file.  See :doc:`/files/uma`.

.. seealso::

	* :doc:`/interface/settings`
	* :doc:`/interface/workspaces`
	* :doc:`/troubleshooting/reporting_bugs`
