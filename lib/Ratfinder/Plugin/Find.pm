package Ratfinder::Plugin::Find;
use Moose::Role;
use feature ':5.10';




sub keywords { qw/find/ } ;
sub pretty{ print "I am pretty" }

sub accepts {
	my ($self, $word) = @_ ;
	say $self->pretty;
	grep {$_ eq $word }
		$self->keywords;
}

sub foo {
	'subclass'
}

sub find {
	my $self = shift;
	say "I'm on find";
}

#__PACKAGE__->meta->make_immutable;
1; # End of Ratfinder::Plugin::Dictionary;

