# Chromium OS Installer for Linux
By **EmoticonYT**

An automated Bash script to download and configure Chromium OS on Linux.

> [!WARNING]
> This script will only properly launch Chromium OS on x64 Linux! This will not work on arm64 Linux, or macOS.

## Installation

Run this command to install:

```bash
cd /tmp && mkdir -p chromiumosinstallation && cd chromiumosinstallation && curl -LO https://raw.githubusercontent.com/EmoticonYT/chromiumos-on-linux/refs/heads/main/install.sh && bash install.sh && rm -rf install.sh
