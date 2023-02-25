# Shell helpers collection

This repository contains several bash scripts and release procedure to distribute them as deb package or simply as TAR archive.

## Overview

Script files are located in the folder `./package/usr/local/bin`.
Debian package file descriptor is located in `./package/DEBIAN/control`.
Debian package and tar archive creation are describe in `Makefile`.

## Install

### Ubuntu

Download the debian package "shell-helpers.deb" from latest release and install it:
```bash
curl -s -o /tmp/shell-helpers.deb https://github.com/daaru00/shell-helpers/releases/download/latest/shell-helpers.deb
sudo dpkg -i /tmp/shell-helpers.deb
rm /tmp/shell-helpers.deb
```

### Unix-like OS

Download the TAR archive from 
```bash
curl -s -o /tmp/shell-helpers.tar https://github.com/daaru00/shell-helpers/releases/download/latest/shell-helpers.tar
sudo tar -xf ./dist/shell-helpers.tar -C /usr/local/bin
rm /tmp/shell-helpers.tar
```

## Usage

### Build

Build debian package:
```bash
make build
```
Produce file `./dist/shell-helpers.deb`.

Build a TAR archive:
```bash
make pack
```
Produce file `./dist/shell-helpers.tar`.

### Install

Unpack TAR archive into `/usr/local/bin`:
```bash
make unpack
```
This operation is irreversible, file cannot be automatically deleted later

Install built debian package:
```bash
make install
```

### Delete

Remove installed debian package:
```bash
make remove
```

## New Releases

Create a new local tag:
```bash
git tag 1.2.3
```

Push the newly created tag to the remote:
```bash
git push --tags
```

A GitHub Action will automatically run executing the following operations: 
  - update debian control file with correct version (the pushed tag)
  - build debian package and TAR archive
  - create a new release and upload all packages into it
