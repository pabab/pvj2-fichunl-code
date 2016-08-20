PROJECTFILES := $(shell find -name Project.xml)
PROJECTDIRS := $(patsubst %/Project.xml,%,$(PROJECTFILES))
SWFS := $(foreach D,$(PROJECTDIRS),$D.a)

all:
	
	echo $(PROJECTDIRS)
	

swf: $(SWFS)

zip:
	mkdir -p _zip
	$(foreach var,$(PROJECTDIRS), zip _zip/$(var).zip $(var)/* -r)
	#zip _zip/$$d.zip $$d/* -r \ done;

zip_clean:
	rm -rf _zip/*

%/Project.xml:
	echo $@ $<
