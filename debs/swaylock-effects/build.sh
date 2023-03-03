#!/bin/sh

apt-get install -y \
    libcairo2-dev \
    libgdk-pixbuf2.0-dev \
    libomp-dev \
    libpam0g-dev \
    libwayland-dev \
    libxkbcommon-dev \
    scdoc \
    wayland-protocols
if [ ! -d swaylock-effects-1.6-4 ]; then
    if [ ! -f swaylock-effects-1.6-4.tar.gz ]; then
        curl -L -o swaylock-effects-1.6-4.tar.gz https://github.com/mortie/swaylock-effects/archive/refs/tags/v1.6-4.tar.gz
    fi
    tar -xzvf swaylock-effects-1.6-4.tar.gz
fi
cd swaylock-effects-1.6-4
meson build
chmod a+s build/swaylock
ninja -C build install
cd build
cat <<EOF > Makefile
.PHONY: install
install:
	@cd .. && ninja -C build install
EOF
(echo; echo "swaylock-effects - A fancier screen locker for Wayland"; echo) | checkinstall -t debian --pkgname=swaylock-effects
