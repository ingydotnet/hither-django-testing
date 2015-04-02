DJANGO_APP := data_viewer
DATASETS_SRC := ../../../dataset/src
DATASETS_DIR := ../../../dataset/csv
DATASETS := $(shell cd $(DATASETS_SRC); echo *)
FIXTURES_DIR := $(DJANGO_APP)/fixtures
FIXTURES := $(DATASETS:%=$(FIXTURES_DIR)/%.yaml)

default:

all: fixtures

fixtures: $(FIXTURES)

$(FIXTURES):
	perl ./src/bin/csv-to-fixture.pl \
	    $(DATASETS_DIR)/$(@:$(FIXTURES_DIR)/%.yaml=%).csv > $@

clean:
	git clean -dxf

clean-fixtures:
	rm -f $(FIXTURES_DIR)/*

force:
