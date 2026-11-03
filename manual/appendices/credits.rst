*******
Credits
*******

Umamo is made with the work of many people.  This page thanks them.  It follows the ``CREDITS.md`` file in Umamo's source code repository, which is also what :menuselection:`Help --> Credits…` shows inside Umamo.  The licenses of the components are summarized on :doc:`/about/license`.

Project Lead
============

The project lead of Umamo is `Azxiana <https://azxiana.com/>`__.

Translations
============

Thank you to the people who translated the interface of Umamo.

* **한국어 / Korean:** Nyaro.
* **Français / French:** skueee (Robin Brams).

Human translations for more languages are wanted.  See :doc:`/about/contribute/translations`.

Icons, Fonts, and Cursors
=========================

* `Tabler Icons <https://github.com/tabler/tabler-icons>`__ are used for icons.  `MIT License <https://github.com/tabler/tabler-icons/blob/main/LICENSE>`__.
* `Inter <https://github.com/rsms/inter>`__ is the interface font.  `SIL Open Font License 1.1 <https://raw.githubusercontent.com/rsms/inter/v4.1/LICENSE.txt>`__.
* `Noto Sans CJK <https://github.com/notofonts/noto-fonts>`__ draws Japanese, Korean, and Chinese text.  `SIL Open Font License 1.1 <https://github.com/notofonts/noto-fonts/blob/main/LICENSE>`__.
* The `Blender icons <https://ui.blender.org/icons>`__ are used for icons, under the `Creative Commons Attribution-ShareAlike 4.0 license <https://creativecommons.org/licenses/by-sa/4.0/>`__.
* The `Blender cursors <https://projects.blender.org/blender/blender/src/branch/main/release/datafiles/cursors>`__ are used as mouse cursors, under the `GNU General Public License, version 3 <https://projects.blender.org/blender/blender/src/branch/main/doc/license/GPL3-license.txt>`__.

Format Research
===============

Umamo reads and writes the files of other programs, and it can do so because other people studied those files first.

**MOC3.**  Umamo's MOC3 reader is based on Lina Hoshino's black box reverse engineering of the format.  Her videos are on `her YouTube channel <https://www.youtube.com/@HoshinoLina>`__:

* `Video 1 <https://www.youtube.com/watch?v=eEa0-wt1SqE>`__
* `Video 2 <https://www.youtube.com/watch?v=iT3A0AhK3YE>`__
* `Video 3 <https://www.youtube.com/watch?v=5AiZTgUx_WM>`__

**KRA.**  Umamo's reader for the Krita file format was ported directly from the code of `Krita <https://invent.kde.org/graphics/krita>`__, which is licensed under the GNU General Public License, version 3.

**CLIP.**  Umamo's reader for the Clip Studio Paint file format is based on the research of rasensuihei, in `cliputils <https://github.com/rasensuihei/cliputils>`__, under the `MIT License <https://github.com/rasensuihei/cliputils/blob/master/LICENSE>`__.

**CMO3 and the rest.**  The CMO3 format, and the details of the other formats, were found by observing the files that the programs write.  They are written down in the ``docs/format`` folder of the source code repository.  See :doc:`/appendices/legal` for how that work was done.

Libraries and Algorithms
========================

**TwelveMonkeys ImageIO.**  Parts of the readers for PSD, TIFF, and WebP files are ported from `TwelveMonkeys ImageIO <https://github.com/haraldk/TwelveMonkeys>`__, under the BSD 3-Clause license.  The ``imageio-psd`` module is copyright 2008 to 2020 Harald Kuhr.  The ``imageio-tiff``, ``imageio-metadata``, and ``common-io`` modules, which are the source of the LZW, PackBits, horizontal predictor, and CCITT decoders of the TIFF reader, are copyright 2012 Harald Kuhr and Oliver Schmidtmer.  The ``imageio-webp`` module is copyright 2017 Harald Kuhr and Simon Kammermeier.  The ported code is distributed as a part of Umamo under the GPLv3.

**Robust geometric predicates.**  The exact orientation and in-circle tests that mesh triangulation relies on are ported from `robust-predicates <https://github.com/mourner/robust-predicates>`__ by Volodymyr Agafonkin, under the Unlicense, which is a public domain dedication.  That library is itself a port of the ``predicates.c`` of Jonathan Richard Shewchuk, `Adaptive Precision Floating-Point Arithmetic and Fast Robust Geometric Predicates <https://www.cs.cmu.edu/~quake/robust.html>`__ (1997), which he placed in the public domain.  The triangulator built on them is Umamo's own, written from the published papers.

**Independent JPEG Group.**  Umamo's JPEG decoder is an independent implementation written from the ITU-T T.81 specification.  This software is based in part on the work of the `Independent JPEG Group <https://www.ijg.org/>`__ (copyright 1991 to 2020 Thomas G. Lane and Guido Vollbeding), under the IJG License.

**FileKit.**  The file pickers are provided by `FileKit <https://github.com/vinceglb/FileKit>`__ by vinceglb, under its `license <https://github.com/vinceglb/FileKit/blob/main/LICENSE>`__.

**Research papers.**  Umamo's code for geometry, such as outlines, triangulation, and meshing, draws on this published research:

* Shewchuk, 1997, `Adaptive Precision Floating-Point Arithmetic and Fast Robust Geometric Predicates <https://people.eecs.berkeley.edu/~jrs/papers/robustr.pdf>`__, Discrete & Computational Geometry 18(3).
* Lawson, 1977, Software for C1 surface interpolation.
* Sloan, 1993, A fast algorithm for generating constrained Delaunay triangulations, Computers & Structures 47(3).
* Felzenszwalb and Huttenlocher, 2012, Distance Transforms of Sampled Functions, Theory of Computing 8(19).
* Douglas and Peucker, 1973, `the Ramer–Douglas–Peucker algorithm <https://en.wikipedia.org/wiki/Ramer%E2%80%93Douglas%E2%80%93Peucker_algorithm>`__, Cartographica 10(2).
* Igarashi, Moscovich, and Hughes, 2005, `As-Rigid-As-Possible Shape Manipulation <https://www-ui.is.s.u-tokyo.ac.jp/~takeo/papers/rigid.pdf>`__.
* Ruppert, 1995, Journal of Algorithms 18(3).
* Üngör, 2004 and 2009, `arXiv cs/0501007 <https://arxiv.org/abs/cs/0501007>`__.
* Shewchuk, 2002, Delaunay refinement algorithms for triangular mesh generation.
* Miller, Pav, and Walkington, 2003, `Fully Incremental 3D Delaunay Refinement Mesh Generation <https://www.researchgate.net/publication/2552561_Fully_Incremental_3D_Delaunay_Refinement_Mesh_Generation>`__.
* Garland and Heckbert, 1995, `Fast Polygonal Approximation of Terrains and Height Fields <https://www.cs.cmu.edu/afs/cs/Web/People/garland/scape/scape.pdf>`__.
* Prasad, 1997, `Rectification of the chordal axis transform and a new criterion for shape decomposition <https://www.osti.gov/servlets/purl/977914>`__.
* Igarashi, Matsuoka, and Tanaka, 1999, `Teddy: A Sketching Interface for 3D Freeform Design <https://www.cs.toronto.edu/~jacobson/seminar/igarashi-et-al-1999.pdf>`__.

.. seealso::

	* :doc:`/about/license`
	* :doc:`/appendices/legal`
