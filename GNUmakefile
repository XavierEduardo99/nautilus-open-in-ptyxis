BIN_NAME = nautilus-open-in-ptyxis
EXT_PATH = src/nautilus-open-in-ptyxis.py
TARGET_DIR = /usr/share/nautilus-python/extensions
I18N_DIR = /usr/share/locale/
I18N_LOCALE_DIR = i18n/locale/

.PHONY: all install restart-nautilus

all: install

install:
	@echo "Installing extension..."
	@if [ "$$(id -u)" != "0" ]; then \
		echo "This target must be run as root. Use sudo."; \
		exit 1; \
	fi
	@install -d "$(TARGET_DIR)"
	@install -m 644 "$(EXT_PATH)" "$(TARGET_DIR)"

	@for f in i18n/locale/*/LC_MESSAGES/*.mo; do \
		lang=$$(echo $$f | cut -d'/' -f3); \
		dest="$(I18N_DIR)$$lang/LC_MESSAGES"; \
		echo "Installing $$f → $$dest"; \
		install -d -m 755 "$$dest"; \
		install -m 644 "$$f" "$$dest"; \
	done

restart-nautilus:
	@printf "Restart Nautilus(Files)? [y/N] "
	@read ans; \
	if [ "$$ans" = "y" ] || [ "$$ans" = "Y" ] || [ "$$ans" = "" ]; then \
		@nautilus -q; \
	fi

.PHONY: update-i18n
update-i18n:
	@xgettext --from-code=UTF-8 --language=Python --keyword=_ --keyword=gettext \--output=i18n/$(BIN_NAME).pot src/nautilus-open-in-ptyxis.py
	@for f in i18n/*.po; do \
		msgmerge --update "$$f" i18n/$(BIN_NAME).pot; \
	done

.PHONY: i18n
i18n:
	@rm -rf $(I18N_LOCALE_DIR)

	@for f in i18n/*.po; do \
		lang=$$(basename $$f .po); \
		outdir="$(I18N_LOCALE_DIR)$$lang/LC_MESSAGES"; \
		mkdir -p "$$outdir"; \
		msgfmt "$$f" -o "$$outdir/$(BIN_NAME).mo"; \
		chmod 644 "$(I18N_LOCALE_DIR)$$lang/LC_MESSAGES/$(BIN_NAME).mo"; \
		chmod 755 "$(I18N_LOCALE_DIR)$$lang/LC_MESSAGES/"; \
		chmod 755 "$(I18N_LOCALE_DIR)$$lang/"; \
	done
