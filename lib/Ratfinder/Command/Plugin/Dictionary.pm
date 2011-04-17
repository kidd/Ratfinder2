package Ratfinder::Command::Plugin::Dictionary;
use Moose::Role;
use feature ':5.10';

sub keywords { qw/dict/ } ;

sub pattern {
	my ($self) = @_;
	return ('def:.*');
}

sub foo {
	'subclass'
}

sub dict {
	my $self = shift;
	say "I'm on dict";
	$self->gui->prompt("fuck you");
}

#__PACKAGE__->meta->make_immutable;
1; # End of Ratfinder::Plugin::Dictionary;

