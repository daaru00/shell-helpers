build:
	chmod +x ./package/usr/local/bin/*
	chmod +x ./package/DEBIAN/postinst
	dpkg-deb --build --root-owner-group ./package ./dist/shell-helpers.deb

pack:
	chmod +x ./package/usr/local/bin/*
	tar -cvf ./dist/shell-helpers.tar -C ./package/usr/local/bin .

unpack:
	sudo tar -xf ./dist/shell-helpers.tar -C /usr/local/bin

install:
	sudo dpkg -i ./dist/shell-helpers.deb

remove:
	sudo dpkg -r -P ./dist/shell-helpers.deb
