.DEFAULT_GOAL := auto_build
.PHONY: all auto_build remote build bib clean

COMPILER = xelatex
OUTPUT = build
FILENAME = history-ia
OPTIONS = -interaction=nonstopmode -output-directory=${OUTPUT}

all: auto_build clean markdown docx

auto_build:
	@${make_build_dir}
	@echo "Running latexmk"
	@latexmk -${COMPILER} ${OPTIONS} ${FILENAME}
	@${copy_pdf}

markdown:
	@pandoc --wrap=none --bibliography bibliography.bib -f latex -t markdown ${FILENAME}.tex -o ${FILENAME}.md

docx:
	@pandoc --wrap=none --bibliography bibliography.bib -f latex -t docx ${FILENAME}.tex -o ${FILENAME}.docx

remote:
	@ssh desktop 'rm -r /tmp/latex/${FILENAME}/ ; mkdir -p /tmp/latex/${FILENAME}/'
	@scp -r ./* desktop:/tmp/latex/${FILENAME}
	@ssh desktop 'cd /tmp/latex/${FILENAME} && make'
	@scp desktop:/tmp/latex/${FILENAME}/${FILENAME}.pdf .

build:
	@echo "Compiling document"
	@${make_build_dir}
	@${COMPILER} ${OPTIONS} ${FILENAME}
	@${copy_pdf}

bib:
	@echo "Building bibliography"
	@${make_build_dir}
	@biber --output-directory ${OUTPUT} ${FILENAME}

clean:
	@${copy_pdf}
	@echo "Cleaning up..."
	@rm -r build || true

gitclean:
	@echo "Cleaning up ignored files..."
	@git clean -fXd

define copy_pdf
	echo "Copying PDF"
	cp build/${FILENAME}.pdf . || echo "Copying failed :("
endef

define make_build_dir
	echo "Making build dir"
	mkdir ./build || true
endef
