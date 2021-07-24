.. image:: https://img.shields.io/badge/STAR_Me_on_GitHub!--None.svg?style=social
    :target: https://github.com/MacHu-GWU/configirl-project


Why this Project
==============================================================================

This project helps developer to configure the Python Developer environment and tooling on MacOS, Redhat, Unbuntu, ... Greatly ease my life.


Why Not Ansible
------------------------------------------------------------------------------

First ansible is great. Ansible can setup mass amount of server very quick. However, there's a lots of technique overhead to make ansible works on a laptop. I want something can be used out-of-the-box

Shell scripts in this repo can be used manually in bash. But also be capable to use with ansible.


Usage
------------------------------------------------------------------------------

**Step 1, download the code**:

.. code-block:: bash

    curl -L https://github.com/MacHu-GWU/laptop/tarball/master | tar xz
    cd MacHu-GWU-laptop-${random_command_hash}

**Step 2, run setup scripts**:

If ``make`` command is available. Then you can just type ``make`` in your terminal, and call sub commands accordingly.

If ``make`` command is NOT available. Then you can manually do either one of (Depends on your OS):

.. code-block:: bash

    # For MacOS
    bash macos.sh

    # For Amazon Linux 2
    sudo bash amz-linux2.sh

    # For Redhat
    sudo bash redhat.sh

    # For Ubuntu
    sudo bash ubuntu.sh
