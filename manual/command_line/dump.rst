****
dump
****

``dump`` prints out the structure of a puppet, one record per line, so that it is easy to read, search, and compare with ``diff``.  It takes a CMO3 file, a MOC3 file, or an artwork file.

Synopsis
========

.. code-block:: text

	dump <file> [--sections] [--xml] [--puppet]

``dump`` takes exactly one file.  For example:

.. code-block:: bash

	./gradlew -q :cli:run --args="dump model.cmo3 --puppet"

Numbers are printed with up to six significant digits and without trailing zeros, so ``30`` is ``30`` and not ``30.0000``.

Output by Format
================

MOC3
----

Without options, ``dump`` prints the static rig of a MOC3 file.  This includes the parameters, the parts, and the drawables exactly as they are stored.   Nothing is evaluated, so there are no posed positions or opacities.

.. code-block:: text

	# MOC3 version=6
	# canvas size=1000,2000 origin=500,1000 ppu=1000
	# counts parameters=27 parts=14 drawables=0 deformers=0 glues=0 groups=3 bindings=1 blendShapes=0 offscreens=2
	[parameters]
	P 0 id=ParamAngleX type=0 min=-30 max=30 def=0 repeat=0
	P 1 id=ParamAngleY type=0 min=-30 max=30 def=0 repeat=0
	...
	[parts]
	T 0 id=PartRough parent=-1
	T 1 id=PartFace parent=-1
	...

The lines that start with ``#`` are the header.  They give the MOC3 version, the canvas size, origin, and pixels per unit, and how many of each kind of object the file holds.  The other lines are records:

.. list-table::
	:header-rows: 1

	* - Line
	  - Fields
	* - ``P``
	  - A parameter: Its index, ``id``, ``type`` ``number``, ``min``, ``max``, ``def`` (default), and ``repeat``.
	* - ``T``
	  - A part: Its index, ``id`` and the index of its ``parent`` part.
	* - ``D``
	  - A drawable: Its index, ``id``, its constant flags (``cflag``, in hexadecimal), the index of its texture page (``tex``), its parent part (``part``), its vertex count (``vtx``), the number of triangle indices (``idx``), and the number of drawables that mask it (``masks``).

``--sections`` prints the structure of the file instead: The MOC3 version, how many sections it has, the counts that the file declares, and one ``S`` line for each section that is present with its number of elements.

.. code-block:: text

	# MOC3 version=6 sections=167 bigEndian=false
	# countInfo 14,0,0,0,0,27,14,...
	S COUNT_INFO count=64
	S CANVAS count=16
	S PARAM_RUNTIME_SLOT count=27
	...
	# sections present=53 modeled=167

CMO3
----

A CMO3 file is an archive.  Without options, ``dump`` prints the Cubism version the file targets, the archive's header, a table of the archive's entries, the embedded images, and a summary of the model document inside, ``main.xml``.

.. code-block:: text

	# CMO3 targetVersionNo=5030000
	# caff formatVersion=0.0.0 archiveVersion=0.0.0 obfuscateKey=1237796726
	[entries]
	E 0 path=image.png tag= size=96 compression=RAW obfuscated=1
	E 1 path=image_0.png tag= size=83 compression=RAW obfuscated=1
	E 2 path=image_1.png tag= size=75 compression=RAW obfuscated=1
	E 3 path=main.xml tag=main_xml size=70914 compression=FAST obfuscated=1
	[images]
	[xml]
	# versions ModelStateSet=1 KeyformGridSource=1 CParameterGroup=4 ...
	# imports com.live2d.cubism.doc.gameData.motions.CGameMotionSet ...

.. list-table::
	:header-rows: 1

	* - Line
	  - Fields
	* - ``E``
	  - An archive entry: Its index, ``path``, ``tag``, ``size`` in bytes after it is unpacked, ``compression``, and whether it is ``obfuscated``.
	* - ``I``
	  - An embedded layer image: Its index, ``type``, ``width``, ``height``, and the size of its PNG in bytes (``pngBytes``).
	* - ``# versions``
	  - The version of each class that the model document uses, as ``class=version``.
	* - ``# imports``
	  - The classes that the model document imports.

``--xml`` prints the entirety of the XML model document, ``main.xml``, and can redirected to standard out:

.. code-block:: bash

	./gradlew -q :cli:run --args="dump model.cmo3 --xml" > main.xml

Artwork
-------

For a PSD, CLIP, or KRA file, or a flat image, ``dump`` prints the canvas, the groups, and every layer.  A flat image is treated as a layered artwork file with a single layer.

.. code-block:: text

	[artwork] KritaLayerVisibility.kra
	# canvas 1024x1024
	# counts layers=6 raster=6 groups=2
	G path=Group 6 name=Group 6 vis=0 op=1 blend=Normal clip=0 through=0
	G path=Group 6/Group 7 name=Group 7 vis=1 op=1 blend=Normal clip=0 through=0
	L 3 order=2 kind=Raster id={63d5ac9d-7c99-4c7a-8251-ed3e0e71e2a7} name=Paint Layer 4 at=512,256 size=512x256 alpha=419x162+49+61 op=1 blend=Normal vis=1 clip=0 group=Group 6
	...

.. list-table::
	:header-rows: 1

	* - Line
	  - Fields
	* - ``G``
	  - A group: Its ``path`` through the groups that hold it, its ``name``, whether it is visible (``vis``), its opacity (``op``), its blend mode (``blend``), whether it is clipped to the layer below (``clip``), and whether it is a pass-through group (``through``).
	* - ``L``
	  - A layer: Its index, ``order``, ``kind``, ``id``, and ``name``, the position (``at``) and size of its pixels on the canvas, the ``alpha`` column, its opacity, blend mode, visibility, clipping, and the path of the ``group`` that holds it, which is empty at the top level.

A layer's ``order`` counts from the top of the stack: 0 is the top-most layer.  Its ``kind`` is ``Raster`` for a layer of pixels, and ``Text``, ``Vector``, ``Adjustment``, ``Fill``, or ``Unknown`` for the layers without pixels.

The ``alpha`` column is how ``atlas`` and ``mesh`` see the layer.  It is the layer's opaque area, trimmed to the smallest rectangle that holds every pixel with any opacity, written as ``width`` x ``height`` ``+left+top``, measured from the corner of the layer's own pixels.  A layer with nothing opaque in it has ``alpha=empty``.  Such a layer is never packed into an atlas.

Options
=======

.. list-table::
	:header-rows: 1

	* - Option
	  - Applies to
	  - Effect
	* - ``--sections``
	  - MOC3
	  - Prints the structure of the file instead of the rig.
	* - ``--xml``
	  - CMO3
	  - Prints ``main.xml`` instead of the overview.  ``--puppet`` has no effect when it is given as well.
	* - ``--puppet``
	  - CMO3, MOC3
	  - Adds a summary of the model as Umamo imports it.

An option on a kind of file that it does not apply to is a usage error.

``--puppet`` prints the model after the normal output, as Umamo imports it.  This is the import that the editor and ``convert`` use, so it is the place to look first when a conversion is not what you expected.

.. code-block:: text

	[puppet]
	# counts parameters=27 parts=15 deformers=0 drawables=0 glues=0 parameterGroups=0 links=0
	# canvas 1000x2000 origin=500,-1000 target=Cubism53
	P 0 id=ParamAngleX min=-30 max=30 def=0
	P 1 id=ParamAngleY min=-30 max=30 def=0
	...
	N 0 param id=ParamAngleX
	N 0 param id=ParamAngleY
	...

.. list-table::
	:header-rows: 1

	* - Line
	  - Fields
	* - ``# counts``
	  - How many parameters, parts, deformers, drawables, glues, parameter groups, and links the model has.
	* - ``# canvas``
	  - The canvas size, the position of the origin, and the runtime ``target`` of the model, such as ``Cubism53``.
	* - ``P``
	  - A parameter: its index, ``id``, ``min``, ``max``, and ``def``.
	* - ``N``
	  - A node of the parameter panel, in the order the panel shows it.  The number after ``N`` is how many groups it is inside.  A ``param`` node has an ``id``.  A ``group`` node has an ``id``, a ``name``, and ``open``, which is 1 when the group starts open.
	* - ``K``
	  - A pair of parameters that the panel links into one two-dimensional control, with the ``x`` and the ``y`` parameter.

Warnings
========

A MOC3 file that has no readable ``.cdi3.json`` imports without its display names, parameter groups, and linked parameters.  ``--puppet`` prints this warning to standard error:

.. code-block:: text

	Warning: no readable cdi3.json for model.moc3; importing without display names, parameter groups, or linked parameters

A ``.cdi3.json`` that cannot be parsed is ignored, with a warning of its own.

``--puppet`` on an artwork file prints the artwork first and then stops with a usage error, because artwork has no rig to import.

.. seealso::

	* :doc:`/command_line/diff`
	* :doc:`/command_line/extract`
	* :doc:`/files/format_support`
