build:
	chmod +x ./package/usr/local/bin/*
	chmod +x ./package/DEBIAN/postinst
	dpkg-deb --build --root-owner-group ./package ./dist/shell-helpers.deb
	sudo alien -r --scripts ./dist/shell-helpers.deb && mv -f *.rpm ./dist/shell-helpers.rpm
	sudo alien -t ./dist/shell-helpers.deb && mv -f *.tgz ./dist/shell-helpers.tgz

install:
	sudo dpkg -i ./dist/shell-helpers.deb

remove:
	sudo dpkg -r -P ./dist/shell-helpers.deb
