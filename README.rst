What is laptop Project
==============================================================================

This project aims to ease my life with setup my **MacBook developer laptop** or **AWS EC2**.

- **Every bash scripts ends with** ``-lib.sh`` **means it should be sourced to use**.
- **Don't directly run bash scripts, call them from** ``make xxx`` command.

- Python tools
- Ruby tools
- AWS tools

Usage::

    $ cd <path-to-laptop-directory>
    $ make
    $ make setup-python
    $ make setup-ruby

**At the End, enter** ``$ bash`` **to reload up-to-date** ``~/.bash_profile`` or ``~/.bashrc`` **to your bash shell, so the setup can take effect!**

