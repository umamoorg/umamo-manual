*******************
Verifying Downloads
*******************

Every release of Umamo comes with ways to verify that the files you downloaded are the ones the project published and that they have not been modified.  Verifying a download is optional and is there for when you want to be sure.

Why Verify
==========

A file can be damaged by a bad download or in rare cases modified by a malicious actor.  Always verify that the downloads come from the web site, `<umamo.org>`__, or the GitHub project page `<https://github.com/umamoorg/umamo>`__.

There are three separate checks:

* The **checksums file**, ``SHA256SUMS.txt``, lists a checksum for every download.  A checksum is a short value calculated from the contents of a file and it changes if even a single bit of the file changes.  The checksums file is signed so that you can confirm the list is the project's own.
* The **build attestation** that GitHub records for each file states that it was built by the project's release process from the project's source code.
* The **signatures of the application and the package** on MacOS and Linux which the operating system checks for you.

Release Key Fingerprint
=======================

The signatures come from the Umamo release key.  Its fingerprint is:

.. code-block:: text

	67754C0DC58743270D574066F5499AE5C80A0F1C

The key itself is available on the `web site <https://umamo.org/keys/umamo-signing-key.asc>`__ and in the source code at ``app/desktop/packaging/umamo-signing-key.asc``.

Compare the fingerprint with the output from a verification tool, such as GnuPG.

Verifying the Checksums File
============================

You will need `GnuPG <https://gnupg.org>`__.  Download ``SHA256SUMS.txt`` and ``SHA256SUMS.txt.asc`` from the same release as your file and put them in the same folder.  Then import the key and check the signature:

.. code-block:: bash

	gpg --fetch-keys https://umamo.org/keys/umamo-signing-key.asc
	gpg --verify SHA256SUMS.txt.asc SHA256SUMS.txt

``gpg --verify`` will say ``Good signature`` and name the key that it checked.  Compare that key's fingerprint with the one above.  GnuPG will warn that the key is not certified with a trusted signature.  This is because you have not explicitly given trust to the key.

Now check your files against the list:

.. code-block:: bash

	sha256sum --check --ignore-missing SHA256SUMS.txt

It prints ``OK`` for each file in the list that is in the folder.  ``--ignore-missing`` skips any missing files.

On Windows, calculate the checksum yourself and compare it with the line for your file in ``SHA256SUMS.txt`` using PowerShell:

.. code-block:: text

	Get-FileHash -Algorithm SHA256 umamo-windows-x64-<version>.msi

Verifying Build Provenance
==========================

Every file of a published release has a build provenance attestation that is signed by GitHub.  It states which source code and which process built the file.  Check it with the `GitHub CLI <https://cli.github.com>`__:

.. code-block:: bash

	gh attestation verify <file> --repo umamoorg/umamo

A pass means the file was built by the release workflow of the ``umamoorg/umamo`` repository.  It does not say whether the code itself is trustworthy, but only where the file came from.

What Is Signed
==============

.. list-table::
	:header-rows: 1

	* - File
	  - Signed with
	  - Checked by
	* - ``SHA256SUMS.txt``
	  - The release key, in ``SHA256SUMS.txt.asc``
	  - You, with GnuPG.  The file lists every checksum for all downloads.
	* - The ``.rpm``
	  - The release key.
	  - ``dnf`` and ``rpm``, once you import the key.  See :doc:`/getting_started/installing`.
	* - The macOS ``.dmg`` and ``Umamo.app``
	  - Apple's Developer ID and notarized by Apple.
	  - MacOS, when you open it.
	* - The Windows ``.msi`` and ``Umamo.exe``
	  - Not signed yet.
	  - SmartScreen shows ``Windows protected your PC``.  Verify the checksum instead.
	* - Every file of a published release.
	  - A GitHub build attestation.
	  - You, with ``gh attestation verify``.

Since Umamo never updates itself you can verify that the install is a file that you downloaded.  See :doc:`/getting_started/updating`.

.. seealso::

	* :doc:`/getting_started/installing`
	* :doc:`/troubleshooting/platform_notes`
