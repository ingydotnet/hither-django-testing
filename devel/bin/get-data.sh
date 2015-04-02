#!/bin/bash

# Links:
# https://docs.djangoproject.com/en/1.7/howto/initial-data/
# https://data.seattle.gov/
# https://data.seattle.gov/api/views/65fc-btcc/rows.csv?accessType=DOWNLOAD
# https://docs.djangoproject.com/en/1.7/intro/tutorial01/

set -e

dataset_url=https://data.seattle.gov/api/views/65fc-btcc/rows.csv?accessType=DOWNLOAD
dataset=dataset.csv

if [ ! -f "$dataset" ]; then
  curl "$dataset_url" > "$dataset"
fi
