TAP=kintone/tap
FORMULAE=cli-kintone

.PHONY: debug-livecheck

livecheck:
	brew livecheck --debug $(FORMULAE)

install:
	HOMEBREW_NO_INSTALL_FROM_API=1 brew install --build-from-source $(FORMULAE)

build:
	HOMEBREW_NO_INSTALL_FROM_API=1 brew install --build-from-source --verbose --debug $(FORMULAE)

test:
	brew test $(FORMULAE)

audit:
	brew audit --strict --online --tap $(TAP)

clean:
	brew uninstall $(FORMULAE)
