package Ratfinder::Command;#body ...
use Moose;
use feature ':5.10';
with 'MooseX::Object::Pluggable';

has gui => (is =>'ro', isa =>'Ratfinder::GUI');

sub accepts {
	my ($self, $word) = @_ ;
	grep {$_ eq $word }
		$self->keywords;
}

sub matches {
	my ($self, $word ) = @_;
	say "hola";
	#return ($word =~ /$self->pattern/)
}

no Moose;
__PACKAGE__->meta->make_immutable;
1; # End of Ratfinder::GUI;

