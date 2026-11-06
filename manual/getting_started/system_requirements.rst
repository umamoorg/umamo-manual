*******************
System Requirements
*******************

Umamo runs on Windows, macOS, and Linux.  It draws the model with the graphics card and keeps the whole model in memory, so the amount of memory in your computer matters most.

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

These are the systems that Umamo is tested on.  See `Operating Systems`_ for the full list.

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

Windows and Linux are regularly built and tested.  macOS is supported but has had the least testing.  Android and iPadOS builds are not available yet.  See :doc:`/about/introduction`.

The installers and portable archives include their own copy of Java and are built for the systems in the table.  The ``.deb`` package is for Debian 12, Ubuntu 22.04, Linux Mint 21, and newer.  An older system may not be able to run them, in which case try the ``.jar``, which runs on any system that has Java.

See :doc:`/getting_started/installing` for the downloads, and :doc:`/troubleshooting/platform_notes` for what is different on each system.

Java (Jar Builds)
=================

The installers and archives do not require Java to be installed on your computer.  The ``.jar`` does require Java 21 or newer from any provider.  Check which version you have with ``java -version``.  Intel Macs use the ``.jar`` and so require Java.

Each ``.jar`` is built for one system and one processor and only includes the libraries for that combination, so download the one that matches your computer.  See :ref:`running-the-jar`.

Graphics
========

Umamo needs a graphics card or graphics driver that supports OpenGL 3.3, which is used to draw the viewport.  Without it the editor will still open but the viewport will be blank.  Remote desktops and virtual machines may not provide OpenGL support.  See :doc:`/troubleshooting/platform_notes`.

High resolution screens are supported and the interface scales to fit them.

Memory
======

A model with many layers and large texture atlases needs a lot of memory, and exporting needs more than editing does.  The web site gives 16 GB as the minimum and 32 GB or more as the recommended amount.  8 GB has been tested, but heavy models can run out of memory.

Umamo is allowed to use up to half of the memory in your computer.  The installers and archives are configured this way and the ``.jar`` will restart itself to apply the same limit.  See :doc:`/troubleshooting/performance_and_memory`.

Processor
---------

The minimum is a processor with 4 cores.  A 2014 MacBook Pro with a 4th generation Intel Core i7 and its performance mode turned on was barely fast enough, so any newer computer should be fine.

Network
-------

Umamo does not need an internet connection.  The only feature that uses the network is the check for a newer version, which can be turned off.  See :doc:`/getting_started/updating`.

.. seealso::

	* :doc:`/getting_started/installing`
	* :doc:`/troubleshooting/platform_notes`
	* :doc:`/troubleshooting/performance_and_memory`
