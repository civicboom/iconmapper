all: cb-iconmapper.deb

VERSION := $(shell git describe)

cb-iconmapper.deb: control Makefile
	rm -rf fs-iconmapper
	mkdir -p fs-iconmapper/DEBIAN/
	cp control fs-iconmapper/DEBIAN/control
	sed -i s/VERSION/${VERSION}/ fs-iconmapper/DEBIAN/control
	mkdir -p fs-iconmapper/usr/bin
	cp iconmapper fs-iconmapper/usr/bin/
	fakeroot dpkg -b fs-iconmapper cb-iconmapper_${VERSION}_all.deb
	ln -sf cb-iconmapper_${VERSION}_all.deb cb-iconmapper.deb

clean:
	rm -rf fs-* cb-*.deb
