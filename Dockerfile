FROM debian:jessie

RUN apt-get update && apt-get install -y git fakeroot build-essential ncurses-dev xz-utils cpio
RUN apt-get -y --no-install-recommends install kernel-package
