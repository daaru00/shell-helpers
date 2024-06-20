build:
	chmod +x ./package/usr/local/bin/*
	chmod +x ./package/DEBIAN/postinst
	dpkg --build ./package ./dist/shell-helpers.deb # generate DEB package
	sudo alien -r --scripts ./dist/shell-helpers.deb && mv -f *.rpm ./dist/shell-helpers.rpm  # generate RPM package
	sudo alien -t ./dist/shell-helpers.deb && mv -f *.tgz ./dist/shell-helpers.tgz  # generate TGZ archive

install:
	sudo dpkg -i ./dist/shell-helpers.deb

remove:
	sudo dpkg -r -P ./dist/shell-helpers.deb

commands:
	echo "# Commands\n" > ./doc/COMMANDS.md # init doc file
	find package/usr/local/bin -type f -exec bash -c 'for script do echo "## $$(basename "$$script")"; echo "---"; "$$script" -h; echo "---"; done' bash {} + >> ./doc/COMMANDS.md
	sed -i 's/---/```/g' ./doc/COMMANDS.md # format code
	sed -i '/^$$/d' ./doc/COMMANDS.md # remove empty rows
