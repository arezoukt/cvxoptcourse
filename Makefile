DOCS=index contact slides resources homework info schedule

HDOCS=$(addsuffix .html, $(DOCS))
PHDOCS=$(HDOCS)

.PHONY: default
default: docs

.PHONY : docs
docs : $(PHDOCS)

%.html : %.jemdoc MENU
	@printf 'Running jemdoc\n'
	~/jemdoc/jemdoc.py -o $@ $<

.PHONY : update
update : $(PHDOCS)
	@echo -n 'Copying to server...'
	sudo git add --all
	sudo git commit
	sudo git push origin main
	@echo ' done.' 

.PHONY : clean
clean :
	-rm -f *.html

