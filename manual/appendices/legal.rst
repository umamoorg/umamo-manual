*****
Legal
*****

This page has the legal notices of the Umamo project: who Umamo is not, how its file format code was written, how AI is used in the project, and under what license Umamo is shared.  These are the statements of the project.  The license text is what binds.

Trademark and Non-Affiliation
=============================

Umamo is an independent, community-developed project.  It is **not affiliated with, authorized by, endorsed by, or sponsored by Live2D Inc.** (formerly Cybernoids Co., Ltd.) or any of its affiliates.

"Live2D®" and "Cubism" are trademarks of Live2D Inc. in Japan and/or other countries.  All other trademarks are the property of their respective owners.  These marks are used here only nominatively, to describe file-format compatibility, and **no endorsement, affiliation, or sponsorship is implied.**

Umamo reads and writes files that the Cubism Editor and the Cubism runtimes use.  This manual uses the name "Cubism" only to name those files and their versions.  See :doc:`/files/cubism_interchange`.

Clean-Room Provenance
=====================

Umamo's editor-format layer, which is the reading and writing of ``.cmo3`` and ``.moc3`` files and the reading of ``.clip`` files, is a **clean-room reimplementation**.  It was built from black-box observation of the files that the programs write, and from public documentation that other people produced independently.  What was found is written down in the ``docs/format`` folder of the source code repository.

The Krita format reader is different: it was ported from Krita's own open-source code, which is licensed under the GPLv3, a license that is compatible with Umamo's.  See :doc:`/appendices/credits`.

To keep this true, the project asks everyone who contributes code to affirm that:

#. They did not use official Live2D or Cubism source code, or decompiled binaries, as a basis for the work.  Their knowledge comes only from observing the output of files, and from public, independently authored documentation.
#. They are not bound by an agreement with Live2D that the contribution would breach, and they will disclose any such license before they contribute.
#. They are not a past or present employee of Live2D or Cybernoids.

If you have been exposed to Live2D source code or decompiled binaries, please do not contribute.  See :doc:`/about/contribute/index` for how contributions are handled, and :doc:`/troubleshooting/reporting_bugs` for how this applies to bug reports.

License
=======

Umamo is licensed under the GNU General Public License, version 3 (GPLv3).  The full text is in the `LICENSE <https://github.com/umamoorg/umamo/blob/master/LICENSE>`__ file at the root of Umamo's source code repository.  This manual is licensed under the GPLv3 as well.  The mascot character, Erica Tamamo, is All Rights Reserved and is not part of what the license covers.  See :doc:`/about/license` for a plain-language summary, and for the licenses of the components that Umamo includes.

.. seealso::

	* :doc:`/about/license`
	* :doc:`/appendices/credits`
	* :doc:`/troubleshooting/reporting_bugs`
