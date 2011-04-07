package Ratfinder;

use Moose;
use feature ':5.10';
use Data::Dumper;
with 'MooseX::Object::Pluggable';

#sub get_plugins {
	#my $self = shift;
	#print "My plugins are: ".join(", ", $self->_plugin_locator->plugins)."\n";
	#[ $self->_plugin_locator->plugins ]
#}

#has plugins => (is =>'ro', isa =>'ArrayRef', default => \&get_plugins);

sub first_token {
	my $self = shift;
	my $token = shift;
	print "My plugins are: ".join(", ", $self->_plugin_locator->plugins)."\n";
	my @a = $self->_plugin_locator->plugins;

	$self->load_plugins(map ("+$_",@a));
	for (@a){
		if ($_->accepts($token)){
			say $_ , ' accepts it';
				#$_->$token;
		}
	}
}

sub foo {
	'hola'
}


#sub accepts {
	#my ($self, $word)= @_;
#}

#no Moose;
#__PACKAGE__->meta->make_immutable;
1; # End of Ratfinder;
