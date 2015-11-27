FROM debian:jessie

RUN apt-get update && apt-get install -y git fakeroot build-essential ncurses-dev xz-utils kernel-package
