************
Introduction
************

What Umamo Is
=============

Umamo is a free, open-source, cross-platform modelling editor for 2D puppet animation.  You bring in layered artwork, build meshes and deformers over it, and set up the parameters and keyforms that make the puppet move.  Umamo is designed to interoperate with the Live2D Cubism source format, so it works with your existing CMO3 and MOC3 puppets.

The main window will look familiar to anyone who has used Blender.  It is divided into areas that can each be switched to any editor, and the areas are grouped into workspaces.  There is a command palette, pie menus, and an operation strip for adjusting the last operation.  The interface is resolution independent and works on high resolution displays.

Umamo offers:

* Reading and writing ``.cmo3`` projects, tested with Cubism Editor 4.2 to 5.4.
* Importing and exporting ``.moc3`` runtime models along with their sidecar files.
* Importing layered artwork from Krita, Photoshop, and Clip Studio Paint, and keeping the puppet in sync when the artwork changes.
* Windows, macOS, and Linux builds from one shared codebase.

Umamo is free software, licensed under the GPLv3.  See :doc:`license`.

Project Status
==============

Umamo is in early development.  It is alpha level software that is available for testing, so that the project can gather feedback from its users.  Prebuilt downloads of every tagged version are on the `Releases page <https://github.com/umamoorg/umamo/releases>`__ or from the `web site <https://www.umamo.org/>`__.

.. warning::

	Because Umamo is alpha level software, a project can be damaged or lost, and Umamo does not save your puppet files automatically.  Make regular backups of your files.  In fact, make second copies of your files explicitly for playing around with, and do not use the original copies.

Some things are not available yet:

* Animation.  It is a long term goal.  Getting the modelling, UV editor, and physics interface right comes first.
* Physics.  See :doc:`/rigging/physics`.
* Pen pressure and tilt.  See :doc:`/interface/pen_and_touch`.
* Android and iPadOS builds.  See `Supported Platforms`_.

Supported Platforms
===================

Umamo is a Kotlin Multiplatform project.  Desktop and Android builds come from the same codebase.

.. list-table::
	:header-rows: 1

	* - Platform
	  - Status
	* - Windows
	  - Regularly built and tested.
	* - Linux
	  - Regularly built and tested.
	* - macOS
	  - Working, minimally tested.
	* - Android
	  - Not yet.  An incomplete graphics layer is blocking it.  Android tablets with a pen and touch input are the goal.
	* - iPadOS
	  - The application and its interface load, but there is no puppet renderer yet.

Builds are published for Windows on x64, macOS on Apple silicon, and Linux on x64 and arm64.  Intel Macs use the ``.jar`` build.  See :doc:`/getting_started/installing` for the downloads and :doc:`/getting_started/system_requirements` for your computer.

What You Can Open and Save
==========================

Umamo works with its own model format, with the Cubism formats, and with layered artwork.

.. list-table::
	:header-rows: 1

	* - Format
	  - Read
	  - Write
	  - Notes
	* - ``.uma``
	  - Yes
	  - Yes
	  - Umamo's native model format.
	* - ``.cmo3``
	  - Yes
	  - Yes
	  - Cubism Editor model.  Supports up to Cubism 5.4.
	* - ``.moc3``
	  - Yes
	  - Yes
	  - Cubism runtime distribution model, with its sidecar files.  Supports up to Cubism 5.4.
	* - ``.kra``
	  - Yes
	  - —
	  - Krita.
	* - ``.psd``
	  - Yes
	  - —
	  - Photoshop.
	* - ``.clip``
	  - Yes
	  - —
	  - Clip Studio Paint.

:menuselection:`File --> Open…` and :menuselection:`File --> Save` work with UMA files.  Bring a CMO3 or MOC3 model in with :menuselection:`File --> Import`, and write one out with :menuselection:`File --> Export`.  Artwork is added with :menuselection:`File --> Import --> Artwork…`.  See :doc:`/files/format_support` for the full list.

Where to Get Help
=================

* This manual.  In Umamo, :menuselection:`Help --> Documentation…` opens it.
* The `Umamo Discord <https://discord.gg/TRAhW5Uc2t>`__ is the place to ask questions, give feedback, and follow development.
* `GitHub Issues <https://github.com/umamoorg/umamo/issues>`__ is for bug reports and for requests to support a newer file format.  Search the issues first, and if yours has not been reported, `open a new issue <https://github.com/umamoorg/umamo/issues/new>`__ that describes the problem.  For a file format problem, include a sample file.  For a bug, attach the newest log file from the folder that :menuselection:`Help --> Open Log Folder…` opens.
* The `web site <https://umamo.org>`__ and the `source code <https://github.com/umamoorg/umamo>`__.  They can also be found from the application Help menu: :menuselection:`Help --> Web Site…` and :menuselection:`Help --> Source Code…`

See :doc:`/troubleshooting/reporting_bugs` for what to include in a bug report.

.. _supporting-the-project:

Supporting the Project
======================

Umamo is completely open source and free, and it always will be.  If you would like to support the project, you can `join the Patreon <https://patreon.com/Azxiana>`__ or make a one time `donation through Ko-fi <https://ko-fi.com/azxiana>`__.

All received funds go directly to paying hosting bills, hardware for testing, and platform developer fees.  Excess funds will be banked for the future or distributed to other open source projects working with the Umamo Project.

.. seealso::

	* :doc:`/getting_started/installing`
	* :doc:`/about/license`
	* :doc:`/appendices/faq`
	* :doc:`/getting_started/coming_from_cubism`
	* :doc:`/files/format_support`
	* :doc:`/troubleshooting/backups_and_data_safety`
