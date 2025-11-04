#!/usr/bin/env perl

use strict;
use warnings;

use English;
use Error::Pure qw(err);
use File::Find::Rule;
use MARC::File::XML (BinaryEncoding => 'utf8', RecordFormat => 'MARC21');

our $VERSION = 0.02;

my @xml_files = File::Find::Rule->file->in('examples');

my $sorted_marc_hr;
foreach my $xml_file (@xml_files) {
	my $marc_file = MARC::File::XML->in($xml_file);
	while (1) {
		my $record = eval {
			$marc_file->next;
		};
		if ($EVAL_ERROR) {
			print STDERR "Error: $EVAL_ERROR\n";
			next;
		}
		if (! defined $record) {
			last;
		}

		my $field_001 = $record->field('001')->as_string;
		if (exists $sorted_marc_hr->{$field_001}) {
			warn "Duplicate record '$field_001'.\n";
			next;
		}
		$sorted_marc_hr->{$field_001} = $record;
	}
}

# Compose to output.
my $marc_output = MARC::File::XML->out('output.xml');
foreach my $field_001 (sort keys %{$sorted_marc_hr}) {
	$marc_output->write($sorted_marc_hr->{$field_001});
}
$marc_output->close;
