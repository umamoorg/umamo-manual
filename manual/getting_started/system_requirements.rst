*******************
System Requirements
*******************

Umamo runs on Windows, macOS, and Linux.  Since it's a graphics editing program it uses more resources of your system than a typical program.  Depending on the size and complexity of the puppet models that you plan to work on your computer will need to meet certain minimum recommendations.

.. list-table::
	:header-rows: 1

	* -
	  - Minimum
	  - Recommended
	  - Note
	* - Memory
	  - 16 GB
	  - 32 GB or more
	  - 8 GB is possible, but may require closing other programs.
	* - Processor
	  - 4 cores
	  - —
	  - —
	* - Windows
	  - Windows 10 or 11
	  - —
	  - JAR distributions may run on earlier versions of Windows, but it is untested and unsupported.
	* - MacOS
	  - MacOS 11 (Intel)
	  - MacOS 15 (Apple silicon)
	  - —
	* - Linux
	  - Ubuntu 22
	  - Ubuntu 26, Fedora 44
	  - —
	* - Graphics
	  - OpenGL 3.3
	  - —
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
	* - MacOS
	  - Apple silicon (arm64)
	  - Disk image, archive, or ``.jar``
	* - MacOS
	  - Intel (x64)
	  - ``.jar`` only
	* - Linux
	  - x64 and arm64
	  - ``.deb``, ``.rpm``, archive, or ``.jar``

Windows and Linux are regularly built and tested.  MacOS is supported and tested, but has some known issues.  Android and iPadOS builds are not available yet.  See :doc:`/about/introduction`.

See :doc:`/getting_started/installing` for the downloads, and :doc:`/troubleshooting/platform_notes` for what is different on each system.

Java (Jar Builds)
=================

The installers and archives do not require Java to be installed on your computer.  The ``.jar`` does require Java 21 or newer from any provider.  Check which version you have with ``java -version``.  Intel Macs use the ``.jar`` and this requires Java.

Each ``.jar`` is built for one system and one architecture that only includes the libraries for that combination, so download the one that matches your computer.  See :ref:`running-the-jar`.

Graphics
========

Umamo needs a graphics card or graphics driver that supports OpenGL 3.3.  Without it, the editor will still open, but the viewport will be blank.  Remote desktops and virtual machines may not provide OpenGL support.  See :doc:`/troubleshooting/platform_notes`.

High resolution screens are supported with percentage scaling.

Memory
======

A model with many layers and large texture atlases needs a lot of memory, and exporting needs more than editing does.  16 GB is the recommended minimum and 32 GB or more is the preferred amount of memory.  8 GB has been tested, but heavy models can run out of memory.

By default, Umamo is set to use up to half of the memory in your computer.  The installers and archives are configured this way and the ``.jar`` will restart itself to apply the same limit.  See :doc:`/troubleshooting/performance_and_memory`.

Processor
=========

The minimum is a processor with 4 cores.  With Umamo in performance mode, a 2014 MacBook Pro with a 4th-generation Intel Core i7 with the Spectre patch installed and the battery disconnected was barely fast enough, so any newer computer should be fine.

Network
=======

Umamo does not need an internet connection.  The only feature that uses the network is the check for a newer version, which can be turned off.  See :doc:`/getting_started/updating`.

.. seealso::

	* :doc:`/getting_started/installing`
	* :doc:`/troubleshooting/platform_notes`
	* :doc:`/troubleshooting/performance_and_memory`
