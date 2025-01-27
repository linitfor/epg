#!/usr/bin/perl -w

use strict;
use XML::TreePP;

# List your XMLTV files here
my @files = ('1.xml', '2.xml', '3.xml');
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
