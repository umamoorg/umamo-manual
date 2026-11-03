*************
Pen and Touch
*************

.. admonition:: Not yet available
	:class: caution

	This feature is not available in Umamo yet.  This page records its current status.

Umamo is being made for pen displays and tablets, and first class pen and touch support is one of the goals of the project.  It is not built yet.

Current Status
==============

* Pen pressure, tilt, and the buttons of a pen are not read.  Nothing in Umamo changes with how hard you press.
* The :guilabel:`Pen` category of the Settings window is empty.  It says ``Pen configuration is coming soon.``  See :doc:`/interface/settings`.
* Touch has no gestures of its own.  There is no pinch to zoom and no two-finger pan.
* There is no Android or iPadOS build, which is where a pen and touch interface matters most.  See :doc:`/troubleshooting/platform_notes`.

What Works Today
================

On a computer, a pen or a finger that your operating system turns into mouse input drives Umamo like a mouse.  You can click, drag, and select with it.  Umamo has not been tuned or tested for it, so how well that feels depends on your system.

Some parts of the interface were made so that they do not need a keyboard:

* **Pie menus** pick by the direction of a flick, and can be reached from the right-click menu of the 2D Viewport.  See :doc:`/interface/pie_menus`.
* **Every command is in a menu or in the command palette**, so none of them needs a shortcut.  See :doc:`/interface/menus`.
* **The Settings window has a close button**, for a device that has no :kbd:`Escape` key.
* **Rows can be dragged after a long press** in the Outliner and the Sources editor, to reparent or relink them.

The viewport is panned with the middle mouse button and zoomed with the wheel, which a pen does not have.  See :doc:`/editors/viewport_2d/navigation`.

Planned
=======

The project's notes describe where pen and touch support is going.  It is not scheduled.

* Reading pressure, tilt, and the buttons of a pen, first on Android, and then on the desktop systems.
* A real :guilabel:`Pen` category in Settings, to choose how the pen is read, and later to shape the pressure curve.
* A radial menu for tablets without a keyboard, opened by a button of the pen or by a long press, which reaches the tools and the Settings window.
* Pen buttons that can be bound to commands in :guilabel:`Keybindings`, next to keys and mouse buttons.  See :doc:`/interface/keymap`.
* Builds for Android tablets.

.. seealso::

	* :doc:`/interface/pie_menus`
	* :doc:`/interface/keymap`
	* :doc:`/editors/viewport_2d/navigation`
	* :doc:`/troubleshooting/platform_notes`
