SHELL := /bin/bash
#
# Copyright (c) matbu & madau
# Licensed computer software. Property of MBU.
# Project Name : docauto
# Author(s) : Mathieu Butel <mat.bultel@gmail.com>
# Maxime Adau <maxadau@gmail.com>

# @todo
#CSS=../tests.css

TESTCASE_PATH=		testcase/
SCENARII_PATH=		scenarii/

SCENARII=		$(SCENARII_PATH)/demo.rst

PDF=			$(SCENARII:.rst=.pdf)

PDF_PATH=		pdf/


.SUFFIXES: .rst .pdf .html

all: scenarii

scenarii: $(PDF)
	mv $(SCENARII_PATH)*.pdf pdf/

.rst.pdf:
	rst2pdf $? > $@

clean:
	rm -f pdf/*.pdf

re: clean all

.PHONY: all user admin clean
