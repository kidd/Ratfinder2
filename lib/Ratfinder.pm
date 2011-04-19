package Ratfinder;

use Moose;
use feature ':5.10';
use Data::Dumper;
use Ratfinder::Command;
use Ratfinder::GUI;
use Ratfinder::GUI::Dmenu;

with 'MooseX::Object::Pluggable';

has gui => (is =>'ro',
            isa =>'Ratfinder::GUI',
            default => sub {Ratfinder::GUI::Dmenu->new});

has my_plugins => (is =>'ro',
                   isa =>'ArrayRef',
                   default => \&generate_classes);

sub generate_classes {
	my ($self) = @_;
	my @a = Ratfinder::Command->new->_plugin_locator->plugins;
	[map {my $tmp =Ratfinder::Command->new(gui=>$self->gui);
			$tmp->load_plugin("+$_");
			$tmp }
					@a]
}

sub first_token {
  my $self = shift;
  my $token = shift;
  print "My plugins are: ", map($_->_original_class_name, @{$self->my_plugins}) ,"\n";
  for (@{$self->my_plugins}) {
    say $token;
    if ($_->accepts($token)) {
      say $_ , ' accepts it';
      $_->$token;
    }
  }
}

sub keywords {
  my $self = shift;
  my @a = map { $_->keywords }  @{$self->my_plugins} ;
}

sub who_matches {
	my ($self, $word) = @_;
	return first(grep {$_->matches($word) } @{$self->my_plugins});
}

#no Moose;
#__PACKAGE__->meta->make_immutable;
1; # End of Ratfinder;
