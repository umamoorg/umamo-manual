************
First Launch
************

The first time Umamo starts, it opens a new document and a small window, Quick Setup, that asks four questions.  You can answer them, or close it and change them later.  This page says what you will see, and how to open your first file.

A New Document Opens
====================

Umamo always starts with a document open.  If you start it without a file, it is a new, empty one, the same as :menuselection:`File --> New` makes.  Its title is ``Umamo - Untitled``.  The window opens at 1280 by 800 pixels the first time, and after that it opens the way you left it.

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: The whole Umamo window just after the first start and after closing Quick Setup, with the Modelling workspace: the Parameters editor on the left, the 2D Viewport above the Keyform Sheet in the middle, and the Outliner above Properties on the right.  The tabs for the Modelling, Texture, and Physics workspaces must be readable.
	:Setup: Start Umamo with no settings file, which is a fresh install, and close Quick Setup.
	:Crop: The whole window.
	:Save as: ``images/getting_started/first_window.png``
	:Caption: Umamo after the first start, with an empty document in the Modelling workspace.

The window is divided into areas, each of which shows one editor.  You start in the Modelling workspace:

* The **Parameters** editor is on the left.
* The **2D Viewport**, where the model is drawn, is in the middle, above the **Keyform Sheet**.
* The **Outliner** is on the right, above the **Properties** editor.

The tabs along the top change workspace.  There are three: Modelling, Texture, and Physics.  The viewport is empty and the editors have nothing to show, because the document has nothing in it yet.  The first artwork that you add, or the first model that you import, fills them.  See :doc:`/interface/window_system` and :doc:`/interface/workspaces`.

Quick Setup
===========

Quick Setup opens over the window on the first launch, which is when there is no settings file yet.  It has the splash picture, with the version of Umamo and the name of the artist, and four settings.  Each one takes effect at once, behind the window, and is saved as soon as you change it.  :guilabel:`Continue` closes the window, and so does a click outside it.  Nothing is lost by closing it.

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

The language of the interface.  Umamo picks the first of your computer's preferred languages that it has been translated into, and uses English when it has none.  The languages are English, Japanese (日本語), Korean (한국어), and French (Français).  The change is immediate.

To add a language, see :doc:`/about/contribute/translations`.  You can change it later in :menuselection:`Edit --> Settings…`, in the :guilabel:`Interface` category.

Keybindings Preset
------------------

Which set of keyboard shortcuts to start from.

:guilabel:`Default`
	The shortcuts that this manual describes.  They follow Blender in how they work: a key for each tool, such as :kbd:`G` to grab, with :kbd:`Tab` for Edit Mode.

:guilabel:`Cubism`
	A smaller set for people who come from the Cubism Editor.  It keeps the shortcuts that Cubism users know, and leaves most of the single-key tools unassigned.  See :doc:`/getting_started/coming_from_cubism`.

:guilabel:`Blender`
	For people who come from Blender.  The command palette is on :kbd:`F3`, and Frame All is on :kbd:`Home`.

You can rebind any shortcut later, in the :guilabel:`Keybindings` category of Settings.  See :doc:`/interface/keymap` for what the presets are.

Theme
-----

:guilabel:`Dark`, :guilabel:`Light`, or :guilabel:`System`, which follows the setting of your operating system.  Umamo starts dark.

Check for Updates
-----------------

:guilabel:`Check for updates when Umamo starts` is on by default.  When it is on, Umamo asks GitHub once a day whether there is a newer release, and tells you if there is.  Turn it off here if you would rather not.  The check is the only thing in Umamo that uses the network.  :menuselection:`Help --> Check for Updates…` works either way.  See :doc:`/getting_started/updating`.

Opening Your First File
=======================

Each kind of file has its own way in.

* **A model made in Cubism.**  Use :menuselection:`File --> Import --> CMO3…` for a project file, or :menuselection:`File --> Import --> MOC3…` for a model that has been baked.  The model replaces the empty document.  See :doc:`/files/cubism_interchange`.
* **Layered artwork.**  Use :menuselection:`File --> Import --> Artwork…` to add a PSD, CLIP, or KRA file, or a flat image, to the document.  Umamo makes a drawable and a mesh for each layer.  See :doc:`/artwork/importing`.
* **A document of Umamo's own.**  Use :menuselection:`File --> Open…` for a ``.uma`` file.  See :doc:`/files/uma`.

You can also drag a file onto the window.  The first file in a drop decides what it means: artwork is added to the document, and anything else is opened.

Work on copies while Umamo is alpha software, and use :menuselection:`File --> Save As…` early to make a UMA file of your own.  Umamo does not save for you.  See :doc:`/troubleshooting/backups_and_data_safety`.

Low-Memory Notice
=================

If you run the ``.jar`` build and Java gave it too little memory, an alert opens when Umamo starts.  It says how much memory Umamo has, and gives a command that starts it with half of your computer's memory.  The installers never show it.  :guilabel:`Don't Show Again` turns it off for good.  See :doc:`/troubleshooting/performance_and_memory`.

.. seealso::

	* :doc:`/getting_started/coming_from_cubism`
	* :doc:`/interface/keymap`
	* :doc:`/interface/settings`
	* :doc:`/interface/workspaces`
	* :doc:`/files/uma`
