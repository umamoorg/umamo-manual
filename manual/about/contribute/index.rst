**********
Contribute
**********

Umamo is developed in the open and this manual is part of the project.  There are several ways to help.

.. toctree::
	:maxdepth: 1

	writing_guide
	translations
	building_the_manual

Ways to Help
============

* Report bugs, and ask for support of newer file formats.  Open an issue on `GitHub <https://github.com/umamoorg/umamo/issues>`__.  See :doc:`/troubleshooting/reporting_bugs`.
* Translate Umamo's interface into more languages or finish a partial translation.  See :doc:`translations`.
* Translate or improve this manual.  See :doc:`writing_guide` and :doc:`building_the_manual`.
* Try Umamo and give feedback on the `Discord <https://discord.gg/TRAhW5Uc2t>`__ server.
* Support the project financially.  See :ref:`supporting-the-project`.

Contributing Code
=================

At the moment Umamo is not accepting large code contributions from outside contributors.  Small fixes are accepted, but development moves quickly, so a larger change may be obsolete by the time it can be reviewed.  Development is currently done by one person so their throughput is limited.

Once large changes are accepted, a change that touches many files should be broken down into a stack of smaller pull requests that build on each other.  For example, to add a new export format:

#. Add the underlying data structures and parser with tests, and no user interface wiring yet.
#. Add the export logic that consumes those structures, merged on top of the first pull request.
#. Wire up the user interface or command line flag that exposes the feature, merged on top of the second.

Each pull request should be reviewable and mergeable on its own.  That makes review faster and makes it easier to find which change caused a regression.

Before You Contribute
=====================

Umamo's editor-format layer, which reads and writes ``.cmo3`` and ``.moc3`` files, is a clean-room reimplementation of those formats.  It is built from black-box observation of file outputs and independently produced documentation.

By contributing, you affirm that:

#. You have not used official Live2D or Cubism source code or decompiled binaries as a basis for your contribution.  Your knowledge comes only from observing file outputs and from public, independently authored documentation.
#. You are not bound by a Live2D agreement that your contribution would breach, and you will disclose any such license before contributing.
#. You are not a past or present employee of Live2D or Cybernoids.

If you have been exposed to Live2D source code or decompiled binaries, please do not contribute.

.. seealso::

	* :doc:`/about/introduction`
	* :doc:`/troubleshooting/reporting_bugs`
	* :doc:`/appendices/legal`
