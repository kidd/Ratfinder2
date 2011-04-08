#!/usr/bin/perl

#use rlib;
use FindBin;
use lib "$FindBin::Bin/../lib";


use feature ':5.10';
use Data::Dumper;
use Getopt::Long;
use Pod::Usage;
use strict;
use warnings;
use Ratfinder;

sub man {#{{{
	pod2usage(
		-exitval => 1,
		-verbose => 2
	);
}#}}}

# main
GetOptions (
	'man' => \&man,
);

my $token = <STDIN>;
chomp $token;

my $rf = Ratfinder->new;
#say $rf->foo;
#$rf->load_plugin("Dictionary");
#say $rf->foo;

#print "My plugins are: ".join(", ", $rf->_plugin_locator->plugins)."\n";
#my @a = $rf->_plugin_locator->plugins;
#$rf->load_plugins(map ("+$_",@a));

say $rf->first_token($token);

#say $rf->accepts($token);
#say $rf->accepts('dict');

#say $rf->generate_classes


__END__#{{{

=head1 NAME


=head1 SEE ALSO


=head1 SYNOPSIS


=head1 DESCRIPTION

=head1 AUTHOR

Raimon Grau Cuscó <raimonster@gmail.com>

=head1 Credits

=cut

# vim: set tabstop=4 shiftwidth=4 foldmethod=marker : ###}}}
