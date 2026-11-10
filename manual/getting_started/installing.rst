**********
Installing
**********

Every tagged version of Umamo is published on the `Releases page <https://github.com/umamoorg/umamo/releases>`__, and the `web site <https://umamo.org/#download>`__ links to the newest version.  Each system has an installer or portable archive that includes its own copy of Java, and a ``.jar`` is available that runs on any system that has Java.

Check your computer against :doc:`/getting_started/system_requirements` first.  To verify that a download is the one that the project published, see :doc:`/getting_started/verifying_downloads`.

Choosing a Download
===================

In a file name, ``<version>`` is the version number.  For example, ``0.5.0``.

.. list-table::
	:header-rows: 1

	* - Your system
	  - Download
	  - What it is
	* - Windows
	  - ``umamo-windows-x64-<version>.msi``
	  - The installer.  It installs for the current user and does not need administrator rights.
	* - Windows
	  - ``umamo-windows-x64-<version>.zip``
	  - A portable copy.  Unpack it and run it.
	* - MacOS, Apple silicon
	  - ``umamo-macos-arm64-<version>.dmg``
	  - The disk image.  Drag Umamo to Applications.
	* - MacOS, Apple silicon
	  - ``umamo-macos-arm64-<version>.zip``
	  - ``Umamo.app`` in an archive.
	* - MacOS, Intel
	  - ``umamo-macos-x64-<version>.jar``
	  - Intel Macs use the ``.jar`` distribution.
	* - Debian, Ubuntu, Linux Mint
	  - ``umamo-linux-<arch>-<version>.deb``
	  - A package for Debian 12, Ubuntu 22.04, Linux Mint 21, and newer.
	* - Fedora and other systems that use RPM
	  - ``umamo-linux-<arch>-<version>.rpm``
	  - RPM packages are signed and the public key is `hosted on the website <https://www.umamo.org/keys/umamo-signing-key.asc>`__.
	* - Any other Linux
	  - ``umamo-linux-<arch>-<version>.tar.gz``
	  - A portable copy.  Unpack it and run it.
	* - Any system with Java 21 or newer
	  - ``umamo-<target>-<version>.jar``
	  - Available for any system that runs Java.  See `Running the Jar`_.

``<arch>`` is ``x64`` or ``arm64``.  ``<target>`` is one of ``windows-x64``, ``macos-arm64``, ``macos-x64``, ``linux-x64``, or ``linux-arm64``.

The installer is recommended if one is available for your system.

Windows
=======

Installer
---------

#. Download ``umamo-windows-x64-<version>.msi`` and run it.
#. Windows may show ``Windows protected your PC`` because Umamo's Windows builds are not signed yet.  Choose :guilabel:`More info` and then :guilabel:`Run anyway`.  See :doc:`/troubleshooting/platform_notes`.
#. The installer will install to the default location and close automatically without prompting for any information.

Umamo is installed for the current user in ``%LOCALAPPDATA%\Programs\umamo``.  The installer also adds an entry to the Start menu and registers the ``.uma`` file type.

Portable Archive
----------------

#. Download ``umamo-windows-x64-<version>.zip`` and extract it anywhere you like.
#. Run ``Umamo\Umamo.exe``.  Like the installer above, the Windows SmartScreen will show the same warning, so choose :guilabel:`More info` and then :guilabel:`Run anyway` again.

The portable copy does not add anything to the Start menu or register the ``.uma`` file type.  Its settings are stored in the same location as an installed version and will overwrite settings of the installed version.  See :doc:`/getting_started/configuration`.

MacOS
=====

**Apple silicon.**  Open ``umamo-macos-arm64-<version>.dmg``, drag Umamo to Applications, and start it from there.  If you downloaded the ``.zip`` instead, unpack it and move ``Umamo.app`` to Applications.

**Intel.**  Intel Macs are only supported through the Java distribution.  Install Java 21 or newer and run the ``.jar`` for ``macos-x64``.  See `Running the Jar`_.

Linux
=====

Debian, Ubuntu, and Linux Mint
------------------------------

.. code-block:: bash

	sudo apt install ./umamo-linux-x64-<version>.deb

Use the ``arm64`` file on an ARM computer.  Umamo is installed in ``/opt/umamo`` and added to the application menu.

Fedora
------

The RPM package is signed.  Import the Umamo release key once and then install the package with the signature check turned on:

.. code-block:: bash

	sudo rpm --import https://umamo.org/keys/umamo-signing-key.asc
	sudo dnf install --setopt=localpkg_gpgcheck=1 ./umamo-linux-x64-<version>.rpm

The key has the fingerprint ``67754C0DC58743270D574066F5499AE5C80A0F1C``.  See :doc:`/getting_started/verifying_downloads`.  Umamo will be installed to ``/opt/umamo`` and added to the application menu.

Other Distributions
-------------------

Unpack the archive and run the launcher:

.. code-block:: bash

	tar xzf umamo-linux-x64-<version>.tar.gz
	umamo/bin/umamo

Nothing else is needed.  The archive includes its own copy of Java and does not add anything to the application menu.

.. _running-the-jar:

Running the Jar
===============

The ``.jar`` requires Java 21 or newer.  Download the Jar distribution that matches your operating system and architecture.

Double click the file or start it from a terminal:

.. code-block:: bash

	java -XX:MaxRAMPercentage=50 -jar umamo-<target>-<version>.jar

``-XX:MaxRAMPercentage=50`` allows Umamo to use half of the memory in your computer.  Without it, by default Java only allocates a quarter of system memory to Umamo.  See :doc:`/troubleshooting/performance_and_memory`.

Opening UMA Files from the File Manager
=======================================

The installers and MacOS application register the ``.uma`` file type so that double clicking a file in your file manager opens it in Umamo.  The portable copies on Windows and Linux do not register file associations.  On Windows, use :guilabel:`Open with` on an UMA file.

On Linux, the archive includes the files that register the file type for your user.  Put ``umamo/bin/umamo`` on your ``PATH`` or edit the ``Exec=`` line in ``umamo.desktop`` to the full path.  Then register both files:

.. code-block:: bash

	xdg-mime install --novendor umamo/lib/app/resources/umamo-uma.xml
	xdg-desktop-menu install --novendor umamo/lib/app/resources/umamo.desktop

This also adds Umamo to your application menu.  To undo it, run ``xdg-mime uninstall`` and ``xdg-desktop-menu uninstall`` with the same files.

You can also pass a file to Umamo when you start it.  A path to a ``.uma``, ``.cmo3``, or ``.moc3`` file will open that puppet file.  See :doc:`/files/uma`.

Upgrading and Uninstalling
==========================

**Upgrading.**  Install the new version over the old one by running the new installer, installing the new package, or replacing the application.  Your previous settings will be kept.  At this time Umamo does not support installing multiple versions and does not update itself.  See :doc:`/getting_started/updating`.

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
	* - The MacOS application
	  - Drag ``Umamo`` from Applications to the Trash.
	* - A portable copy or a ``.jar``
	  - Delete the folder or the file.

Your settings and log files are stored in your user folders so they are not deleted when uninstalling.  To remove them as well, delete the folders listed in :doc:`/getting_started/configuration`.

.. seealso::

	* :doc:`/getting_started/system_requirements`
	* :doc:`/getting_started/verifying_downloads`
	* :doc:`/getting_started/first_launch`
	* :doc:`/troubleshooting/platform_notes`
	* :doc:`/getting_started/configuration`
