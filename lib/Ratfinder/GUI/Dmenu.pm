package Ratfinder::GUI::Dmenu;
use feature ':5.10';
use Moose;
use IPC::Open2;
use IO::Handle;

extends 'Ratfinder::GUI';

sub prompt {
  my ($self, $text, @completions) = @_ ;
  my ($wrt, $rdr) = (IO::Handle->new, IO::Handle->new );
  my $pid = open2($rdr, $wrt, 'dmenu -i' );
  print $wrt join("\n",@completions);
  $wrt->close;
  my $got = <$rdr>;
  wait;
  $got;
}

sub print {
  my ($self, $text) = @_ ;
  `ratpoison -c "echo $text"`;
}

sub echo {
  &print
}

no Moose;
__PACKAGE__->meta->make_immutable;
1; # End of Ratfinder::GUI;

