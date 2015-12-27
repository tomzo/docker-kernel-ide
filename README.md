# Build Linux kernel in docker

This Debian image has enough tools to build Linux kernel deb packages.

## Building from local sources

`cd` to directory with kernel sources.

### Configure

If you have existing kernel configuration to use then copy it to `.config` file.
E.g.
```
cp /boot/config-3.16.0-30-generic .config
```

Then run `make oldconfig` to fill missing options.
```
docker run -ti --rm --volume=`pwd`:/ide/work tomzo/kernel-ide
```
In the container
```
cd linux
make oldconfig
```

You can also customize config some more by running `make menuconfig`

### Build

Use `CONCURRENCY_LEVEL` variable to speed up build if you have spare CPU cores.

```
docker run -ti --volume=`pwd`:/ide/work -e CONCURRENCY_LEVEL=9 tomzo/kernel-ide fakeroot make-kpkg --initrd kernel_image kernel_headers --revision=1.0.mykernel
```
