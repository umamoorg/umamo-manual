**************
Platform Notes
**************

Umamo is one program on every system, but installing it, finding its files, and getting graphics to work are different on each.  This page lists the differences, and what to do when a system gets in the way.

The files that Umamo keeps are the same kind everywhere: the settings file, ``settings.json``, and the log folder.  Where they are:

.. list-table::
	:header-rows: 1

	* - System
	  - Settings
	  - Logs
	* - Windows
	  - ``%APPDATA%\umamo``
	  - ``%LOCALAPPDATA%\umamo\logs``
	* - macOS
	  - ``~/Library/Application Support/umamo``
	  - ``~/Library/Application Support/umamo/logs``
	* - Linux
	  - ``~/.config/umamo``
	  - ``~/.local/share/umamo/logs``

An upgrade or an uninstall keeps your settings.  Delete ``settings.json`` to put them back to their defaults.  See :doc:`/getting_started/configuration`.

Windows
=======

Windows 10 and 11 are tested.

**SmartScreen.**  When you run the installer, or ``Umamo.exe`` from the ``.zip``, Windows may show ``Windows protected your PC``.  This is because Umamo's Windows builds are not signed with a code signing certificate yet, which costs too much.  Choose :guilabel:`More info`, then :guilabel:`Run anyway`.  To check that the download is the one that was published, see :doc:`/getting_started/verifying_downloads`.

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: The SmartScreen window with ``Windows protected your PC`` and the More info link, and then the same window with the Run anyway button showing.
	:Setup: Download the ``.msi`` and run it.  Two pictures may be needed.
	:Crop: The SmartScreen window only.
	:Save as: ``images/troubleshooting/smartscreen.png``
	:Caption: SmartScreen on the first run of an unsigned installer.

**The installer.**  The ``.msi`` installs for your own user, in ``%LOCALAPPDATA%\Programs\umamo``, so it needs no administrator rights.  It adds a Start menu entry and registers the ``.uma`` file type.  It has no final screen: when it is finished it just closes.  To remove Umamo, use :menuselection:`Windows Settings --> Apps`.

**The portable archive.**  Extract the ``.zip`` anywhere and run ``Umamo\Umamo.exe``.  It registers nothing, so a double-click on a ``.uma`` file does not open it in Umamo.

macOS
=====

**Apple silicon.**  Open the ``.dmg`` and drag Umamo to Applications.  The disk image and the application are signed and notarized by Apple.

**Intel.**  There is no application for Intel Macs yet.  Install Java 21 or newer, and run the ``.jar``, by double-clicking it or from Terminal:

.. code-block:: bash

	java -XX:MaxRAMPercentage=50 -jar umamo-macos-x64-<version>.jar

The option gives Umamo half of your memory.  See :doc:`/troubleshooting/performance_and_memory`.

macOS 11 and newer on Intel, and macOS 15 and newer on Apple silicon, are tested.  Umamo works there, but it has had less testing than the other two systems.

**Keys.**  The primary modifier of a shortcut is :kbd:`Cmd` on macOS, where this manual writes :kbd:`Ctrl`.  A shortcut that uses the Control key itself, such as Toggle Pose Mode, stays on :kbd:`Ctrl`.  See :doc:`/interface/keymap`.

Linux
=====

Umamo is tested on Ubuntu 22 and 26 and on Fedora 44.

.. list-table::
	:header-rows: 1

	* - Download
	  - Installs
	* - ``.deb``
	  - To ``/opt/umamo`` on Debian 12 and newer, Ubuntu 22.04 and newer, and Linux Mint 21 and newer.  It adds Umamo to the application menu and makes it the program that opens ``.uma`` files.  Remove it with ``sudo apt remove umamo``.
	* - ``.rpm``
	  - To ``/opt/umamo`` on Fedora and other RPM systems, with the same menu entry and file type.  The package is signed: import the release key once, and install with the signature check turned on.  Remove it with ``sudo dnf remove umamo``.
	* - ``.tar.gz``
	  - Nowhere.  Unpack it and run ``umamo/bin/umamo``.  It registers no menu entry and no file type.

To upgrade, install the new package over the old one.  :doc:`/getting_started/installing` has the commands.

**Registering the archive by hand.**  The archive registers no menu entry and no file type.  The two ``xdg`` commands that do it for your user are in :doc:`/getting_started/installing`, and the same files with ``uninstall`` undo it.  If you registered the archive by hand and then install the ``.deb`` or the ``.rpm``, undo the registration first, or the menu will show Umamo twice.

**The log folder.**  :menuselection:`Help --> Open Log Folder…` uses ``xdg-open`` when Java cannot open the folder itself.  If it does not, the alert gives the folder, and you can open it yourself.

WSL2
====

Umamo runs on Windows Subsystem for Linux 2 with WSLg, but you should use the Windows build when you can, which uses your graphics card directly.  Two things differ on WSL2 from a Linux computer:

* Mesa uses ``llvmpipe``, a software renderer, by default, so the viewport is slow.  Ask for the graphics card.
* The interface toolkit cannot make a hardware OpenGL context under WSLg, so tell it to use software rendering for the window.

Both are environment variables, which you set when you start Umamo:

.. code-block:: bash

	MESA_LOADER_DRIVER_OVERRIDE=d3d12 GALLIUM_DRIVER=d3d12 SKIKO_RENDER_API=SOFTWARE \
		umamo/bin/umamo

The Linux ``.jar`` needs Java 21 or newer, from your distribution's packages.

Graphics Requirements
=====================

The viewport needs OpenGL 3.3.  Umamo asks for a core profile context for it, and draws the viewport there.  An out of date graphics driver may not offer one.  Remote desktop sessions and virtual machines often offer only an old OpenGL or a slow software renderer.

If Umamo cannot get a context, or the libraries it needs for graphics do not load, the editor still opens, but the viewport stays blank.  Image export fails with ``The viewport renderer could not draw the image.``  The log says why, in a line that begins with ``[GL] offscreen context unavailable``.

What to try:

#. Update your graphics driver.
#. Run Umamo directly on the computer and not through a remote desktop or a virtual machine.
#. Run ``--self-check`` to see whether the graphics libraries load.  See :doc:`/troubleshooting/reporting_bugs`.

If it still does not work, report it with the log.  The line from the log is the part that matters.

Android and iPadOS
==================

There is no build for Android or iPadOS yet.  Android is the goal, with tablets that take a pen and touch, but an incomplete graphics layer is blocking it.  The iPadOS application and its interface load, but there is no renderer for puppets.  This manual covers the desktop.  See :doc:`/interface/pen_and_touch`.

.. seealso::

	* :doc:`/getting_started/installing`
	* :doc:`/getting_started/system_requirements`
	* :doc:`/interface/pen_and_touch`
