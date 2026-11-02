*******************
Building the Manual
*******************

The manual is built with `Sphinx <https://www.sphinx-doc.org/>`__ and the `Furo <https://pradyunsg.me/furo/>`__ theme.  Its source is in the `umamo-manual <https://github.com/umamoorg/umamo-manual>`__ repository.

Setting Up
==========

You need Python 3.13 or newer and `Git <https://git-scm.com/>`__.  On Linux and macOS you also need ``make``.

Get the source and let the Makefile create a virtual environment with everything the build needs:

.. code-block:: bash

	git clone https://github.com/umamoorg/umamo-manual.git
	cd umamo-manual
	make venv

``make venv`` creates the ``.venv`` folder and installs ``requirements-dev.txt`` into it.  The Makefile uses the Sphinx in ``.venv``, so you do not need to activate the environment, and a Sphinx that is installed on your system is not used.  You only need to do this once.

On Windows, ``make.bat`` does the same job as the Makefile for the Sphinx targets, but it does not create the environment.  Create it yourself:

.. code-block:: bat

	python -m venv .venv
	.venv\Scripts\pip install -r requirements-dev.txt

Building and Previewing
=======================

Build the manual with:

.. code-block:: bash

	make html

The result is in ``build/html``.  Open ``build/html/index.html`` in a browser.  On Windows, run ``make.bat html``.

While you write, it is easier to let the manual rebuild itself:

.. code-block:: bash

	make livehtml

This serves the manual at http://127.0.0.1:8000 and rebuilds it, and reloads the page in the browser, every time you save a file.  On Windows, use ``.venv\Scripts\sphinx-autobuild manual build\html``.

``make clean`` removes the ``build`` folder.  Run ``make`` without a target to list what else the Makefile can do.

Checking for Warnings
=====================

Before you send a change, run:

.. code-block:: bash

	make check

This builds the manual again, but it treats every warning as an error and is strict about references, so a broken link or a missing page stops the build.  The build must finish without any warning.  On Windows, run ``.venv\Scripts\sphinx-build -b html -W --keep-going -n manual build\html``.

A page that has not been written yet shows a box for its ``todo``.  That is expected, and it is not a warning.

Project Layout
==============

.. list-table::
	:header-rows: 1

	* - Path
	  - Contents
	* - ``manual/``
	  - The Sphinx source: ``conf.py``, ``index.rst``, and one folder for each chapter.
	* - ``manual/_static/``
	  - Static files for the HTML output, such as CSS and the logo.
	* - ``locale/``
	  - Translation catalogs: ``locale/<language>/LC_MESSAGES/*.po``.
	* - ``requirements.txt``
	  - What it takes to build the manual.  Read the Docs installs this file.
	* - ``requirements-dev.txt``
	  - The same, plus ``sphinx-autobuild`` and ``sphinx-intl``.
	* - ``.readthedocs.yaml``
	  - The Read the Docs build.
	* - ``.editorconfig``
	  - Editor settings.  reStructuredText is indented with tabs.

Each chapter is a folder with an ``index.rst`` that holds its table of contents.  The version in ``manual/conf.py`` is written by hand, so keep it in step with the version of Umamo.  The :doc:`writing_guide` explains how the pages are written.

.. seealso::

	* :doc:`/about/contribute/writing_guide`
	* :doc:`/about/contribute/translations`
