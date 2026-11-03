**********
Installing
**********

Every tagged version of Umamo is published on the `Releases page <https://github.com/umamoorg/umamo/releases>`__, and the `web site <https://umamo.org/#download>`__ links to the newest one.  Each system has an installer or a portable archive that carries its own copy of Java, and a ``.jar`` that runs on any system with Java.

Check your computer against :doc:`/getting_started/system_requirements` first.  Then, if you want to know that the file is the one that the project published, see :doc:`/getting_started/verifying_downloads`.

Choosing a Download
===================

``<version>`` in a file name is the version number, such as ``0.4.0``.

.. list-table::
	:header-rows: 1

	* - Your system
	  - Download
	  - What it is
	* - Windows
	  - ``umamo-windows-x64-<version>.msi``
	  - The installer.  It installs for your own user and needs no administrator rights.
	* - Windows
	  - ``umamo-windows-x64-<version>.zip``
	  - A portable copy.  Unpack it and run it.
	* - macOS, Apple silicon
	  - ``umamo-macos-arm64-<version>.dmg``
	  - The disk image.  Drag Umamo to Applications.
	* - macOS, Apple silicon
	  - ``umamo-macos-arm64-<version>.zip``
	  - ``Umamo.app`` in an archive.
	* - macOS, Intel
	  - ``umamo-macos-x64-<version>.jar``
	  - Intel Macs use the ``.jar`` for now.
	* - Debian, Ubuntu, Linux Mint
	  - ``umamo-linux-<arch>-<version>.deb``
	  - A package for Debian 12, Ubuntu 22.04, Linux Mint 21, and newer.
	* - Fedora, and other systems that use RPM
	  - ``umamo-linux-<arch>-<version>.rpm``
	  - A signed package.
	* - Any other Linux
	  - ``umamo-linux-<arch>-<version>.tar.gz``
	  - A portable copy.  Unpack it and run it.
	* - Any system with Java 21 or newer
	  - ``umamo-<target>-<version>.jar``
	  - One file that runs wherever Java does.  See `Running the Jar`_.

``<arch>`` is ``x64`` or ``arm64``.  ``<target>`` is one of ``windows-x64``, ``macos-arm64``, ``macos-x64``, ``linux-x64``, or ``linux-arm64``.

Pick an installer if there is one for your system.  It puts Umamo in the application menu and makes it open ``.uma`` files.  Pick a portable copy to try Umamo without installing it, or to keep several versions.  Pick the ``.jar`` if neither of them runs on your system.

Windows
=======

Installer
---------

#. Download ``umamo-windows-x64-<version>.msi`` and run it.
#. Windows may show ``Windows protected your PC``.  Umamo's Windows builds are not signed yet.  Choose :guilabel:`More info`, and then :guilabel:`Run anyway`.  See :doc:`/troubleshooting/platform_notes`.
#. The installer has no screens of its own and asks nothing.  When it has finished it closes, without saying so.

Umamo is installed for your own user in ``%LOCALAPPDATA%\Programs\umamo``.  It adds an entry to the Start menu and makes Umamo open ``.uma`` files.

Portable Archive
----------------

#. Download ``umamo-windows-x64-<version>.zip``, and extract it anywhere you like.
#. Run ``Umamo\Umamo.exe``.  SmartScreen warns about it in the same way, and the answer is the same.

The portable copy puts nothing in the Start menu and does not register the ``.uma`` file type.  Its settings are in the same place as an installed copy's.  See :doc:`/getting_started/configuration`.

macOS
=====

**Apple silicon.**  Open ``umamo-macos-arm64-<version>.dmg`` and drag Umamo to Applications.  Start it from there.  The disk image and the application are signed and notarized by Apple.  With the ``.zip`` instead, unpack it and move ``Umamo.app`` to Applications.

**Intel.**  There is no application for Intel Macs yet.  Install Java 21 or newer, and run the ``.jar`` for ``macos-x64``.  See `Running the Jar`_.

Linux
=====

Debian, Ubuntu, and Linux Mint
------------------------------

.. code-block:: bash

	sudo apt install ./umamo-linux-x64-<version>.deb

Use the ``arm64`` file on an ARM computer.  Umamo is installed in ``/opt/umamo``, and it is added to the application menu.

Fedora
------

The RPM is signed.  Import the Umamo release key once, and then install the package with the signature check turned on:

.. code-block:: bash

	sudo rpm --import https://umamo.org/keys/umamo-signing-key.asc
	sudo dnf install --setopt=localpkg_gpgcheck=1 ./umamo-linux-x64-<version>.rpm

The key has the fingerprint ``6775 4C0D C587 4327 0D57 4066 F549 9AE5 C80A 0F1C``.  See :doc:`/getting_started/verifying_downloads`.  Umamo is installed in ``/opt/umamo``, and it is added to the application menu.

Other Distributions
-------------------

Unpack the archive and run the launcher:

.. code-block:: bash

	tar xzf umamo-linux-x64-<version>.tar.gz
	umamo/bin/umamo

Nothing else is needed.  The archive carries its own copy of Java, and it puts nothing in the application menu.

.. _running-the-jar:

Running the Jar
===============

The ``.jar`` needs Java 21 or newer on your computer.  Download the one for your system and processor, because each one carries the libraries for only its own.

Double-click the file, or start it from a terminal:

.. code-block:: bash

	java -XX:MaxRAMPercentage=50 -jar umamo-<target>-<version>.jar

``-XX:MaxRAMPercentage=50`` lets Umamo use half of the memory of the computer.  Without it, Java gives a program a quarter.  When that would be less than 3 GB the ``.jar`` starts itself again with half, so a double-click works too, but a terminal shows you what happens.  See :doc:`/troubleshooting/performance_and_memory`.

Opening .uma Files from the File Manager
========================================

The installers make Umamo the program that opens ``.uma`` files, so a double-click in your file manager opens the document.  The macOS application declares the file type itself.  The portable copies on Windows and Linux register nothing.  On Windows, use :guilabel:`Open with` on a ``.uma`` file.

On Linux, the archive comes with the files that register the type for your user.  Put ``umamo/bin/umamo`` on your ``PATH``, or edit the ``Exec=`` line in ``umamo.desktop`` to its full path.  Then register both files:

.. code-block:: bash

	xdg-mime install --novendor umamo/lib/app/resources/umamo-uma.xml
	xdg-desktop-menu install --novendor umamo/lib/app/resources/umamo.desktop

This also adds Umamo to your application menu.  ``xdg-mime uninstall`` and ``xdg-desktop-menu uninstall`` with the same files undo it.

You can also give Umamo a file when you start it.  A path to a ``.uma``, ``.cmo3``, or ``.moc3`` file opens that document.  See :doc:`/files/uma`.

Upgrading and Uninstalling
==========================

**Upgrading.**  Install the new version over the old one: run the new installer, install the new package, or replace the application.  Your settings are kept.  Umamo never updates itself.  See :doc:`/getting_started/updating`.

**Uninstalling.**

.. list-table::
	:header-rows: 1

	* - You installed
	  - To remove it
	* - The Windows installer
	  - :menuselection:`Windows Settings --> Apps`
	* - The ``.deb``
	  - ``sudo apt remove umamo``
	* - The ``.rpm``
	  - ``sudo dnf remove umamo``
	* - The macOS application
	  - Drag ``Umamo`` from Applications to the Trash.
	* - A portable copy, or a ``.jar``
	  - Delete the folder or the file.

Uninstalling does not touch your documents.  Your settings and your log files are in your own folders and not in the installation, so they stay.  To remove them too, delete the folders listed in :doc:`/getting_started/configuration`.

.. seealso::

	* :doc:`/getting_started/system_requirements`
	* :doc:`/getting_started/verifying_downloads`
	* :doc:`/getting_started/first_launch`
	* :doc:`/troubleshooting/platform_notes`
	* :doc:`/getting_started/configuration`
