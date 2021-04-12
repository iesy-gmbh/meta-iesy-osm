# meta-iesy-osm

Yocto BSP Layer providing support for iesy OSM hardware.  
Currently supported are:

| OSM module | Evaluation Kit |
| ------ | ------ |
| iesy i.MX8M OSM-SF | [iesy i.MX8M EVA-MI](#iesy-iMX8M-EVA-MI) Eval Kit |

### Dependencies

This BSP Layer depends on:

* [FSL Community BSP](https://github.com/Freescale/fsl-community-bsp-platform)  

## Getting Started

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

### Building Yocto

Build instructions are listed below. The build process varies depending on the hardware.  
Select your hardware from the table at the top for which you want to build.

## iesy i.MX8M EVA-MI

### Prerequisites

To build images for iesy i.MX8M EVA-MI Evaluation Kit you need the following Yocto Layers:
* meta-freescale
* meta-freescale-3rdparty
* meta-freescale-distro
* meta-iesy-osm
* meta-openembedded
* poky

You can choose between different Releases of the Yocto Project.  
Here you can get an overview, which Releases are currently supported by meta-iesy-osm: [https://github.com/iesy-gmbh/meta-iesy-osm/branches/all](https://github.com/iesy-gmbh/meta-iesy-osm/branches/all)

In the following example version **dunfell** is used. If you want to use another Release instead, you need to replace "dunfell" with one of the other supported Releases in the commands below.

First install the repo utility to get the FSL Community BSP:
```
$ mkdir ~/bin
$ curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
$ chmod a+x ~/bin/repo
$ PATH=${PATH}:~/bin
```
Create your project directory and download FSL Community BSP sources:
```
$ mkdir imx-yocto-bsp
$ cd imx-yocto-bsp
$ repo init -u https://github.com/Freescale/fsl-community-bsp-platform -b dunfell
$ repo sync
```
Finally, the meta-iesy-osm Layer needs to be added:
```
$ git clone https://github.com/iesy-gmbh/meta-iesy-osm -b dunfell sources/meta-iesy-osm
```

### Build Process

There are 3 different configurations available:

| Distro | Image | Description |  Details |
| ------ | ------ | ------ | ------ |
| iesy-fb | iesy-base-image | Minimal console-only (Framebuffer) | SysVinit; BusyBox; mdev; ash |
| iesy-wayland | iesy-base-image | Supporting Wayland and XWayland | Systemd; Weston; udev; bash; weston-terminal |
| iesy-x11 | iesy-base-image | Native X11 support | SysVinit; Openbox; udev; bash; xterm |

In this example we are building sample image ***iesy-base-image*** using distro ***iesy-wayland***.  
Alternatively, you can use the distributions and images provided by Poky or refer to the resources provided in the FSL Community BSP.  

To retrieve a list of all available distros and images run the following commands:
```
$ printf "%s\n" sources/meta-*/conf/distro/*.conf sources/poky/meta-*/conf/distro/*.conf | awk -F/ '{print $NF}' | sed -e 's/\.conf$//'
```
```
$ printf "%s\n" sources/meta*/recipes*/images/*.bb sources/poky/meta*/recipes*/images/*.bb | awk -F/ '{print $NF}' | sed -e 's/\.bb$//'
```
Of course you can also build you own distro or image.

#### Start Building

Setup your Build Environment running *setup-environment* script provided via FSL Community BSP:
```
$ MACHINE=iesy-imx8m-eva-mi DISTRO=iesy-wayland source setup-environment build_iesy-wayland
```

When running for the first time, you will be notified about the NXP EULA. To use i.MX Proprietary software it is necessary to agree to these conditions. For more information about this, please read [here](http://freescale.github.io/doc/release-notes/current/#license).  

Running *setup-environment* for the first time will create a new build directory.  
If *setup-environment* has already been run previously for that particular build directory, it only prepares the environment, but leaves configuration untouched. For more details on this see [here](https://github.com/Freescale/fsl-community-bsp-base/blob/5a551f453260bd19895e4d847877874eaa51fde3/setup-environment#L36).  
**You can manually change that build configuration later by editing local.conf in your build directory.**

Also make sure to add meta-iesy-osm to your bblayers.conf.  
<ins>Note</ins>: This only needs to be done for the first time when a new build directory is created.
```
$ bitbake-layers add-layer ../sources/meta-iesy-osm
```  

Once you have set up the Environment, build your image:
```
$ bitbake iesy-base-image
```

### Build Results

### Install Image
