#!/bin/sh

apt-get install -y \
    libadwaitaqt-dev \
    libc6-dev \
    libgtk-3-dev \
    libqt5waylandclient5-dev \
    qt5-style-plugins \
    qtbase5-private-dev \
    qtwayland5-private-dev
if [ ! -d QGnomePlatform-0.9.0 ]; then
    if [ ! -f QGnomePlatform-0.9.0.tar.gz ]; then
        curl -L -o QGnomePlatform-0.9.0.tar.gz https://github.com/FedoraQt/QGnomePlatform/archive/refs/tags/0.9.0.tar.gz
    fi
    tar -xzvf QGnomePlatform-0.9.0.tar.gz
    sed -i 's|find_package(AdwaitaQt "1.4.2" REQUIRED)|find_package(AdwaitaQt "1.2.0" REQUIRED)|g' QGnomePlatform-0.9.0/CMakeLists.txt
    sed -i 's|Adwaita::Colors::palette(useGtkThemeDarkVariant() ? Adwaita::ColorVariant::AdwaitaHighcontrastInverse : Adwaita::ColorVariant::AdwaitaHighcontrast));|Adwaita::Colors::palette(Adwaita::ColorVariant::AdwaitaHighcontrast));|g' QGnomePlatform-0.9.0/src/common/gnomesettings.cpp
fi
cd QGnomePlatform-0.9.0
rm -rf build
mkdir build
cd build
cmake ..
if [ ! -f libadwaitaqt-dev_1.4.2-3_amd64.deb ]; then
    curl -LO http://ftp.de.debian.org/debian/pool/main/a/adwaita-qt/libadwaitaqt-dev_1.4.2-3_amd64.deb
fi
dpkg --force-all -i libadwaitaqt-dev_1.4.2-3_amd64.deb
make
apt-get install -y -f
apt-get install -y \
    libadwaitaqt-dev
(echo; echo "Qt 5 extra widget styles - GNOME Platform theme"; echo) | checkinstall -t debian --pkgname=qgnomeplatform-qt5
