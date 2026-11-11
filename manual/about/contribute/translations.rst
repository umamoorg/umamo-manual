************
Translations
************

There are two things to translate: Umamo's interface, and this manual.  Human translations are wanted for both.

Languages Today
===============

Umamo's interface is available in four languages.

.. list-table::
	:header-rows: 1

	* - Language
	  - Shown in the language list as
	  - How much is translated
	* - English
	  - English
	  - Everything.  It is the default.
	* - Japanese
	  - 日本語
	  - Almost everything.
	* - Korean
	  - 한국어
	  - A little over half.
	* - French
	  - Français
	  - About two thirds.

These figures are for Umamo |release|.  Translators are thanked on the :doc:`Credits </appendices/credits>` page.

Umamo starts in the language that best matches your operating system's preferred languages and falls back to English if a translation is unavailable.  The Quick Setup splash screen shows the language choice the first time you start Umamo.  To change it later, open :menuselection:`Edit --> Settings…`, choose the :guilabel:`Interface` category, and set :guilabel:`Language`.

This manual has not been translated yet.

Translating the UI
==================

The interface strings are in the `Umamo source code repository <https://github.com/umamoorg/umamo>`__.  The English strings are in this file:

.. code-block:: text

	module/ui/src/commonMain/composeResources/values/strings.xml

Each translation is a file with the same name in a folder beside it, named for the language: ``values-fr`` for French, ``values-ja`` for Japanese, and ``values-ko`` for Korean.  To translate Umamo, make a copy of the English file and translate the text of each string.

* Change only the text inside each ``<string>`` element.  Leave its ``name`` as it is.
* Keep placeholders such as ``%1$s`` in the translated text.  Umamo fills them in with a name or a number.
* Do not translate format-level identifiers such as ``ParamAngleX``.  They are part of the Cubism data model and stay as they are so that files remain compatible.  The names that you give to your own parts and parameters are also left alone, because they belong to your puppet.
* Partial translations are welcome.  Any untranslated strings will default to showing the English string.

It helps the next translator if the file starts with a comment that lists the terms you chose and the style you used, as the French file does.  For example, it chooses the polite form of address.

Send your translation as a pull request.  Small pull requests are easiest to review, so a few files at a time is better than one large change.  See :doc:`index` for the project's policy on contributions.

.. warning::

	AI based translations are accepted as long as a fluent or native speaker is proofreading them.  Since AI translations tend to wander on technical terms, for example drawable versus art mesh, it is imperative that they are reviewed for consistency.  Additionally, AI also has a tendency to write in a style that can feel unnatural to read.  Please reword any translations that feel awkward to read.

Adding a New Language
=====================

To add a language that Umamo does not have yet:

#. Copy ``values/strings.xml`` into a new folder named ``values-`` followed by the language code, such as ``values-es`` for Spanish.  Translate the strings as described above.
#. Add the language to the list in ``UI_LANGUAGE_ENDONYMS``, in ``module/ui/src/commonMain/kotlin/org/umamo/ui/l10n/AppLocale.kt``.  The entry is the language code and the name of the language in that language, as in ``"fr" to "Français"``.  The name is shown as it is written there, whatever language Umamo is using, so that someone who cannot read the current language can still find their own.
#. Start Umamo from the source, choose the language in :menuselection:`Edit --> Settings…`, and look through the interface.  Translated text is often longer or shorter than the English, so check that it still fits in the panels and buttons.  The README in the source code repository explains how to build and run Umamo.

Translating This Manual
=======================

The manual uses `gettext <https://www.gnu.org/software/gettext/>`__ and ``sphinx-intl``.  Every translation lives in a ``.po`` file under ``locale/``, one for each page of the manual.  Set up the build first, as described in :doc:`building_the_manual`.

To start a translation, or to bring an existing one up to date with changes to the English, run the following with the code of your language:

.. code-block:: bash

	make update-po LANG_CODE=fr

This creates or updates the files in ``locale/fr/LC_MESSAGES/``.  Open them in any editor for ``.po`` files and fill in the ``msgstr`` of each ``msgid``.  Anything that you leave empty is shown in English.

To see your translation, build the manual in that language:

.. code-block:: bash

	make html O="-D language=fr"

Sphinx compiles the ``.po`` files when it builds.  Only the ``.po`` files belong in the repository.  The ``.pot`` templates and the compiled ``.mo`` files are made by the build, and Git ignores them.

.. seealso::

	* :doc:`/interface/settings`
	* :doc:`/appendices/credits`
	* :doc:`/about/contribute/building_the_manual`
