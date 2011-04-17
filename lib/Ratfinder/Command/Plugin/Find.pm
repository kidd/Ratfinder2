package Ratfinder::Command::Plugin::Find;
use Moose::Role;
use feature ':5.10';

sub keywords { qw/find/ } ;

sub foo {
	'subclass'
}

sub find {
	my $self = shift;
	say "I'm on find";
}

#__PACKAGE__->meta->make_immutable;
1; # End of Ratfinder::Plugin::Dictionary;
