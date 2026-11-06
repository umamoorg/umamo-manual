*************************
Supported Artwork Formats
*************************

Umamo reads the artwork a model is made from: layered files from Photoshop, Clip Studio Paint, and Krita, and flat images.  It reads them and never writes them.  Your artwork files are not changed by anything you do in Umamo.

This page says what each format gives Umamo, what it leaves out, and how a layer is recognized when the file is read again.  The other formats Umamo reads and writes, such as the Cubism ones, are in :doc:`/files/format_support`.

.. list-table::
	:header-rows: 1

	* - Format
	  - Made by
	  - How well it is read
	* - PSD (``.psd``)
	  - Photoshop
	  - Complete for the color modes it accepts.
	* - CLIP (``.clip``)
	  - Clip Studio Paint
	  - Implemented, but not fully tested, and it has known blending issues.
	* - KRA (``.kra``)
	  - Krita
	  - Complete for paint layers and groups.
	* - PNG, BMP, JPEG, WebP, TIFF
	  - Any program
	  - As a file of one layer.

Every format is recognized by what is inside the file before its extension is looked at.  See :doc:`/files/format_support`.

Layered Formats
===============

A layered file becomes a **canvas**, with the size of the file, holding layers and folders in order.  Umamo uses these parts of it:

* **Raster layers** become drawables.  A raster layer is one that stores pixels.
* **Folders** become parts, nested as the folders are.  A folder with a blend mode other than Normal, or with an opacity below 100%, becomes a part that is drawn as one layer, which is *Isolated*.  Any other folder becomes a part that is *Pass Through*.  See :doc:`/editors/properties/data_tab`.
* The **name**, the **eye** (visible or hidden), the **opacity**, the **blend mode**, and the **clipping** flag of each layer and folder.
* The **position** and **size** of each layer.

The layers that do not store pixels, such as text, vector, fill, and adjustment layers, are skipped, and the import notes name each one.  See :doc:`/artwork/importing`.

A mask on a layer is multiplied into the layer's transparency when the file is read, so the layer comes in as it looks.  The mask is not kept as a mask, and it cannot be switched off afterwards.

PSD
---

The file of Adobe Photoshop.  Umamo reads layers and folders, hidden layers, opacity, blend modes, clipping, and layer masks.

* **Color modes:** RGB and grayscale, with or without transparency, indexed color, and 1-bit bitmaps, at 8 or 16 bits for each channel.  A 16-bit channel is reduced to 8 bits.
* **Not read:** CMYK, Lab, multichannel, and duotone files, files with 32 bits for each channel, and the large PSB form of the format.  Umamo does not convert colors, so these are not accepted.  A file like that is reported as ``not a file format Umamo recognizes``.  Convert it to RGB in Photoshop first.
* **Blend modes:** the whole list of Photoshop is read, except *Dissolve*, which is read as Normal without a note.  See `Blend Modes`_.

CLIP
----

The file of Clip Studio Paint.  Umamo reads raster layers and folders, visibility, opacity, blend modes, clipping, and layer masks, in RGB, grayscale, and monochrome.

* **Text and vector layers** have no stored pixels, and are skipped.  So are fill and adjustment layers.
* **Blend modes:** all of the modes Clip Studio Paint has are read, but some are drawn a little differently, and this is the known issue with the format.  See `Blend Modes`_.
* **16-bit** and high-dynamic-range files are not read, and a layer in one comes in blank.
* **Folders** can pass through, blend, and have an opacity, as in the other formats.

The reader is based on observing files, and is tested on fewer files than the others.  If a CLIP file comes in wrong, open an issue.  See :doc:`/troubleshooting/reporting_bugs`.

KRA
---

The file of Krita.  Umamo reads paint layers and group layers, with their visibility, opacity, and blend modes.

* **Color spaces:** RGBA and grayscale with transparency, at 8, 16, and 32 bits for each channel.  Other color models, such as CMYK and Lab, are not read.
* **Inherit Alpha:** a layer whose *Inherit Alpha* is on is read as a clipping layer.
* **Skipped:** adjustment and generator layers, clone layers, vector shape layers, file layers, reference images, and every kind of mask layer.
* **Channel switches:** Krita's per-channel switches are not kept.  A layer is read with all of its channels on, and the import notes name each layer that had one off.  *Inherit Alpha* is one of these switches, and it is still kept as clipping.

Blend Modes
-----------

A layer's blend mode is carried to the drawable when the mode exists in Umamo's list.  There are three outcomes, and the import notes say which one applies to each layer:

.. list-table::
	:header-rows: 1

	* - Outcome
	  - Modes
	* - The same mode
	  - Normal, Darken, Multiply, Color Burn, Linear Burn, Lighten, Screen, Color Dodge, Add (Additive), Add Glow (Additive (Glow)), Overlay, Soft Light, Hard Light, Linear Light, Hue, Color
	* - The nearest mode, with a note
	  - Clip Studio Paint's *Glow Dodge* becomes Color Dodge.
	* - Normal, with a note
	  - Subtract, Darker Color, Lighter Color, Vivid Light, Pin Light, Hard Mix, Difference, Exclusion, Saturation, Luminosity, Divide

The modes of a drawable are listed under the :guilabel:`Blend` field of the Properties editor, and some of them need a newer runtime target.  See :doc:`/editors/properties/data_tab`.

Flat Images
===========

A PNG, BMP, JPEG, WebP, or TIFF file is read as a document of **one layer** as big as the picture.  The layer has the name of the file, it is visible at full opacity, and it has no folder.  Everything else in this chapter works on it as on a layer of a layered file.

A flat image has no id of its own to tell it apart, so its layer is told apart by its name.  Reloading a flat image works as long as the file keeps its name, and a renamed file is a different layer.  See `Layer Identity`_.

Layer Identity
==============

When a file is read again, Umamo has to say which layer is which.  Every layer is given a **key** when it is imported, and the drawables made from it are bound to that key.  What the key is made of depends on the format:

.. list-table::
	:header-rows: 1

	* - Format
	  - The key
	  - Holds across a rename or a move
	* - KRA
	  - The layer's ``uuid``, which Krita keeps for the life of the layer
	  - Yes
	* - CLIP
	  - The layer's ``LayerUuid``
	  - Yes
	* - PSD from Photoshop
	  - Photoshop's *Layer ID*, which stays with the layer
	  - Yes
	* - PSD without a layer ID
	  - The name of the layer with its place in the file
	  - No
	* - Flat image
	  - The name of the file
	  - No

Photoshop writes a layer ID.  Some other programs that write PSD files, such as Clip Studio Paint, Krita, and GIMP, may not, and then the key is the weaker one made of the name and the place.  The Sources editor shows which kind of key a layer has: ``Bound`` for a stable key, and ``Bound by name`` for the weaker one.  See :doc:`/editors/sources`.

A layer with a name-based key is lost when you rename it, or when the layers around it change its place in the file, because its key changes.  Umamo does not lose the work: it flags the binding for review, and it can usually find the layer again by its name, folder, position, size, and pixels.  See :doc:`/artwork/relinking_and_reloading`.  If you can choose, KRA and CLIP are the most dependable formats to keep reloading from.

Read and Write Matrix
=====================

What each format keeps of the file, and what it does not.  Umamo writes none of these formats, so every row is read only.

.. list-table::
	:header-rows: 1

	* - Kept
	  - PSD
	  - KRA
	  - CLIP
	  - Flat
	* - Layers and folders
	  - Yes
	  - Yes
	  - Yes
	  - One layer
	* - Hidden layers and folders
	  - Yes
	  - Yes
	  - Yes
	  - —
	* - Opacity
	  - Yes
	  - Yes
	  - Yes
	  - —
	* - Blend modes
	  - Yes
	  - Yes
	  - Yes, with issues
	  - —
	* - Clipping to the layer below
	  - Yes
	  - Inherit Alpha
	  - Yes
	  - —
	* - Layer masks
	  - Baked into the layer
	  - Skipped
	  - Baked into the layer
	  - —
	* - Text, vector, and adjustment layers
	  - Skipped
	  - Skipped
	  - Skipped
	  - —
	* - Stable layer key
	  - If the file has a layer ID
	  - Yes
	  - Yes
	  - No

The image that Umamo can write is the PNG of :menuselection:`File --> Export --> Image…`, which is a picture of the posed model and not of the artwork.  See :doc:`/files/exporting`.

.. seealso::

	* :doc:`/artwork/importing`
	* :doc:`/artwork/relinking_and_reloading`
	* :doc:`/files/format_support`
