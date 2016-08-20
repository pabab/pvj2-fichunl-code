PROJECTS := $(shell find $(SOURCEDIR) -name Project.xml)
PROJECTDIRS := $(patsubst %/Project.xml,%,$(PROJECTS))
SWFS := $(foreach D,$(PROJECTDIRS),$D.a)

all:
	echo $(PROJECTS)
	echo $(PROJECTDIRS)
	echo $(SWFS)

swf: $(SWFS)

zip:
	mkdir -p zip
	

%/Project.xml:
	echo $@ $<
