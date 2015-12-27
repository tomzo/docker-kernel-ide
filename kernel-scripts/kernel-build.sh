#!/bin/bash

kernel-checkout

cd /ide/work/linux

make-kpkg --initrd kernel_image kernel_headers
