#!/bin/sh -x
git clone https://git.savannah.gnu.org/git/emacs.git
git checkout -b native-comp origin/feature/native-comp

sudo apt-get install autoconf make makeinfo libgccjit libgccjit-10-dev libjansson4 libjansson-dev texinfo libx11-dev libxpm-dev libjpeg-dev libpng-dev libgif-dev libtiff-dev libgtk2.0-dev libncurses-dev libxpm-dev automake gnutls-cli gnutls gnutls-bin libgnutls30 libgnutls28-dev libgtk-3-dev

./autogen.sh && ./configure --with-nativecomp --with-mailutils --with-libxft --with-modules
