#!/usr/bin/perl

package DotDotPwn::STDOUT;
use Exporter 'import';
@EXPORT = qw(toSTDOUT);

sub toSTDOUT{
	foreach(@main::traversals){
		print $_ . "\n";
	}
}
