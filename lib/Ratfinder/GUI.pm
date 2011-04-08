package Ratfinder::GUI;
use feature ':5.10';
use Moose;

sub prompt {
	my ($self, $text) = @_ ;
	system("ratpoison -c 'echo $text'")
}

sub print {
	my ($self, $text) = @_ ;
	`ratpoison -c "prompt $text"`;
}

no Moose;
__PACKAGE__->meta->make_immutable;
1; # End of Ratfinder::GUI;

