package Ratfinder::GUI::Dmenu;
use feature ':5.10';
use Moose;

extends 'Ratfinder::GUI';


sub prompt {
  my ($self, $text, @completions) = @_ ;
  open my $fh , "|dmenu -i";
  print $fh join("\n",@completions);
  close $fh;
}

sub print {
	my ($self, $text) = @_ ;
	`ratpoison -c "echo $text"`;
}

no Moose;
__PACKAGE__->meta->make_immutable;
1; # End of Ratfinder::GUI;

