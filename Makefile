SHELL := /bin/bash
#
# Project Name : testdoc
# Author(s) : Mathieu Butel <mat.bultel@gmail.com>
# Maxime Adau <maxadau@gmail.com>


# @todo
#CSS=../tests.css

TESTCASE_PATH=		testcase/
SCENARII_PATH=		scenarii/
PDF_PATH=		pdf/
TESTS=			$(shell ls $(SCENARII_PATH))

.SUFFIXES: .rst .pdf .html

all: prepare scenarii end

scenarii: $(foreach test,$(shell ls $(SCENARII_PATH) | grep -v '~'),$(SCENARII_PATH)$(test:.rst=.pdf));

prepare:
	rm -f $(SCENARII_PATH)*~
	rm -f $(SCENARII_PATH)*.pdf

.rst.pdf:
	rst2pdf $? > $@

scenarii: $(foreach test, $(TESTS),$(SCENARII_PATH)$(test:.rst=.pdf));

end:
	mv $(SCENARII_PATH)*.pdf pdf/


clean:
	rm -f $(PDF_PATH)/*

.PHONY: all clean
