DJANGO_APP := data_viewer
FIXTURE := $(DJANGO_APP)/fixtures/initial_data.yaml

default:

fixture: $(FIXTURE)

$(FIXTURE): $(DATASET)


clean:
	git clean -dxf

