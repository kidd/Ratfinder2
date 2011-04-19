package Ratfinder::Command::Plugin::Find;
use Moose::Role;
use feature ':5.10';

has configfile => (is => 'rw', isa => 'Str', default => '/home/kidd/.rf2config');

sub keywords { qw/find gen/ } ;

sub foo {
	'subclass'
}

sub gen {
  my $self = shift;
  system "find ~/ >~/.ratfinder2rc";
}

sub find {
	my $self = shift;
	say "I'm on find";
        my $pattern = $self->gui->prompt("pattern");
        open my $file ,'<', "/home/kidd/.ratfinder2rc";
        my @res = grep {/$pattern/} <$file>;
        say "@res";
        close $file;
}



#__PACKAGE__->meta->make_immutable;
1; # End of Ratfinder::Plugin::Dictionary;
