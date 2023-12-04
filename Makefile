.PHONY: run check build vsh

ODIN_FLAGS ?= -debug -o:none

bug3: clean
	odin build . $(ODIN_FLAGS)
	odin run .

clean:
	rm -f bug3
