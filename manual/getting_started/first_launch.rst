************
First Launch
************

The first time Umamo starts it will open the Quick Setup dialog window that will ask you to set your common preferences.  This page describes what you will see and how to open your first file.

Quick Setup
===========

Quick Setup opens over the window the first time Umamo launches when there is no settings file created.  It shows the splash picture with the version of Umamo and the name of the artist, followed by a few common settings.  Each setting takes effect immediately and is saved as soon as you change it.  Click :guilabel:`Continue` or click outside the window to close it.

To open it again, choose :menuselection:`Help --> Quick Setup…` or you can change the settings later in :menuselection:`Edit --> Settings…`, in the :guilabel:`Interface` category.

.. figure:: /images/getting_started/quick_setup.png

	Quick Setup.

Language
--------

Sets the language of the interface.  Umamo will pick from the first of your system's preferred languages.  If a translation is not available it will default to English.

If you would like to help translate Umamo into another language, see :doc:`/about/contribute/translations`.

Keybindings Preset
------------------

Chooses which set of keyboard shortcuts to start from.

:guilabel:`Default`
	The shortcuts that this manual describes.

:guilabel:`Cubism`
	A smaller set for people who come from the Cubism Editor.  We recommend using the default keymap, but the Cubism keymap is provided for convenience.  See :doc:`/getting_started/coming_from_cubism`.

:guilabel:`Blender`
	For people who come from Blender.  The keymap is nearly identical to the default, but with a few changes such as the :guilabel:`Command Palette` being set to :kbd:`F3` and Frame All set to :kbd:`Home`.

You can rebind any shortcut later in the :guilabel:`Keybindings` category of Settings.  See :doc:`/interface/keymap` for what the presets are.

Theme
-----

Chooses between :guilabel:`Dark`, :guilabel:`Light`, or :guilabel:`System` which will follow the setting of your operating system.  The default is :guilabel:`Dark`.

Check for Updates
-----------------

:guilabel:`Check for updates when Umamo starts` is turned on by default.  When it is on, Umamo will check GitHub once a day whether a newer release is available and inform you when one is available.  This check is the only feature in Umamo that uses the network.  Use :menuselection:`Help --> Check for Updates…` to check for an update manually.  See :doc:`/getting_started/updating`.

A New Puppet Opens
==================

Umamo always starts to a new puppet.  If you start it without a file, it will be a new empty puppet, the same as one created with :menuselection:`File --> New`.  The window title will show ``Umamo - Untitled`` indicating that it is a new unsaved puppet file.

.. figure:: /images/getting_started/first_window.png

	Umamo after the first start with an empty puppet in the Modelling workspace.

The window is divided into areas and each area shows one editor.  Umamo starts in the Modelling workspace:

* The **Parameters** editor is on the left.
* The **2D Viewport**, where the model is drawn, is in the middle, above the **Keyform Sheet**.
* The **Outliner** is on the right, above the **Properties** editor.

The tabs along the top switch between workspaces.  There are three default workspaces: Modelling, Texture, and Physics.  The viewport is empty and the editors have nothing to show because the puppet does not have any content yet.  Adding artwork or importing a model will fill them with puppet contents.  See :doc:`/interface/window_system` and :doc:`/interface/workspaces`.

Opening Your First File
=======================

Umamo can open or import several different types of files:

* **A model made in Cubism.**  Use :menuselection:`File --> Import --> CMO3…` for a Cubism Editor project or :menuselection:`File --> Import --> MOC3…` for a baked model.  The imported model will replace the empty puppet.  See :doc:`/files/cubism_interchange`.
* **Layered artwork.**  Use :menuselection:`File --> Import --> Artwork…` to add a PSD, CLIP, KRA file, or a flat image to the puppet.  Umamo will automatically create a drawable and mesh for each layer.  See :doc:`/artwork/importing`.
* **An UMA file.**  Use :menuselection:`File --> Open…` to open an UMA file, which is Umamo's native format.  See :doc:`/files/uma`.

You can also drag a file onto the window.  The first file in a drop decides what happens with the whole set of dropped files.  Artwork will be added to the puppet and puppet files will be opened.

.. warning::

	Umamo is alpha-level software and does not save your puppet files automatically.  Work on copies of your files and use :menuselection:`File --> Save` often to save your file.  See :doc:`/troubleshooting/backups_and_data_safety`.

Low-Memory Notice
=================

If you run the ``.jar`` build and Java has given it too little memory an alert will open when Umamo starts.  It states how much memory Umamo has and provides a command that starts it with half of your computer's memory.  The installers never show this alert.  :guilabel:`Don't Show Again` turns it off permanently.  See :doc:`/troubleshooting/performance_and_memory`.

.. seealso::

	* :doc:`/getting_started/coming_from_cubism`
	* :doc:`/interface/keymap`
	* :doc:`/interface/settings`
	* :doc:`/interface/workspaces`
	* :doc:`/files/uma`
