# meta-iesy-osm

Yocto BSP Layer providing support for iesy OSM hardware.  
Supported configurations are:

| Machine | OSM module | Evaluation Kit |
| ------ | ------ | ------ |
| iesy-imx8mm-eva-mi | iesy i.MX8M Mini OSM-SF | iesy i.MX8M EVA-MI |
| iesy-rpx30-eva-mi | iesy RPX30 OSM-SF | iesy RPX30 EVA-MI |

### Dependencies

This BSP Layer depends on:

* [FSL Community BSP](https://github.com/Freescale/fsl-community-bsp-platform)
* [Rockchip Yocto BSP](https://github.com/rockchip-linux/manifests/tree/yocto-next)  

## Prerequisites

### Setup your Build Host

Make sure using one of the supported Linux distributions, which are listed [here](https://www.yoctoproject.org/docs/current/ref-manual/ref-manual.html#detailed-supported-distros).  
Also install the required packages for the Build Host.
On a headless Debian / Ubuntu the following packages are essential:
```
$ sudo apt-get install gawk wget git-core diffstat unzip texinfo gcc-multilib \
build-essential chrpath socat cpio python3 python3-pip python3-pexpect \
xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev \
pylint3 xterm
```
For other distributions please refer to [this](https://www.yoctoproject.org/docs/current/ref-manual/ref-manual.html#required-packages-for-the-build-host).

**Make sure that at least 50 GB (better 100 GB) of free disk space is available.**

## Getting Started

You can choose between different Releases of the Yocto Project.  
Here you can get an overview, which Releases are currently supported: [https://github.com/iesy-gmbh/meta-iesy-osm/branches/all](https://github.com/iesy-gmbh/meta-iesy-osm/branches/all)

In this example `dunfell` is used. If you want to use another Release instead, you need to replace _dunfell_ with one of the other supported Releases in the commands below.

Install the `repo` utility:
```
$ mkdir ~/bin
$ curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
$ chmod a+x ~/bin/repo
$ PATH=${PATH}:~/bin
```
Create your Build Directory and download the BSP:
#### For iesy i.MX8M (all):
```
$ mkdir imx-yocto-bsp
$ cd imx-yocto-bsp
$ repo init -u https://github.com/iesy-gmbh/yocto-bsp-manifest -b dunfell -m iesy-osm-imx8m.xml
$ repo sync
```  
#### For iesy RPX30:
```
$ mkdir rk-yocto-bsp
$ cd rk-yocto-bsp
$ repo init -u https://github.com/iesy-gmbh/yocto-bsp-manifest -b dunfell -m iesy-osm-rpx30.xml
$ repo sync
```

## Building Yocto

There are 3 predefined configurations available:

| Distro | Image | Description |  Details |
| ------ | ------ | ------ | ------ |
| iesy-fb | iesy-base-image | Minimal console-only (Framebuffer) | BusyBox; mdev; ash |
| iesy-wayland | iesy-base-image | Supporting Wayland and XWayland | Systemd; udev; bash; Weston |
| iesy-x11 | iesy-base-image | Native X11 support | SysVinit; udev; bash; Openbox; xterm |

Alternatively, you can use the distributions and images provided by Poky or refer to the resources provided in the other BSP Layers.  

To retrieve a full list of all available distros and images run the following commands:
```
$ printf "%s\n" sources/meta-*/conf/distro/*.conf sources/poky/meta-*/conf/distro/*.conf | awk -F/ '{print $NF}' | sed -e 's/\.conf$//'
```
```
$ printf "%s\n" sources/meta*/recipes*/images/*.bb sources/poky/meta*/recipes*/images/*.bb | awk -F/ '{print $NF}' | sed -e 's/\.bb$//'
```
Of course you can also build you own distro or image.

### Build Process

In this example we are building the image `iesy-base-image` using distro `iesy-wayland`.  
First we need to configure our Build Environment. This needs to be done whenever a new session is started.

#### For iesy i.MX8M (all):

Setup your Build Environment running `setup-environment` script.  
Set MACHINE variable according to the values from the above [table](#meta-iesy-osm):

```
$ MACHINE=iesy-imx8mm-eva-mi DISTRO=iesy-wayland source setup-environment build_iesy-wayland
```

When running for the very first time, you might be notified about the NXP EULA. To use i.MX Proprietary software it is necessary to agree to these conditions. For more information about this, please read [here](http://freescale.github.io/doc/release-notes/current/#license).

Running `setup-environment` for the first time will create a new Build Directory. If that has already been run previously for that particular Build Directory, it only prepares the environment, but leaves configuration untouched.  
You can manually change that build configuration later by editing `local.conf`.

Make sure to add meta-iesy-osm to your `bblayers.conf`.  
<ins>Note</ins>: This only needs to be done for the first time when a new Build Directory is created.
```
$ bitbake-layers add-layer ../sources/meta-iesy-osm
```

#### For iesy RPX30:

Setup your Build Environment running `oe-init-build-env` script. 

```
$ source oe-init-build-env build_iesy-wayland
```

When running for the first time (new Build Directory is created), make sure to add all necessary Layers to your `bblayers.conf`. The simplest way would be to just use the predefined template file:

```
$ cp ../sources/meta-iesy-osm/conf/bblayers.conf.rpx30 conf/bblayers.conf
```

Set MACHINE and DISTRO variables in your `local.conf`:

```
sed -i 's/\(MACHINE ??= \)\(.*\)/\1"iesy-rpx30-eva-mi"/' conf/local.conf
sed -i 's/\(DISTRO ?= \)\(.*\)/\1"iesy-wayland"/' conf/local.conf
```

<ins>Note</ins>: This only needs to be done for the first time when a new Build Directory is created.  
You can also manually change that configuration later by editing `local.conf`.

### Start Building

Once you have set up the Environment, build your image:
```
$ bitbake iesy-base-image
```

### Build Results

Build output is located in **`build_iesy-wayland/tmp/deploy/images/`**...

##### `/iesy-imx8mm-eva-mi`:

| File | Description |
| ------ | ------ |
| iesy-base-image-iesy-imx8mm-eva-mi.wic.gz | Full Image |
| u-boot-spl.bin-iesy-imx8mm-eva-mi | U-Boot SPL |
| u-boot-iesy-imx8mm-eva-mi.bin | U-Boot |
| Image-iesy-imx8mm-eva-mi.bin | Kernel Image |

##### `/iesy-rpx30-eva-mi`:

| File | Description |
| ------ | ------ |
| iesy-base-image-iesy-rpx30-eva-mi.wic | Full Image |
| idblock.img | Pre-Bootloader (IDBLoader) |
| uboot.img | U-Boot |
| trust.img | Trust |
| boot.img | Kernel / DTB |
| rootfs.img | rootfs |

For a more detailed description of these resources and boot mechanism on Rockchip SoC take a look at http://opensource.rock-chips.com/wiki_Boot_option

### Install Image

#### For iesy i.MX8M Mini:

##### Flash image to SD card:
```
$ cd tmp/deploy/images/iesy-imx8mm-eva-mi
```
```
$ gunzip -c iesy-base-image-iesy-imx8mm-eva-mi.wic.gz | sudo dd of=/dev/sdX bs=1M status=progress conv=fsync
```
(Replace `/dev/sdX` with the actual device name of your SD card)

#### For iesy RPX30:

##### Flash image to eMMC:
We are using [Linux Upgrade Tool](https://github.com/rockchip-linux/tools/tree/master/linux/Linux_Upgrade_Tool) provided by Rockchip. Alternatively you can use one of the other tools mentioned [here](http://opensource.rock-chips.com/wiki_Tools).

Make sure to put the Board into [Maskrom Mode](http://opensource.rock-chips.com/wiki_Rockusb) first. Then run `upgrade_tool` to flash the image.
```
$ cd tmp/deploy/images/iesy-rpx30-eva-mi
```
```
$ ./upgrade_tool ef loader.bin
$ ./upgrade_tool db loader.bin
$ ./upgrade_tool wl 0 iesy-base-image-iesy-rpx30-eva-mi.wic
```
