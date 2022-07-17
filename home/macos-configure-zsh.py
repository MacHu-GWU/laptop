#!/usr/bin/python3
# -*- coding: utf-8 -*-

import platform
import subprocess
from pathlib import Path

IS_MACOS = False
IS_LINUX = False

platform_system = platform.system()
if platform_system == "Darwin":
    IS_MACOS = True
elif platform == "Linux":
    IS_LINUX = True
else:
    raise NotImplementedError

dir_home = Path.home()
dir_github = dir_home / "Documents" / "GitHub"
dir_oh_my_zsh = dir_home / ".oh-my-zsh"

if not dir_github.exists():
    dir_github.mkdir(parents=True)


def run_cmd(cmd: str) -> subprocess.CompletedProcess:
    return subprocess.run([cmd, ], shell=True)

if not dir_oh_my_zsh.exists():
    run_cmd('sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"')


dir_repo_zsh_syntax_highlighting = dir_github / "zsh-syntax-highlighting"
if not dir_repo_zsh_syntax_highlighting.exists():
    run_cmd(f"git clone https://github.com/zsh-users/zsh-syntax-highlighting.git {dir_repo_zsh_syntax_highlighting}")


dir_repo_zsh_autocomplete = dir_github / "zsh-autocomplete"
if not dir_repo_zsh_autocomplete.exists():
    run_cmd(f"git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git {dir_repo_zsh_autocomplete}")


dir_repo_zsh_autosuggestions = dir_github / "zsh-autosuggestions"
if not dir_repo_zsh_autosuggestions.exists():
    run_cmd(f"git clone https://github.com/zsh-users/zsh-autosuggestions.git {dir_repo_zsh_autosuggestions}")
