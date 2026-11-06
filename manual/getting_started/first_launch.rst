************
First Launch
************

The first time Umamo starts, it opens a new puppet and a small window called Quick Setup, which asks you to select common preferences.  You can answer them or close the window and change them later.  This page describes what you will see and how to open your first file.

A New Puppet Opens
==================

Umamo always starts with a puppet open.  If you start it without a file, it will be a new empty puppet, the same as one created with :menuselection:`File --> New`.  The window title is ``Umamo - Untitled``.  The window opens at 1280 by 800 pixels the first time and after that opens the way you left it.

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: The whole Umamo window just after the first start and after closing Quick Setup, with the Modelling workspace: the Parameters editor on the left, the 2D Viewport above the Keyform Sheet in the middle, and the Outliner above Properties on the right.  The tabs for the Modelling, Texture, and Physics workspaces must be readable.
	:Setup: Start Umamo with no settings file, which is a fresh install, and close Quick Setup.
	:Crop: The whole window.
	:Save as: ``images/getting_started/first_window.png``
	:Caption: Umamo after the first start, with an empty puppet in the Modelling workspace.

The window is divided into areas and each area shows one editor.  Umamo starts in the Modelling workspace:

* The **Parameters** editor is on the left.
* The **2D Viewport**, where the model is drawn, is in the middle, above the **Keyform Sheet**.
* The **Outliner** is on the right, above the **Properties** editor.

The tabs along the top switch between workspaces.  There are three workspaces: Modelling, Texture, and Physics.  The viewport is empty and the editors have nothing to show because the puppet does not have any content yet.  Adding artwork or importing a model will fill them.  See :doc:`/interface/window_system` and :doc:`/interface/workspaces`.

Quick Setup
===========

Quick Setup opens over the window the first time Umamo launches, when there is no settings file yet.  It shows the splash picture with the version of Umamo and the name of the artist, followed by four settings.  Each setting takes effect immediately and is saved as soon as you change it.  Click :guilabel:`Continue` or click outside the window to close it.  Nothing is lost by closing it.

To open it again, choose :menuselection:`Help --> Quick Setup…`.

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: The Quick Setup window with the splash picture, and its four rows, Language, Keybindings Preset, Theme, and Check for updates when Umamo starts, and the Continue button.
	:Setup: Start Umamo with no settings file, or choose Help → Quick Setup….
	:Crop: The Quick Setup window and a little of the window behind it.
	:Save as: ``images/getting_started/quick_setup.png``
	:Caption: Quick Setup.

Language
--------

Sets the language of the interface.  Umamo will pick the first of your computer's preferred languages that it has been translated into and will use English if there are none.  The available languages are English, Japanese (日本語), Korean (한국어), and French (Français).  The change is applied immediately.

To help add a language, see :doc:`/about/contribute/translations`.  You can change it later in :menuselection:`Edit --> Settings…`, in the :guilabel:`Interface` category.

Keybindings Preset
------------------

Chooses which set of keyboard shortcuts to start from.

:guilabel:`Default`
	The shortcuts that this manual describes.  They follow Blender's way of working with a key for each tool, such as :kbd:`G` to grab and :kbd:`Tab` for Edit Mode.

:guilabel:`Cubism`
	A smaller set for people who come from the Cubism Editor.  It keeps the shortcuts that Cubism users know, and leaves most of the single-key tools unassigned.  See :doc:`/getting_started/coming_from_cubism`.

:guilabel:`Blender`
	For people who come from Blender.  The command palette is on :kbd:`F3`, and Frame All is on :kbd:`Home`.

You can rebind any shortcut later, in the :guilabel:`Keybindings` category of Settings.  See :doc:`/interface/keymap` for what the presets are.

Theme
-----

Chooses between :guilabel:`Dark`, :guilabel:`Light`, or :guilabel:`System`, which follows the setting of your operating system.  The default is :guilabel:`Dark`.

Check for Updates
-----------------

:guilabel:`Check for updates when Umamo starts` is turned on by default.  When it is on, Umamo will ask GitHub once a day whether a newer release is available and will tell you if there is.  Turn it off if you would rather it did not.  This check is the only feature in Umamo that uses the network.  :menuselection:`Help --> Check for Updates…` works either way.  See :doc:`/getting_started/updating`.

Opening Your First File
=======================

Umamo can open or import several different types of files:

* **A model made in Cubism.**  Use :menuselection:`File --> Import --> CMO3…` for a Cubism Editor project or :menuselection:`File --> Import --> MOC3…` for a baked model.  The imported model will replace the empty puppet.  See :doc:`/files/cubism_interchange`.
* **Layered artwork.**  Use :menuselection:`File --> Import --> Artwork…` to add a PSD, CLIP, or KRA file, or a flat image, to the puppet.  Umamo will create a drawable and a mesh for each layer.  See :doc:`/artwork/importing`.
* **An UMA file.**  Use :menuselection:`File --> Open…` to open an UMA file, which is Umamo's native format.  See :doc:`/files/uma`.

You can also drag a file onto the window.  The first file in a drop decides what happens to the whole drop.  Artwork is added to the puppet and anything else is opened.

.. warning::

	Umamo is alpha-level software and does not save your puppet files automatically.  Work on copies of your files and use :menuselection:`File --> Save As…` early to save an UMA file.  See :doc:`/troubleshooting/backups_and_data_safety`.

Low-Memory Notice
=================

If you run the ``.jar`` build and Java has given it too little memory, an alert will open when Umamo starts.  It states how much memory Umamo has and provides a command that starts it with half of your computer's memory.  The installers never show this alert.  :guilabel:`Don't Show Again` turns it off permanently.  See :doc:`/troubleshooting/performance_and_memory`.

.. seealso::

	* :doc:`/getting_started/coming_from_cubism`
	* :doc:`/interface/keymap`
	* :doc:`/interface/settings`
	* :doc:`/interface/workspaces`
	* :doc:`/files/uma`
