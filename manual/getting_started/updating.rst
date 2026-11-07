**************
Updating Umamo
**************

Umamo can tell you when a newer version is available.  It never downloads or installs a new version by itself.  It opens the download page and you install the new version the same way that you installed the first.

Checking for Updates
====================

:menuselection:`Help --> Check for Updates…` checks immediately and always shows a result:

* If a newer version is available, a window will tell you and offer to take you to the download page.
* If you have the latest version, it will say ``You have the latest version of Umamo`` along with the version number.
* If no release has been published yet, it will say ``No release of Umamo has been published yet.``
* If it could not check, it will say ``Could not check for updates`` and give the reason.  For example, there is no network connection.

Only full releases are considered.  Drafts and releases that are marked as a preview are ignored.

The check asks GitHub for the latest release of the project and reads its version.  It does not send any information about you or your puppet files.  The request includes your version of Umamo in the same way that a browser identifies itself, and the proxy settings of your operating system are used.  This is the only network access that Umamo makes.

You can see your version of Umamo in :menuselection:`Help --> About Umamo…`.  A development build such as ``0.5.0-dev`` is considered older than the release ``0.5.0``, so the check will offer you that release once it is available.

Update Notifications
====================

Umamo also checks for updates when it starts, as long as it has not checked in the last day.  It only notifies you when there is something to report.  If you are up to date, no release has been published, or there is no network, nothing is shown, and a line is written to the log.  A check that gets no answer will be tried again at the next start.

When a newer version is available, a window will say ``Umamo 0.5.0 is available.  You have 0.4.0.``  The window has these buttons:

:guilabel:`Open Download Page`
	Opens the downloads section of ``umamo.org`` in your browser.

:guilabel:`Later`
	Closes the window.  Umamo will ask again at a later start, at most once a day.

:guilabel:`Skip This Version`
	Closes the window.  Umamo will not notify you about this version or any older version again, and will notify you when a newer version is released.  Skipping only hides the notice at startup.  :menuselection:`Help --> Check for Updates…` will still tell you.

.. admonition:: Screenshot needed
	:class: screenshot-needed

	:Show: The update notice with its message, ``Umamo version is available.  You have version.``, and its three buttons, Open Download Page, Later, and Skip This Version.
	:Setup: Run an older build of Umamo while a newer release is published, and choose Help → Check for Updates….
	:Crop: The window and a little of the window behind it.
	:Save as: ``images/getting_started/update_notice.png``
	:Caption: The notice that a newer version is available.

Installing an Update
====================

Download the new version from the download page and install it over the old one in the same way as before.  See :doc:`/getting_started/installing`.  Your settings and puppet files are kept.  Close Umamo before installing.

Verify the download if you want to be sure of it.  See :doc:`/getting_started/verifying_downloads`.

Read the release notes before you update.  A new version may change a file format and an older version may not be able to open puppet files saved by a newer version.  See :doc:`/appendices/release_notes` and :doc:`/files/uma`.

Turning Off the Startup Check
=============================

Clear :guilabel:`Check for updates when Umamo starts` to turn off the startup check.  The setting is in Quick Setup and in the :guilabel:`Interface` category of :menuselection:`Edit --> Settings…`.  Umamo will then not use the network when it starts.  :menuselection:`Help --> Check for Updates…` still works whenever you choose it.

.. seealso::

	* :doc:`/getting_started/installing`
	* :doc:`/interface/settings`
	* :doc:`/interface/menus`
