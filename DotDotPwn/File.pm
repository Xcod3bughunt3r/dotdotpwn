#!/usr/bin/perl

package DotDotPwn::File;
use Exporter 'import';
@EXPORT = qw(split_dirname_filename);

use DotDotPwn::TraversalEngine; # To get the (back)slashes encodings (@Slashes)

sub split_dirname_filename{
	my $trav = shift;
	my $dirname, $filename;

	foreach (@DotDotPwn::TraversalEngine::Slashes){
		if(($last_slash_index = rindex($trav, $_)) != -1){
			$dirname  = substr($trav, 0, $last_slash_index + length);
			$filename = substr($trav, $last_slash_index + length);
		}
	}

	return ($dirname, $filename);
}
