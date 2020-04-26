SOURCE="https://github.com/ankitects/anki/releases/download/2.1.22/anki-2.1.22-linux-amd64.tar.bz2"
DESTINATION="build.tar.bz2"
OUTPUT="Anki.AppImage"


all:
	echo "Building: $(OUTPUT)"
	wget --output-document=$(DESTINATION) --continue $(SOURCE)

	tar -jxvf $(DESTINATION)
	rm -rf AppDir/opt

	mkdir --parents AppDir/opt/application
	cp -r anki-2.1.22-linux-amd64/bin/* AppDir/opt/application

	chmod +x AppDir/AppRun

	export ARCH=x86_64 && bin/appimagetool.AppImage AppDir $(OUTPUT)

	chmod +x $(OUTPUT)

	rm -f $(DESTINATION)
	rm -rf AppDir/opt
	rm -rf anki-2.1.22-linux-amd64
