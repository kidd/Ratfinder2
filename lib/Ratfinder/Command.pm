package Ratfinder::Command;
use Moose;
use feature ':5.10';
with 'MooseX::Object::Pluggable';

has gui => (is =>'ro', isa =>'Ratfinder::GUI');


sub accepts {
	my ($self, $word) = @_ ;
	grep {$_ eq $word }
		$self->keywords;
}

no Moose;
__PACKAGE__->meta->make_immutable;
1; # End of Ratfinder::GUI;

