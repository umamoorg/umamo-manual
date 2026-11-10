**************
Updating Umamo
**************

Umamo will tell you when a newer version is available, but does not download or install a new version by itself.  A link to the download page will be provided to obtain a new version.

Checking for Updates
====================

:menuselection:`Help --> Check for Updates…` checks immediately and always shows a result:

* If a newer version is available, a window will tell you and offer to take you to the download page.
* If you have the latest version, it will say ``You have the latest version of Umamo`` along with the version number.
* If no release has been published yet, it will say ``No release of Umamo has been published yet.``
* If it could not check, it will say ``Could not check for updates`` and give the reason.  For example, there is no network connection.

Only full releases are considered.  Drafts and releases that are marked as a preview are ignored.

The update check checks the GitHub releases for the latest release of the project and reads its version.  It does not send any information about you, your puppet files, and does not collect any sort of analytics.  The request includes the version of Umamo being checked against and update checks are the only time that Umamo accesses the network.

You can see your version of Umamo in :menuselection:`Help --> About Umamo…`.

Installing an Update
====================

Download the new version from the download page and install it over the old one in the same way as before.  See :doc:`/getting_started/installing`.  Your settings and puppet files are left untouched.  You should close any open Umamo windows before installing or updating.

Verify the download if you want to verify the origin of the files.  See :doc:`/getting_started/verifying_downloads`.

The release notes contain all the changes since the last release.  Since Umamo is in development preview we recommend checking the release notes before every update to see if there are any breaking changes.  See :doc:`/appendices/release_notes` and :doc:`/files/uma`.

Turning Off the Startup Check
=============================

Clear the :guilabel:`Check for updates when Umamo starts` checkbox to turn off update checking.  The setting is in Quick Setup and in the :guilabel:`Interface` category of :menuselection:`Edit --> Settings…`.

.. seealso::

	* :doc:`/getting_started/installing`
	* :doc:`/interface/settings`
	* :doc:`/interface/menus`
