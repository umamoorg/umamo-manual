***************
Command Palette
***************

The command palette is a search box that runs any command by name.  Every operation in Umamo is a command, and the menus, the shortcuts, and the right-click menus are all ways to reach one.  Use the palette when you know what you want to do but don't know where it is, or when it has no menu row or shortcut.

Opening It
==========

Press :kbd:`Ctrl-P`.  The default keymap also opens it with :kbd:`Space`, and the Blender keymap with :kbd:`F3`.  The same key closes it again.  See :doc:`/interface/keymap`.

The palette opens near the top of the window, over everything, with the search field ready for typing.

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: The command palette open, with ``zoom`` typed in the search field, and the list of matching commands under it with the shortcut of each at its right end, one of them highlighted.
	:Setup: Point at the 2D Viewport, press Ctrl-P, and type ``zoom``.
	:Crop: The top center of the window, with the palette.
	:Save as: ``images/interface/command_palette.png``
	:Caption: The command palette.

What It Lists
=============

The palette lists the commands that apply where you are.  A command is listed when it:

* has a name.  A command that has to be handed something to work on, such as a row of the Outliner, has no name and is not listed.
* applies at the moment.  A command to undo is not listed when there is nothing to undo, and one that works on mesh vertices is not listed in Object Mode.
* belongs to the editor that the pointer last touched.  Over the UV Editor you are offered Mirror UVs, and over the 2D Viewport you are not.  Commands that work anywhere, such as the file commands, are always listed.

Commands that do not apply are left out and not greyed.  The palette shows the area that the pointer was over when you opened it, and runs the command there.  See :doc:`/interface/window_system`.

Each entry has the name of the command and, at its right end, its shortcut if it has one.  The palette is also how you find the shortcut of something.

The names are the full names of the commands.  They differ from the labels of the menus, which are shorter because the menu around them says the rest.  The Save row of the File menu is :guilabel:`Save Document` here, :guilabel:`Open…` is :guilabel:`Open Document…`, and :guilabel:`Import` with :guilabel:`CMO3…` is :guilabel:`Import CMO3…`.

Searching
=========

Type part of a name.  The list narrows as you type, and the best match is highlighted.  Case does not matter.  Matches are ranked, best first:

#. Names that begin with what you typed.
#. Names with a word that begins with it.
#. Names that contain it anywhere.
#. Commands whose internal name contains it.  Every command has a dotted name such as ``view.zoomIn``, which is also the name that the settings file uses for your keybindings.  Typing ``view.zoom`` finds all of them at once.  See :doc:`/interface/keymap`.

Matches of the same rank are sorted alphabetically.  With nothing typed, the palette shows every command that applies.

Keyboard Use
============

:kbd:`Up` and :kbd:`Down`
	Move the highlight.  It wraps from the last entry to the first.

:kbd:`Enter`
	Runs the highlighted command and closes the palette.

:kbd:`Escape`
	Closes the palette without running anything.

You can also click an entry to run it, and click outside the palette to close it.  A letter, or a space, goes into the search field and does not run a shortcut, as long as the palette is open.

The command runs after the palette has closed, so a command that asks something, such as a file dialog, opens over the window as usual.

.. seealso::

	* :doc:`/interface/keymap`
	* :doc:`/appendices/default_shortcuts`
	* :doc:`/interface/status_bar`
