**********************
Performance and Memory
**********************

Umamo is written in Java and Kotlin, so it can use only as much memory as its Java runtime allows.  A large model with many layers and large texture atlases needs a lot of memory, and an export takes more memory than editing does.  This page explains where the limit is specified, what Umamo does when it runs out, and how you can change resource limits.

How Much Memory Umamo Gets
==========================

.. list-table::
    :header-rows: 1

    * - How you run Umamo
      - The memory limit
    * - An installer, or a portable archive (``.msi``, ``.dmg``, ``.deb``, ``.rpm``, ``.zip``, ``.tar.gz``)
      - Half of the memory of the computer.
    * - The ``.jar``
      - Java's own default is a quarter of the memory of the computer.  When that would give Umamo less than 3 GB, the ``.jar`` starts itself again with half of the memory.  Otherwise it keeps Java's default.

The second start happens before the window opens.  It does not happen when you started the ``.jar`` with a memory limit of your own, such as ``-Xmx8g``, when a debugger is attached, or when Java does not say which program is running it.  A limit that you give is always kept.

To start the ``.jar`` with half of your memory yourself, use a terminal:

.. code-block:: bash

    java -XX:MaxRAMPercentage=50 -jar umamo-<target>-<version>.jar or java -Xms512m -Xmx2g -jar  umamo-<target>-<version>.jar (with your own limits for the -Xms and -Xmx options)

The log records the limit that every session got.  Near the top is a line such as ``started from the jar umamo-linux-x64-0.5.0.jar; the heap may grow to 8192 MiB``.  See :doc:`/troubleshooting/reporting_bugs`.

How much memory do you need?  The web site gives 16 GB as the minimum and 32 GB or more as the recommended amount.  8 GB has been tested, but heavy models with many layers and large atlases can run out of memory.  A model with three 8192 by 8192 pixel atlas pages needs about 1.3 GB just to export.  The document that is open, the viewport, and everything else need memory on top of that.  See :doc:`/getting_started/system_requirements`.

Out-of-Memory Alerts
====================

Two alerts are about memory.

**At launch**, a ``.jar`` that could not be given enough memory shows an alert once it has started:

``Umamo has been allocated at most 2.0 GB of memory.  Large files, especially exports, can cause Umamo to run out of memory and crash.  To allocate up to 50% of the system memory for Umamo: run this command from a terminal:`` and the command, which has the name of your ``.jar`` in it.

This happens when Umamo could not start itself again.  Use the command.  :guilabel:`Don't Show Again` turns the alert off for good.  The installed versions already use up to half of your computer's installed memory, so they never show it.

.. figure:: /images/troubleshooting/pointer_notice.png

	A standard out of memory message when launching Umamo.

**During an export**, a CMO3 or MOC3 export that runs out of memory stops and tells you so:

``Could not export name: Umamo ran out of memory.  The open document is unaffected.``

For the ``.jar`` the alert also names the limit it ran out of, and gives the command that allows half of your memory: ``Save, quit, and run this command from a terminal``.  Your open document is not changed.

An image export that is too large has a message of its own: ``There was not enough memory for a 12000 × 9000 px image.  Try a smaller scale.``  A picture needs 4 bytes for every pixel, so the biggest picture that the dialog allows, 16384 pixels each way, needs about a gigabyte.

If memory runs out anywhere else, such as while a very large document is opening, Umamo has no alert for it, and it can crash.  Save often, and see :doc:`/troubleshooting/backups_and_data_safety`.

When an export runs out of memory:

* Save your document, quit Umamo, and start it again with more memory, as above.
* Close other programs.  The limit is a share of the memory of the computer, and other programs use the rest.

Viewport Cost
=============

The viewport is drawn by the graphics card, and the model is drawn at twice the resolution of the screen and scaled down, so that its edges are smooth.
You can turn off the default Supersampling toggle To preserve performance, especially on a computer with a weak graphics card, or with only software rendering, such as Windows subsystem for Linux.


:guilabel:`Supersampling (2x Render Quality)`
    In :menuselection:`Edit --> Settings…`, in the :guilabel:`Viewport` category.  It is on by default.  With it off, the viewport is drawn at its own size, which is cheaper and a little rougher.

:guilabel:`Keep supersampling while resizing panels`
    Only when supersampling is on.  Turn it off to draw at the plain size while you drag a splitter, so that resizing stays smooth, and the smooth edges return when you stop.

See :doc:`/interface/settings`.

Other things that help:

* Turn off the overlays that you do not need.  The wireframe, the lattices of deformers, and the grid are all drawn on top of the model.  See :doc:`/editors/viewport_2d/overlays`.
* Close areas that you do not use.  Each 2D Viewport or UV Editor area draws its own view.
* Lower :guilabel:`History Steps` in the :guilabel:`Interface` category of Settings.  Umamo keeps that many undo steps in memory, 200 by default and between 1 and 1000.  A lower number keeps fewer.  It never removes the current step or the steps that you can redo.  See :doc:`/editors/history`.

Large Documents
===============

Umamo is built for large models.  It reads and writes a puppet file, draws the viewport, and builds meshes without freezing the window, and the status bar shows each running task and how far along it is.  A document of hundreds of thousands of vertices stays responsive when you edit it.
Some things to keep in mind:

* **Opening, saving, and exporting take time.**  Umamo does this one-by-one.  Another open, or New, while one is running is refused with a notice, and New, Open, and quitting wait while a CMO3 or MOC3 export runs.
* **Texture atlases are a large part of the cost.**  Pages that are 8192 pixels wide take four times the memory of pages that are 4096 wide.  The atlas options of :doc:`/artwork/atlas_packing` set the page size.
* **Artwork larger than the graphics card can hold** is scaled down for the viewport, and not refused.
* **Save before you start something large**, such as reloading all artwork, repacking the atlas, or generating meshes for the whole document.  Each one can take a while on a big model.
* **A MOC3 has limits** that a .UMA file does not.  A mesh with more than 65,536 vertices is left out of a MOC3 export.  See :doc:`/files/export_notices`.

If a particular model is slow or fails, report it with the model if you may share it.  See :doc:`/troubleshooting/reporting_bugs`.

.. seealso::

    * :doc:`/interface/settings`
    * :doc:`/troubleshooting/platform_notes`
    * :doc:`/getting_started/installing`
