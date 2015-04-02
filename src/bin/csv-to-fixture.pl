#!/usr/bin/env perl

use strict;
use warnings;
use Text::CSV::Slurp;
use YAML::XS;

# Dataset: https://data.seattle.gov/api/views/65fc-btcc/rows.csv
#
# OWNERSHIPCD: SDOT
# CAMERALABEL: Airport Way S & S Norfolk St
# IMAGEURL: http://www.seattle.gov/trafficcams/images/Airport_Norfolk.jpg
# VIDEOURL: rtmp://156.74.125.142:1935/live&file=Airport_Norfolk.stream
# WEBURL: NULL
# XPOS: -122.28819
# YPOS: 47.51369
# LOCATION: '(47.51369, -122.28819)'

my $input_file = shift;
my $data = Text::CSV::Slurp->load(file => $input_file);
my $fixture = [];
my $i = 1;

for my $d (@$data) {
    push @$fixture, {
        model => 'data_viewer.trafficcams',
        pk => $i++,
        fields => {
            camera_label => $d->{CAMERALABEL},
            x_pos => $d->{XPOS},
            y_pos => $d->{YPOS},
        }
    };
}

print Dump $fixture;
