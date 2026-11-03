*******************
Verifying Downloads
*******************

Every release of Umamo comes with ways to check that the files you downloaded are the ones the project published, and that nobody changed them on the way.  None of this is needed to use Umamo.  It is there for when you want to be sure.

Why Verify
==========

A file can be damaged by a bad download, or replaced by someone who gets between you and the server.  Windows builds are not signed yet, so Windows cannot tell you where an installer came from.  The checks on this page can.

There are three, and each is separate:

* The **checksums file**, ``SHA256SUMS.txt``, lists a checksum for every download.  A checksum is a short number worked out from the contents of a file, and it changes if the file changes by even a bit.  The file is signed, so that you know the list is the project's own.
* The **build attestation** that GitHub records for each file says that it was built by the project's release process, from the project's source code.
* The **signatures of the application and the package** on macOS and Linux, which the operating system checks for you.

Release Key Fingerprint
=======================

The signatures come from the Umamo release key.  Its fingerprint is:

.. code-block:: text

	67754C0DC58743270D574066F5499AE5C80A0F1C

It is written in groups of four as ``6775 4C0D C587 4327 0D57 4066 F549 9AE5 C80A 0F1C`` on the web site.  The key itself is on the `web site <https://umamo.org/keys/umamo-signing-key.asc>`__, and in the source code at ``app/desktop/packaging/umamo-signing-key.asc``.

Compare the fingerprint that a tool shows you with this one, and with the one on the web site.  A key is only worth trusting if its fingerprint is the same in every place you look.

Verifying the Checksums File
============================

You need `GnuPG <https://gnupg.org>`__.  Download ``SHA256SUMS.txt`` and ``SHA256SUMS.txt.asc`` from the same release as your file, and put them in the same folder.  Then import the key and check the signature:

.. code-block:: bash

	gpg --fetch-keys https://umamo.org/keys/umamo-signing-key.asc
	gpg --verify SHA256SUMS.txt.asc SHA256SUMS.txt

``gpg --verify`` says ``Good signature`` and names the key that it checked.  Compare that key's fingerprint with the one above.  GnuPG also warns that the key is not certified with a trusted signature.  That is normal, because you have not told it that you trust the key, and it is why the comparison matters.

Now check your files against the list:

.. code-block:: bash

	sha256sum --check --ignore-missing SHA256SUMS.txt

It prints ``OK`` for each file of the list that is in the folder, and ``--ignore-missing`` skips the files you did not download.

On Windows, work out the checksum yourself and compare it with the line for your file in ``SHA256SUMS.txt``:

.. code-block:: text

	Get-FileHash -Algorithm SHA256 umamo-windows-x64-<version>.msi

Verifying Build Provenance
==========================

Every file of a published release has a build provenance attestation, which GitHub signs.  It says which source code and which process built the file.  Check it with the `GitHub CLI <https://cli.github.com>`__:

.. code-block:: bash

	gh attestation verify <file> --repo umamoorg/umamo

A pass means the file was built by the release workflow of the ``umamoorg/umamo`` repository.  It does not say anything about whether the code is good, only where the file came from.

What Is Signed
==============

.. list-table::
	:header-rows: 1

	* - File
	  - Signed with
	  - Checked by
	* - ``SHA256SUMS.txt``
	  - The release key, in ``SHA256SUMS.txt.asc``
	  - You, with GnuPG.  It lists every download, so it also covers the ones that have no signature of their own: the ``.deb``, the ``.jar`` files, and the archives.
	* - The ``.rpm``
	  - The release key
	  - ``dnf`` and ``rpm``, once you import the key.  See :doc:`/getting_started/installing`.
	* - The macOS ``.dmg`` and ``Umamo.app``
	  - Apple's Developer ID, and notarized by Apple
	  - macOS, when you open it.
	* - The Windows ``.msi`` and ``Umamo.exe``
	  - Nothing yet
	  - SmartScreen shows ``Windows protected your PC``.  Verify the checksum instead.
	* - Every file of a published release
	  - A GitHub build attestation
	  - You, with ``gh attestation verify``.

Umamo never updates itself, so what you install is always a file that you downloaded and can check.  See :doc:`/getting_started/updating`.

.. seealso::

	* :doc:`/getting_started/installing`
	* :doc:`/troubleshooting/platform_notes`
