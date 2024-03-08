# Shell helpers collection

This repository contains several bash scripts and release procedure to distribute them as deb package or simply as TAR archive.

## Overview

- Script files are located in the folder `./package/usr/local/bin`.
- Debian package file descriptor is located in `./package/DEBIAN/control`.
- Debian package and tar archive creation are describe in `Makefile`.
- RPM package is converted from the debian one using [alien](https://wiki.debian.org/Alien).
- A list of commands can be found herein the file [COMMANDS.md](./COMMANDS.md).

## Install

### Ubuntu

Download the debian package "shell-helpers.deb" from latest release and install it:
```bash
curl -s -o /tmp/shell-helpers.deb https://github.com/daaru00/shell-helpers/releases/download/latest/shell-helpers.deb
sudo dpkg -i /tmp/shell-helpers.deb
rm /tmp/shell-helpers.deb
```

### CentOS

Download the RPM package "shell-helpers.rpm" from latest release and install it:
```bash
curl -s -o /tmp/shell-helpers.rpm https://github.com/daaru00/shell-helpers/releases/download/latest/shell-helpers.rpm
sudo rpm -i /tmp/shell-helpers.rpm
rm /tmp/shell-helpers.rpm
```

### Unix-like OS

Download the TGZ archive "shell-helpers.tgz" from latest release and extract scripts: 
```bash
curl -s -o /tmp/shell-helpers.tgz https://github.com/daaru00/shell-helpers/releases/download/latest/shell-helpers.tgz
sudo tar -xvzf ./dist/shell-helpers.tar -C /usr/local/bin
rm /tmp/shell-helpers.tgz
```

## Development

When creating or editing a script, take the [Command Line Interface Guidelines](https://clig.dev/) into consideration.

### Build

Build debian package:
```bash
make build
```
Produce file `./dist/shell-helpers.deb`, `./dist/shell-helpers.rpm` and `./dist/shell-helpers.tgz`.

### Install

Install built debian package:
```bash
make install
```

### Delete

Remove installed debian package:
```bash
make remove
```

## Commands Documentation

Execute the make command "doc":
```bash
make doc
```
Will execute all commands inside `./package/usr/local/bin` with the argument '-h'. 
The command's help output will be elaborated end saved into [COMMANDS.md](./COMMANDS.md).

## New Releases

Create a new local tag:
```bash
git tag 1.2.3
```

Push the newly created tag to the remote:
```bash
git push --tags
```

Or... with a single shell helper command:
```bash
git-tag-push 1.2.3
```

A GitHub Action will automatically run executing the following operations: 
  - update debian control file with correct version (the pushed tag)
  - build debian package and TAR archive
  - create a new release and upload all packages into it
