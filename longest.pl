# Copyright (C) 2018 David Lichti
#
# This file is part of LongestWord and published under the BSD-3-Cluse license.

use strict;
use warnings;

use List::Util "reduce";

use Data::Dumper;

my $dict_file_name = 'words.txt';

open(DICT_FILE, "<$dict_file_name") or die "Could not open dctionary file, $!";

print "Reading dictionary";
my @dict = <DICT_FILE>;
chomp(@dict);
my $words = scalar(@dict);
print ": $words words\n";

print "Longest word";
my $longest = reduce { length($a) > length($b) ? $a : $b } @dict;
my $length = length($longest);
print ": '$longest' ($length characters)\n";

print "All words of maximal length:\n";
map { if (length($_) == $length) { print "   $_\n"; } } @dict;

print "Longest 7-segment word";
my @words_7seg = grep {/^[AbcCdEFhHiJlnoPqrStuy]+$/i} @dict;
my $longest_7seg = reduce { length($a) > length($b) ? $a : $b } @words_7seg;
my $length_7seg = length($longest_7seg);
print ": '$longest_7seg' ($length_7seg characters)\n";

print "All 7-segment words of maximal length:\n";
map { if (length($_) == $length_7seg) { print "   $_\n"; } } @words_7seg;
