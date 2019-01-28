## requires installation of pandoc (pandoc.org) and a working LaTeX distribution, with
## some standard packages

TARGET=src/version_control

all: pdf gfm

pdf:
	pandoc --standalone --toc --listings --template src/template.tex -o version_control.pdf $(TARGET).md

gfm:
	pandoc --standalone --toc -t gfm -o README.md $(TARGET).md

tex:
	pandoc --standalone --toc --listings --template src/template.tex -o version_control.tex $(TARGET).md
