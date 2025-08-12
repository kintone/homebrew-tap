TAP=kintone/tap
FORMULAE=cli-kintone

.PHONY: livecheck install build test style	audit clean

livecheck:
	brew livecheck --debug $(FORMULAE)

install:
	HOMEBREW_NO_INSTALL_FROM_API=1 brew install --build-from-source $(FORMULAE)

build:
	HOMEBREW_NO_INSTALL_FROM_API=1 brew install --build-from-source --verbose --debug $(FORMULAE)

check:
	brew style $(TAP)
	brew readall --aliases --os=all --arch=all kintone/tap
	brew audit --strict --online --tap $(TAP)

test:
	brew test $(FORMULAE)

clean:
	brew uninstall $(FORMULAE)
