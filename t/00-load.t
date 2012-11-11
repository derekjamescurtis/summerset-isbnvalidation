#!/usr/bin/env perl
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More tests => 12;


BEGIN {
    use_ok( 'Summerset::IsbnConverter' ) || print "Bail out!\n";
}

diag( "Testing Summerset::IsbnConverter $Summerset::IsbnConverter::VERSION, Perl $], $^X" );

# validateIsbn10
cmp_ok(Summerset::IsbnConverter::validateIsbn10('0-395-04089-2'), '==', 1); 
cmp_ok(Summerset::IsbnConverter::validateIsbn10('0-937383-18-X'), '==', 1); 
cmp_ok(Summerset::IsbnConverter::validateIsbn10('0-937383-18-0'), '==', 0); # invalid isbn
cmp_ok(Summerset::IsbnConverter::validateIsbn10(undef), '==', 0);

# validateIsbn13
cmp_ok(Summerset::IsbnConverter::validateIsbn13('978-0-937383-18-6'), '==', 1);
cmp_ok(Summerset::IsbnConverter::validateIsbn13('978-0-937383-18-7'), '==', 0); # invalid isbn
cmp_ok(Summerset::IsbnConverter::validateIsbn13(undef), '==', 0);

# convertToIsbn10
cmp_ok(Summerset::IsbnConverter::convertToIsbn10('9780395040898'), 'eq', '0395040892');
is(Summerset::IsbnConverter::convertToIsbn10('234234'), undef); # invalid length

# convertToIsbn13
cmp_ok(Summerset::IsbnConverter::convertToIsbn13('0395040892'), 'eq', '9780395040898');
is(Summerset::IsbnConverter::convertToIsbn13('234234'), undef); # invalid length
