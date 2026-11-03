**************
Updating Umamo
**************

Umamo can tell you when a newer version is out.  It never downloads or installs one by itself: it opens the download page, and you install the new version the way you installed the first.

Checking for Updates
====================

:menuselection:`Help --> Check for Updates…` asks at once, and always answers:

* If a newer version is out, a window says so, and offers to take you to the download page.
* If you have the newest, it says ``You have the latest version of Umamo`` and the version.
* If no release has been published yet, it says ``No release of Umamo has been published yet.``
* If it could not find out, it says ``Could not check for updates`` and why, such as that there is no network.

Only a full release counts.  A draft, or a release that is marked as a preview, is ignored.

The check asks GitHub for the latest release of the project, and reads its version.  It sends nothing about you or your documents.  Your version of Umamo is in the request, in the same place where a browser puts its name.  It uses the proxy settings of your operating system.  This is the only use of the network in Umamo.

Your own version is in :menuselection:`Help --> About Umamo…`.  A development build such as ``0.5.0-dev`` counts as older than the release ``0.5.0``, so once that release is out the check offers it to you.

Update Notifications
====================

Umamo also checks when it starts, if it has not asked in the last day.  It tells you only when there is something to say.  When you are up to date, when nothing is published, and when there is no network, it says nothing and only writes a line in the log.  A check that finds no answer is tried again at the next start.

When a newer version is out, a window says ``Umamo 0.5.0 is available.  You have 0.4.0.``  Its buttons are:

:guilabel:`Open Download Page`
	Opens ``umamo.org`` in your browser, at the downloads.

:guilabel:`Later`
	Closes it.  Umamo asks again at a later start, once a day at the most.

:guilabel:`Skip This Version`
	Closes it, and Umamo stays quiet about this version and every older one.  It tells you again when a newer one comes out.  Skipping hides the notice at start only.  :menuselection:`Help --> Check for Updates…` still tells you.

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: The update notice with its message, ``Umamo version is available.  You have version.``, and its three buttons, Open Download Page, Later, and Skip This Version.
	:Setup: Run an older build of Umamo while a newer release is published, and choose Help → Check for Updates….
	:Crop: The window and a little of the window behind it.
	:Save as: ``images/getting_started/update_notice.png``
	:Caption: The notice that a newer version is available.

Installing an Update
====================

Download the new version from the page, and install it over the old one, the same way as before.  See :doc:`/getting_started/installing`.  Your settings and your documents are kept.  Close Umamo first.

Check the download if you want to be sure of it.  See :doc:`/getting_started/verifying_downloads`.

Read the release notes before you update.  A new version may change a file format, and an older version may not open what a newer one saves.  See :doc:`/appendices/release_notes` and :doc:`/files/uma`.

Turning Off the Startup Check
=============================

Clear :guilabel:`Check for updates when Umamo starts`.  It is in Quick Setup, and in the :guilabel:`Interface` category of :menuselection:`Edit --> Settings…`.  Umamo then does not use the network when it starts.  :menuselection:`Help --> Check for Updates…` still works whenever you choose it.

.. seealso::

	* :doc:`/getting_started/installing`
	* :doc:`/interface/settings`
	* :doc:`/interface/menus`
