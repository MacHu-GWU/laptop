#!/usr/bin/python3
# -*- coding: utf-8 -*-

import os
import platform
import subprocess
from pathlib import Path
from typing import Optional

# ------------------------------------------------------------------------------
# Detect OS
# ------------------------------------------------------------------------------
_STEP_1_DETECT_OS = None

IS_WINDOWS = False
IS_MACOS = False
IS_LINUX = False

IS_AMZ_LINUX = False
IS_CENTOS = False
IS_REDHAT = False
IS_FEDORA = False
IS_UBUNTU = False
IS_DEBIAN = False

OS_NAME = None


class OSEnum:
    WINDOWS = "Windows"
    MACOS = "MacOS"
    AMAZON_LINUX = "Amazon Linux"
    CENTOS = "CentOS"
    REDHAT = "Redhat"
    FEDORA = "Fedora"
    UBUNTU = "Ubuntu"
    DEBIAN = "Debian"


def parse_etc_os_release():
    """
    Parse key value pair from the /etc/os-release file.

    This function only work on Linux:

    Ref:

    - https://man7.org/linux/man-pages/man5/os-release.5.html#:~:text=The%20%2Fetc%2Fos%2Drelease,like%20shell%2Dcompatible%20variable%20assignments.

    :rtype: dict
    """
    with open("/etc/os-release", "rb") as f:
        content = f.read().decode("utf-8")
        data = dict()
        for line in content.strip().split("\n"):
            key, value = line.strip().split("=", 1)
            value = value[1:-1]
            data[key] = value
    return data


print(f"Try to detect Operation System (OS) ...")

unable_to_detect_os_error = NotImplementedError("Unable to detect OS!")

platform_system = platform.system()
if platform_system == "Windows":
    IS_WINDOWS = True
    OS_NAME = OSEnum.WINDOWS
elif platform_system == "Darwin":
    IS_MACOS = True
    OS_NAME = OSEnum.MACOS
elif platform_system == "Linux":
    IS_LINUX = True
    if os.path.exists("/etc/os-release"):
        data = parse_etc_os_release()
        if data["ID"] == "amzn":
            IS_AMZ_LINUX = True
            OS_NAME = OSEnum.AMAZON_LINUX
        elif data["ID"] == "centos":
            IS_CENTOS = True
            OS_NAME = OSEnum.CENTOS
        elif data["ID"] == "rhel":
            IS_REDHAT = True
            OS_NAME = OSEnum.REDHAT
        elif data["ID"] == "fedora":
            IS_FEDORA = True
            OS_NAME = OSEnum.FEDORA
        elif data["ID"] == "ubuntu":
            IS_UBUNTU = True
            OS_NAME = OSEnum.UBUNTU
        elif data["ID"] == "debian":
            IS_DEBIAN = True
            OS_NAME = OSEnum.DEBIAN
        else:
            raise unable_to_detect_os_error
    else:
        raise unable_to_detect_os_error
else:
    raise unable_to_detect_os_error
print(f"  current OS is {OS_NAME!r}")

# ------------------------------------------------------------------------------
# Install zsh and oh-my-zsh
# ------------------------------------------------------------------------------
dir_home = Path.home()
dir_github = dir_home / "Documents" / "GitHub"
dir_oh_my_zsh = dir_home / ".oh-my-zsh"

if not dir_github.exists():
    dir_github.mkdir(parents=True)


def run_cmd(cmd: str) -> subprocess.CompletedProcess:
    """
    Run this command as it is without any pre / post processing.
    """
    return subprocess.run(
        [cmd, ],
        shell=True,
    )


def which_command(cmd: str) -> Optional[str]:
    """
    Run ``which ${cmd}`` command, find if a command is installed or not.
    """
    res = subprocess.run(["which", cmd], capture_output=True)
    if res.returncode == 0:
        return res.stdout.decode("utf-8").strip()
    else:
        return None


def _install_zsh():
    """
    Install z Shell based on OS. Execute the real installation logic.

    Ref:

    - https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH
    """
    if (
        IS_AMZ_LINUX or IS_CENTOS or IS_REDHAT
    ):
        run_cmd("sudo yum -y update && sudo yum -y install zsh")
    elif IS_FEDORA:
        run_cmd("dnf install zsh")
    elif (
        IS_UBUNTU or IS_DEBIAN
    ):
        run_cmd("apt install zsh")
    subprocess.run(["zsh", "--version"])


def install_zsh():
    """
    High level wrapper around _install_zsh()
    """
    print("try to install zsh ...")
    bin_zsh = which_command("zsh")

    if bin_zsh is None:
        print("  zsh command not found, install it")
        _install_zsh()
        print("  succesfully installed zsh!")

    else:
        print(f"  zsh already installed at {bin_zsh}")

        res = subprocess.run(["zsh", "--version"], capture_output=True, check=True)
        zsh_ver = res.stdout.decode("utf-8").split(" ")[1]
        zsh_ver_major = int(zsh_ver.split(".")[0])
        zsh_ver_minor = int(zsh_ver.split(".")[1])
        if not (zsh_ver_major >= 5 and zsh_ver_minor >= 1):
            raise NotImplementedError(
                f"oh-my-zsh only work with zsh >= 5.0.8, "
                f"but your version is {zsh_ver}"
            )


install_zsh()


def install_oh_my_zsh():
    print("try to install oh-my-zsh ...")
    if dir_oh_my_zsh.exists():
        print("  oh-my-zsh already installed")
    else:
        print(f"  {dir_oh_my_zsh!r} not found, start install")
        subprocess.run(
            [
                "sh",
                "-c",
                subprocess.run(
                    [
                        "curl", "-fsSL", "https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh",
                    ],
                    capture_output=True,
                    check=True,
                ).stdout.decode("utf-8"),
            ],
            check=True,
        )
        print("  success fully installed oh-my-zsh!")


install_oh_my_zsh()


# ------------------------------------------------------------------------------
# Install zsh plugins
# ------------------------------------------------------------------------------
def install_zsh_syntax_highlighting():
    print("try to install zsh-syntax-highlighting plugin ...")
    dir_repo_zsh_syntax_highlighting = dir_github / "zsh-syntax-highlighting"
    if not dir_repo_zsh_syntax_highlighting.exists():
        subprocess.run(
            [
                "git", "clone", "--depth", "1",
                "https://github.com/zsh-users/zsh-syntax-highlighting.git", f"{dir_repo_zsh_syntax_highlighting}"
            ],
            check=True,
        )
    else:
        print("  already installed")


install_zsh_syntax_highlighting()


def install_zsh_autocomplete():
    print("try to install zsh-autocomplete plugin ...")
    dir_repo_zsh_autocomplete = dir_github / "zsh-autocomplete"
    if not dir_repo_zsh_autocomplete.exists():
        subprocess.run(
            [
                "git", "clone", "--depth", "1",
                "https://github.com/marlonrichert/zsh-autocomplete.git", f"{dir_repo_zsh_autocomplete}"
            ],
            check=True,
        )
    else:
        print("  already installed")


install_zsh_autocomplete()


def install_zsh_autosuggestions():
    print("try to install zsh-autosuggestions plugin ...")
    dir_repo_zsh_autosuggestions = dir_github / "zsh-autosuggestions"
    if not dir_repo_zsh_autosuggestions.exists():
        subprocess.run(
            [
                "git", "clone", "--depth", "1",
                "https://github.com/zsh-users/zsh-autosuggestions.git", f"{dir_repo_zsh_autosuggestions}"
            ],
            check=True,
        )
    else:
        print("  already installed")


install_zsh_autosuggestions()


def install_zsh_powerlevel10k():
    print("try to install powerlevel10k theme ...")
    dir_repo_zsh_powerlevel10k = dir_oh_my_zsh / "custom" / "themes" / "powerlevel10k"
    if not dir_repo_zsh_powerlevel10k.exists():
        subprocess.run(
            [
                "git", "clone", "--depth", "1",
                "https://github.com/romkatv/powerlevel10k.git", f"{dir_repo_zsh_powerlevel10k}"
            ],
            check=True,
        )
    else:
        print("  already installed")


install_zsh_powerlevel10k()
