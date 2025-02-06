#!/usr/bin/perl -w

use strict;
use XML::TreePP;

# List your XMLTV files here
my @files = ('./epg/1.xml', './epg/2.xml', './epg/3.xml', './epg/4.xml', './epg/5.xml', './epg/6.xml', './epg/7.xml', './epg/8.xml', './epg/9.xml', './epg/10.xml', 
'./epg/11.xml', './epg/12.xml', './epg/13.xml', './epg/14.xml', './epg/15.xml', './epg/16.xml', './epg/17.xml', './epg/18.xml', './epg/19.xml', './epg/20.xml', 
'./epg/21.xml', './epg/22.xml', './epg/23.xml', './epg/24.xml', './epg/25.xml', './epg/26.xml', './epg/27.xml', './epg/28.xml', './epg/29.xml', './epg/30.xml', 
'./epg/31.xml', './epg/32.xml', './epg/33.xml', './epg/34.xml', './epg/35.xml', './epg/36.xml', './epg/37.xml', './epg/38.xml',
#'./epg/39.xml', './epg/40.xml', 
#'./epg/41.xml', './epg/42.xml', 
#'./epg/43.xml', './epg/44.xml', './epg/45.xml', './epg/46.xml', './epg/47.xml', 
'./epg/48.xml', './epg/49.xml', './epg/50.xml', 
'./epg/51.xml', './epg/52.xml', './epg/53.xml', './epg/54.xml', './epg/55.xml', './epg/56.xml', './epg/57.xml', './epg/58.xml', './epg/59.xml', './epg/60.xml',
'./epg/61.xml');
my $output_file = 'merged.xml';

my $tpp = XML::TreePP->new();
$tpp->set(force_array => ['channel', 'programme']);

# Parse the first file
my $xmltv = $tpp->parsefile(shift @files);

# Merge each additional file
foreach my $file (@files) {
    my $xmltv_to_merge = $tpp->parsefile($file);

    # Merge channels
    foreach my $channel (@{ $xmltv_to_merge->{'tv'}->{'channel'} }) {
        push(@{ $xmltv->{'tv'}->{'channel'} }, $channel);
    }

    # Merge programmes
    foreach my $programme (@{ $xmltv_to_merge->{'tv'}->{'programme'} }) {
        push(@{ $xmltv->{'tv'}->{'programme'} }, $programme);
    }
}

# Write the combined XMLTV data to file
open my $fh, '>', $output_file or die "Could not open '$output_file' $!";
print $fh $tpp->write($xmltv);
close $fh;

print "EPG files merged successfully into $output_file\n";
