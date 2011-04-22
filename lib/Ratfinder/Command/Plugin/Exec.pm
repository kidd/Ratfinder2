package Ratfinder::Command::Plugin::Exec;
use Moose::Role;
use feature ':5.10';

sub keywords { my @commands=`dmenu_path`; chomp @commands; @commands,'exec' } ;

sub exec {
  my $self = shift;
    warn("fdsa");
  my $cmd = shift;
  $cmd = $self->gui->prompt('a', `dmenu_path`);
  $self->gui->echo(split(/\s+/, $cmd));
  system $cmd
}
  # sub AUTOLOAD {
  #   Shell->new
  # }

#__PACKAGE__->meta->make_immutable;
1; # End of Ratfinder::Plugin::Dictionary;

