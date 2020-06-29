PROJ_VERSION = 7.0.1

install_proj:
	sudo apt update
	sudo apt install -y clang

	# Needed only for proj install
	sudo apt install -y wget build-essential pkg-config sqlite3 libsqlite3-dev

	# remove PROJ system version from packages
	sudo apt remove libproj-dev

	wget https://github.com/OSGeo/proj.4/releases/download/$(PROJ_VERSION)/proj-$(PROJ_VERSION).tar.gz
	tar -xzvf proj-$(PROJ_VERSION).tar.gz
	pushd proj-$(PROJ_VERSION)
	./configure --prefix=/usr && make
	sudo make install
	popd
	rm -rf proj-$(PROJ_VERSION) proj-$(PROJ_VERSION).tar.gz
