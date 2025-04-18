TEXMF := $(shell kpsewhich -var-value=TEXMFHOME)

.PHONY: all install autocomplete

# The first rule in a Makefile is the one executed by default ("make"). It
# should always be the "all" rule, so that "make" and "make all" are identical.
all:
	echo "Install lmacros package to TEXMF-folder by running 'make install'."
	echo "Install lmacros autocompletion for TeXstudio by running 'make autocomplete'."

install:
	echo Installing package lmacros.sty to \"${TEXMF}\"...
	mkdir -p "${TEXMF}/tex/latex"
	rm -f "${TEXMF}/tex/latex/lmacros.sty"
	ln -f -s "${PWD}/lmacros.sty" "${TEXMF}/tex/latex/lmacros.sty"

# Setup the LaTeX-package and everything for compilation
autocomplete:
	# Link autocomplete file into TeXstudio
	if [ -d ${HOME}/.config/texstudio/completion/ ]; then \
		rm -f ${HOME}/.config/texstudio/completion/autogenerated/lmacros.cwl; \
		ln -f -s ${PWD}/lmacros.cwl ${HOME}/.config/texstudio/completion/user/lmacros.cwl; \
		echo "Link created! Restart TeXstudio for the changes to take effect."; \
	fi
