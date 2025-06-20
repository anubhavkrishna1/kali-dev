# Kali-Installer Build-Scripts

_`simple-cdd` configuration for Kali ISO images._

These are the same [build-scripts](https://gitlab.com/kalilinux/build-scripts) that the [Kali team](https://www.kali.org/) uses to generate the official Kali Linux base images, found here: [kali.org/get-kali/](https://www.kali.org/get-kali/).

_Build your Kali Linux image today!_

- - -

These images offer customization during setup. For being able to live boot into Kali, from such a USB/CD/DVD/sdCard, see [kali-live](https://gitlab.com/kalilinux/build-scripts/kali-live).

- [kali-installer](https://gitlab.com/kalilinux/build-scripts/kali-installer) uses [Simple-CDD](https://wiki.debian.org/Simple-CDD) _(which is a wrapper for [debian-cd](https://wiki.debian.org/debian-cd))_
- [kali-live](https://gitlab.com/kalilinux/build-scripts/kali-live) uses [live-build](https://live-team.pages.debian.net/live-manual/html/live-manual/index.en.html)

- - -

## Help

```console
$ ./build.sh --help
Usage: ./build.sh [<option>...]

  --distribution <arg>
  --arch <arg>
  --verbose
  --debug
  --variant <arg>
  --version <arg>
  --subdir <arg>
  --get-image-path
  --no-clean
  --clean
  --help
$
```

## Install

On a Kali machine:

```console
$ sudo apt update
$ sudo apt install -y git simple-cdd debian-cd
$
$ git clone https://gitlab.com/kalilinux/build-scripts/kali-installer.git
$ cd kali-installer/
```

## Usage Examples

Build the default image, using the latest packages:

```console
$ ./build.sh
[...]
```

- - -

Manually define which Kali mirror to pull from, as well as be more detailed in output:

```console
$ echo "http://kali.download/kali" > .mirror
$
$ ./build.sh --verbose
[...]
```

- - -

Build a different installer image version (one which has every tool, or a network install):

```console
$ ./build.sh \
  --debug \
  --variant everything
[...]
$
$ ./build.sh \
  --debug \
  --variant netinst
[...]
$
```
