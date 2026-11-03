*******************
System Requirements
*******************

Umamo runs on Windows, macOS, and Linux.  It draws the model with the graphics card, and it keeps a whole model in memory, so the memory of the computer matters most.

.. list-table::
	:header-rows: 1

	* -
	  - Minimum
	  - Recommended
	* - Memory
	  - 16 GB
	  - 32 GB or more
	* - Processor
	  - 4 cores
	  - —
	* - Windows
	  - Windows 10 or 11
	  - —
	* - macOS
	  - macOS 11 (Intel)
	  - macOS 15 (Apple silicon)
	* - Linux
	  - Ubuntu 22
	  - Ubuntu 26, Fedora 44
	* - Graphics
	  - OpenGL 3.3
	  - —

These are the systems that Umamo is tested on.  See `Operating Systems`_ for the others.

Operating Systems
=================

.. list-table::
	:header-rows: 1

	* - System
	  - Processors
	  - Download
	* - Windows 10 and 11
	  - x64
	  - Installer, portable archive, or ``.jar``
	* - macOS
	  - Apple silicon (arm64)
	  - Disk image, archive, or ``.jar``
	* - macOS
	  - Intel (x64)
	  - ``.jar`` only
	* - Linux
	  - x64 and arm64
	  - ``.deb``, ``.rpm``, archive, or ``.jar``

Windows is regularly built and tested, and so is Linux.  macOS works, but it has had the least testing.  Android and iPadOS builds do not exist yet.  See :doc:`/about/introduction`.

The installers and the portable archives carry their own copy of Java.  They are built for the systems in the table, and the ``.deb`` is for Debian 12, Ubuntu 22.04, Linux Mint 21, and newer.  An older system may not run them.  The ``.jar`` runs wherever Java does, and it is the one to try on an older system.

See :doc:`/getting_started/installing` for the downloads, and :doc:`/troubleshooting/platform_notes` for what is different on each system.

Java (Jar Builds)
=================

An installer and an archive need no Java on your computer.  The ``.jar`` does: it needs Java 21 or newer, from any provider.  Check what you have with ``java -version``.  Intel Macs use the ``.jar``, so they need it.

Each ``.jar`` is built for one system and one processor, and carries the libraries that Umamo needs for only that one.  Download the one that matches your computer.  See :ref:`running-the-jar`.

Graphics
========

Umamo needs a graphics card, or a graphics driver, that offers OpenGL 3.3.  The viewport is drawn with it.  Without it the editor still opens, but the viewport stays blank.  A remote desktop or a virtual machine may not offer it.  See :doc:`/troubleshooting/platform_notes`.

A high resolution screen is fine.  The interface scales with the screen.

Memory
======

A model with many layers and large texture atlases needs a lot of memory, and an export needs more than editing does.  The web site gives 16 GB as the minimum for the computer and 32 GB or more as the recommended amount.  8 GB has been tested, but heavy models can run out of memory on it.

Umamo may use half of the memory of the computer.  The installers and archives are set up that way, and the ``.jar`` restarts itself to get there.  See :doc:`/troubleshooting/performance_and_memory`.

Processor
---------

The minimum is a processor with 4 cores.  A 2014 MacBook Pro with a 4th generation Intel Core i7, with its performance mode turned on, was barely fast enough.  A computer newer than that should be fine.

Network
-------

Umamo does not need the internet.  The only thing in it that uses the network is the check for a newer version, which you can turn off.  See :doc:`/getting_started/updating`.

.. seealso::

	* :doc:`/getting_started/installing`
	* :doc:`/troubleshooting/platform_notes`
	* :doc:`/troubleshooting/performance_and_memory`
