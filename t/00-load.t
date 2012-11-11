#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'Summerset::IsbnConverter' ) || print "Bail out!\n";
}

diag( "Testing Summerset::IsbnConverter $Summerset::IsbnConverter::VERSION, Perl $], $^X" );
