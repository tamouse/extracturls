#!/usr/bin/perl -w
#
# extracturls.pl -- perl script to pull out URLs in an HTML document
#
# Yes, it's been done a million times, and here's one more
#
# Author: Tamara Temple <tamara@tamaratemple.com>
# Copyright: (c) 2012 Tamara Temple Web Development
# License: GPLv2+
# Version: 2012-11-30
# 

use strict;
use HTML::TagParser ();
use Data::Dumper::Names;

my $p = HTML::TagParser->new ();

if ($#ARGV >= 0) {
	foreach my $fn (@ARGV) {
		$p->open($fn);
		extract($p);
	}
} else {
	$p->open(<STDIN>);
	extract($p);
}

##
# extract -- pull out URL in <a> and <img> tags
##
sub extract {
	my $p = shift;
	my @anchors = $p->getElementsByTagName('a');
	foreach my $anchor (@anchors) {
		my $href = $anchor->getAttribute('href');
		print "$href\n" if $href;
	}
	my @images = $p->getElementsByTagName('img');
	foreach my $img (@images) {
		my $src = $img->getAttribute('src');
		print "$src\n" if $src;
	}
}
