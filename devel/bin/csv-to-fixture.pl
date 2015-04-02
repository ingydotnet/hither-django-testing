#!/usr/bin/env perl

use strict;
use warnings;
use Text::CSV::Slurp;
use XXX;
use YAML::XS;

# - CAMERALABEL: Airport Way S & S Norfolk St
#   IMAGEURL: http://www.seattle.gov/trafficcams/images/Airport_Norfolk.jpg
#   LOCATION: '(47.51369, -122.28819)'
#   OWNERSHIPCD: SDOT
#   VIDEOURL: rtmp://156.74.125.142:1935/live&file=Airport_Norfolk.stream
#   WEBURL: NULL
#   XPOS: -122.28819
#   YPOS: 47.51369

my $data = Text::CSV::Slurp->load(file => 'dataset.csv');
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
