.. image:: https://circleci.com/gh/MacHu-GWU/laptop.svg?style=svg
    :target: https://circleci.com/gh/MacHu-GWU/laptop

.. image:: https://img.shields.io/badge/STAR_Me_on_GitHub!--None.svg?style=social
    :target: https://github.com/MacHu-GWU/configirl-project


What is laptop Project
==============================================================================

This project aims to ease my life with setup my **MacBook developer laptop** or **AWS EC2**.

- **Every bash scripts ends with** ``-lib.sh`` **means it should be sourced to use**.
- **Don't directly run bash scripts, call them from** ``make xxx`` command.


To Get Start
------------------------------------------------------------------------------

.. code-block:: bash

    $ git clone https://github.com/MacHu-GWU/laptop
    $ cd <path-to-laptop-directory>


Setup Python Development Environment on Mac
------------------------------------------------------------------------------

As a python developer on Mac, you need:

- `zsh + oh-my-zsh <https://ohmyz.sh/>`_: a fancy, friendly shell for developer
- `pyenv <https://github.com/pyenv/pyenv>`_: multiple python version and virtual environment management
- If you do a lots of AWS, you need `awscli <https://aws.amazon.com/cli/>`_:

Just run these commands, it set up everything for you::

    $ make
    $ make setup-mac-zsh-shell
    $ make setup-mac-python
    $ make setup-mac-aws


Setup Python Development Environment on Amazon Linux EC2
------------------------------------------------------------------------------

If you want to run python program, python web server, or perform deployment from Amazon Linux EC2 instance, you need:

- `pyenv <https://github.com/pyenv/pyenv>`_: multiple python version and virtual environment management
- python3.6 (install python3.6 on Linux is tricky!).

Just run these commands, it set up everything for you::

    $ make
    $ make setup-amazon-linux-for-python36
